module fpgaradio(
    input clk_50m,
    input [7:0] adc_in,
    output ant
);
    wire clk_200m;
    wire [23:0] am_product;
    reg [7:0] pwm_cnt, crr_v;
    reg [11:0] phase;
    
    // assign am_product = (8'd128 +  adc_in) * crr_v;
    
    localparam [7:0] BIAS = 8'd127;
    wire [15:0] mul_audio = adc_in * crr_v;
    wire [15:0] mul_bias  = BIAS   * crr_v;
    wire [16:0] sum17     = {1'b0, mul_audio} + {1'b0, mul_bias};

    // 线性缩放到 8bit（先 >>8，若过小可用 >>7；若过大加饱和）
    wire [8:0] duty9 = sum17[16:8];
    wire [7:0] duty  = (duty9 > 9'd255) ? 8'd255 : duty9[7:0];

    pll u_pll(
        .inclk0(clk_50m),
        .c0(clk_200m)
    );
    
    pwm_counter u_pwm_counter(
        .clk(clk_200m),
        .cnt(pwm_cnt)
    );
    
    localparam int STEP_VAL = (700_000.0 / 200_000_000.0) * (2**12);
    
    phase_updater #(
        .STEP(STEP_VAL)
    ) u_phase_updater (
        .clk(clk_200m),
        .phase(phase)
    );
    
    cordic u_cordic(
        .clk(clk_200m),
        .a(phase),
        .c(crr_v)
    );
    
    pwm_cmp u_pwm_cmp(
        .pwm_cnt(pwm_cnt),
        .crr_v(duty),
        .ant(ant)
    );

endmodule

module pwm_counter(
    input clk,
    output reg [7:0] cnt
);
    always @(posedge clk) begin
        cnt <= cnt + 1;
    end
endmodule

module phase_updater #(
    parameter STEP = 12'd100
)(
    input clk,
    output reg [11:0] phase
);
    always @(posedge clk) begin
        phase <= phase + STEP;
    end
endmodule

module pwm_cmp(
    input [7:0] pwm_cnt,
    input [7:0] crr_v,
    output ant
);
    assign ant = (pwm_cnt < crr_v) ? 1'b1 : 1'b0;

endmodule