-- ------------------------------------------------------------------------- 
-- High Level Design Compiler for Intel(R) FPGAs Version 24.1std (Release Build #1077)
-- Quartus Prime development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice: Copyright 2025 Intel Corporation.  All rights reserved.
-- Your use of  Intel Corporation's design tools,  logic functions and other
-- software and  tools, and its AMPP partner logic functions, and any output
-- files any  of the foregoing (including  device programming  or simulation
-- files), and  any associated  documentation  or information  are expressly
-- subject  to the terms and  conditions of the  Intel FPGA Software License
-- Agreement, Intel MegaCore Function License Agreement, or other applicable
-- license agreement,  including,  without limitation,  that your use is for
-- the  sole  purpose of  programming  logic devices  manufactured by  Intel
-- and  sold by Intel  or its authorized  distributors. Please refer  to the
-- applicable agreement for further details.
-- ---------------------------------------------------------------------------

-- VHDL created from cordic_CORDIC_0
-- VHDL created on Fri Aug 29 10:29:59 2025


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY lpm;
USE lpm.lpm_components.all;

entity cordic_CORDIC_0 is
    port (
        a : in std_logic_vector(11 downto 0);  -- ufix12_en11
        c : out std_logic_vector(7 downto 0);  -- ufix8_en7
        s : out std_logic_vector(7 downto 0);  -- ufix8_en7
        clk : in std_logic;
        areset : in std_logic
    );
end cordic_CORDIC_0;

architecture normal of cordic_CORDIC_0 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cstOneOverK_uid6_sincosTest_q : STD_LOGIC_VECTOR (19 downto 0);
    signal cstArcTan2Mi_0_uid10_sincosTest_q : STD_LOGIC_VECTOR (16 downto 0);
    signal xip1E_1_uid16_sincosTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal yip1E_1CostZeroPaddingA_uid17_sincosTest_q : STD_LOGIC_VECTOR (19 downto 0);
    signal yip1E_1NA_uid18_sincosTest_q : STD_LOGIC_VECTOR (20 downto 0);
    signal yip1E_1sumAHighB_uid19_sincosTest_a : STD_LOGIC_VECTOR (22 downto 0);
    signal yip1E_1sumAHighB_uid19_sincosTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal yip1E_1sumAHighB_uid19_sincosTest_o : STD_LOGIC_VECTOR (22 downto 0);
    signal yip1E_1sumAHighB_uid19_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_1sumAHighB_uid19_sincosTest_q : STD_LOGIC_VECTOR (21 downto 0);
    signal invSignOfSelectionSignal_uid20_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_1CostZeroPaddingA_uid21_sincosTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal aip1E_1NA_uid22_sincosTest_q : STD_LOGIC_VECTOR (16 downto 0);
    signal aip1E_1sumAHighB_uid23_sincosTest_a : STD_LOGIC_VECTOR (19 downto 0);
    signal aip1E_1sumAHighB_uid23_sincosTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal aip1E_1sumAHighB_uid23_sincosTest_o : STD_LOGIC_VECTOR (19 downto 0);
    signal aip1E_1sumAHighB_uid23_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_1sumAHighB_uid23_sincosTest_q : STD_LOGIC_VECTOR (18 downto 0);
    signal xip1_1_topRange_uid25_sincosTest_in : STD_LOGIC_VECTOR (21 downto 0);
    signal xip1_1_topRange_uid25_sincosTest_b : STD_LOGIC_VECTOR (21 downto 0);
    signal xip1_1_mergedSignalTM_uid26_sincosTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal xMSB_uid28_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1_1_mergedSignalTM_uid32_sincosTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal aip1E_uid34_sincosTest_in : STD_LOGIC_VECTOR (17 downto 0);
    signal aip1E_uid34_sincosTest_b : STD_LOGIC_VECTOR (17 downto 0);
    signal xMSB_uid35_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid37_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid40_sincosTest_b : STD_LOGIC_VECTOR (21 downto 0);
    signal twoToMiSiYip_uid41_sincosTest_b : STD_LOGIC_VECTOR (21 downto 0);
    signal cstArcTan2Mi_1_uid42_sincosTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal xip1E_2_uid44_sincosTest_a : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1E_2_uid44_sincosTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1E_2_uid44_sincosTest_o : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1E_2_uid44_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_2_uid44_sincosTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal yip1E_2_uid45_sincosTest_a : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_2_uid45_sincosTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_2_uid45_sincosTest_o : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_2_uid45_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_2_uid45_sincosTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal aip1E_2_uid47_sincosTest_a : STD_LOGIC_VECTOR (19 downto 0);
    signal aip1E_2_uid47_sincosTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal aip1E_2_uid47_sincosTest_o : STD_LOGIC_VECTOR (19 downto 0);
    signal aip1E_2_uid47_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_2_uid47_sincosTest_q : STD_LOGIC_VECTOR (18 downto 0);
    signal xip1_2_uid48_sincosTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal xip1_2_uid48_sincosTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal yip1_2_uid49_sincosTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal yip1_2_uid49_sincosTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal aip1E_uid50_sincosTest_in : STD_LOGIC_VECTOR (16 downto 0);
    signal aip1E_uid50_sincosTest_b : STD_LOGIC_VECTOR (16 downto 0);
    signal xMSB_uid51_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid53_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid56_sincosTest_b : STD_LOGIC_VECTOR (20 downto 0);
    signal twoToMiSiYip_uid57_sincosTest_b : STD_LOGIC_VECTOR (20 downto 0);
    signal cstArcTan2Mi_2_uid58_sincosTest_q : STD_LOGIC_VECTOR (14 downto 0);
    signal xip1E_3_uid60_sincosTest_a : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1E_3_uid60_sincosTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1E_3_uid60_sincosTest_o : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1E_3_uid60_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_3_uid60_sincosTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal yip1E_3_uid61_sincosTest_a : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_3_uid61_sincosTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_3_uid61_sincosTest_o : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_3_uid61_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_3_uid61_sincosTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal aip1E_3_uid63_sincosTest_a : STD_LOGIC_VECTOR (18 downto 0);
    signal aip1E_3_uid63_sincosTest_b : STD_LOGIC_VECTOR (18 downto 0);
    signal aip1E_3_uid63_sincosTest_o : STD_LOGIC_VECTOR (18 downto 0);
    signal aip1E_3_uid63_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_3_uid63_sincosTest_q : STD_LOGIC_VECTOR (17 downto 0);
    signal xip1_3_uid64_sincosTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal xip1_3_uid64_sincosTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal yip1_3_uid65_sincosTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal yip1_3_uid65_sincosTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal aip1E_uid66_sincosTest_in : STD_LOGIC_VECTOR (15 downto 0);
    signal aip1E_uid66_sincosTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal xMSB_uid67_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid69_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid72_sincosTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal twoToMiSiYip_uid73_sincosTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal cstArcTan2Mi_3_uid74_sincosTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal xip1E_4_uid76_sincosTest_a : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1E_4_uid76_sincosTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1E_4_uid76_sincosTest_o : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1E_4_uid76_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_4_uid76_sincosTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal yip1E_4_uid77_sincosTest_a : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_4_uid77_sincosTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_4_uid77_sincosTest_o : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_4_uid77_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_4_uid77_sincosTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal aip1E_4_uid79_sincosTest_a : STD_LOGIC_VECTOR (17 downto 0);
    signal aip1E_4_uid79_sincosTest_b : STD_LOGIC_VECTOR (17 downto 0);
    signal aip1E_4_uid79_sincosTest_o : STD_LOGIC_VECTOR (17 downto 0);
    signal aip1E_4_uid79_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_4_uid79_sincosTest_q : STD_LOGIC_VECTOR (16 downto 0);
    signal xip1_4_uid80_sincosTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal xip1_4_uid80_sincosTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal yip1_4_uid81_sincosTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal yip1_4_uid81_sincosTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal aip1E_uid82_sincosTest_in : STD_LOGIC_VECTOR (14 downto 0);
    signal aip1E_uid82_sincosTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal xMSB_uid83_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid85_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid88_sincosTest_b : STD_LOGIC_VECTOR (18 downto 0);
    signal twoToMiSiYip_uid89_sincosTest_b : STD_LOGIC_VECTOR (18 downto 0);
    signal cstArcTan2Mi_4_uid90_sincosTest_q : STD_LOGIC_VECTOR (12 downto 0);
    signal xip1E_5_uid92_sincosTest_a : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1E_5_uid92_sincosTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1E_5_uid92_sincosTest_o : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1E_5_uid92_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_5_uid92_sincosTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal yip1E_5_uid93_sincosTest_a : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_5_uid93_sincosTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_5_uid93_sincosTest_o : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_5_uid93_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_5_uid93_sincosTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal aip1E_5_uid95_sincosTest_a : STD_LOGIC_VECTOR (16 downto 0);
    signal aip1E_5_uid95_sincosTest_b : STD_LOGIC_VECTOR (16 downto 0);
    signal aip1E_5_uid95_sincosTest_o : STD_LOGIC_VECTOR (16 downto 0);
    signal aip1E_5_uid95_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_5_uid95_sincosTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal xip1_5_uid96_sincosTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal xip1_5_uid96_sincosTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal yip1_5_uid97_sincosTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal yip1_5_uid97_sincosTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal aip1E_uid98_sincosTest_in : STD_LOGIC_VECTOR (13 downto 0);
    signal aip1E_uid98_sincosTest_b : STD_LOGIC_VECTOR (13 downto 0);
    signal xMSB_uid99_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid101_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid104_sincosTest_b : STD_LOGIC_VECTOR (17 downto 0);
    signal twoToMiSiYip_uid105_sincosTest_b : STD_LOGIC_VECTOR (17 downto 0);
    signal cstArcTan2Mi_5_uid106_sincosTest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal xip1E_6_uid108_sincosTest_a : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1E_6_uid108_sincosTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1E_6_uid108_sincosTest_o : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1E_6_uid108_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_6_uid108_sincosTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal yip1E_6_uid109_sincosTest_a : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_6_uid109_sincosTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_6_uid109_sincosTest_o : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_6_uid109_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_6_uid109_sincosTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal aip1E_6_uid111_sincosTest_a : STD_LOGIC_VECTOR (15 downto 0);
    signal aip1E_6_uid111_sincosTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal aip1E_6_uid111_sincosTest_o : STD_LOGIC_VECTOR (15 downto 0);
    signal aip1E_6_uid111_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_6_uid111_sincosTest_q : STD_LOGIC_VECTOR (14 downto 0);
    signal xip1_6_uid112_sincosTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal xip1_6_uid112_sincosTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal yip1_6_uid113_sincosTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal yip1_6_uid113_sincosTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal aip1E_uid114_sincosTest_in : STD_LOGIC_VECTOR (12 downto 0);
    signal aip1E_uid114_sincosTest_b : STD_LOGIC_VECTOR (12 downto 0);
    signal xMSB_uid115_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid117_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid120_sincosTest_b : STD_LOGIC_VECTOR (16 downto 0);
    signal twoToMiSiYip_uid121_sincosTest_b : STD_LOGIC_VECTOR (16 downto 0);
    signal cstArcTan2Mi_6_uid122_sincosTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal xip1E_7_uid124_sincosTest_a : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1E_7_uid124_sincosTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1E_7_uid124_sincosTest_o : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1E_7_uid124_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_7_uid124_sincosTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal yip1E_7_uid125_sincosTest_a : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_7_uid125_sincosTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_7_uid125_sincosTest_o : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_7_uid125_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_7_uid125_sincosTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal lowRangeA_uid127_sincosTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid127_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid128_sincosTest_b : STD_LOGIC_VECTOR (11 downto 0);
    signal aip1E_7high_uid129_sincosTest_a : STD_LOGIC_VECTOR (13 downto 0);
    signal aip1E_7high_uid129_sincosTest_b : STD_LOGIC_VECTOR (13 downto 0);
    signal aip1E_7high_uid129_sincosTest_o : STD_LOGIC_VECTOR (13 downto 0);
    signal aip1E_7high_uid129_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_7high_uid129_sincosTest_q : STD_LOGIC_VECTOR (12 downto 0);
    signal aip1E_7_uid130_sincosTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal xip1_7_uid131_sincosTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal xip1_7_uid131_sincosTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal yip1_7_uid132_sincosTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal yip1_7_uid132_sincosTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal aip1E_uid133_sincosTest_in : STD_LOGIC_VECTOR (11 downto 0);
    signal aip1E_uid133_sincosTest_b : STD_LOGIC_VECTOR (11 downto 0);
    signal xMSB_uid134_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid136_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid139_sincosTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal twoToMiSiYip_uid140_sincosTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal cstArcTan2Mi_7_uid141_sincosTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal xip1E_8_uid143_sincosTest_a : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1E_8_uid143_sincosTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1E_8_uid143_sincosTest_o : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1E_8_uid143_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_8_uid143_sincosTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal yip1E_8_uid144_sincosTest_a : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_8_uid144_sincosTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_8_uid144_sincosTest_o : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_8_uid144_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_8_uid144_sincosTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal lowRangeA_uid146_sincosTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid146_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid147_sincosTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal aip1E_8high_uid148_sincosTest_a : STD_LOGIC_VECTOR (12 downto 0);
    signal aip1E_8high_uid148_sincosTest_b : STD_LOGIC_VECTOR (12 downto 0);
    signal aip1E_8high_uid148_sincosTest_o : STD_LOGIC_VECTOR (12 downto 0);
    signal aip1E_8high_uid148_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_8high_uid148_sincosTest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal aip1E_8_uid149_sincosTest_q : STD_LOGIC_VECTOR (12 downto 0);
    signal xip1_8_uid150_sincosTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal xip1_8_uid150_sincosTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal yip1_8_uid151_sincosTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal yip1_8_uid151_sincosTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal aip1E_uid152_sincosTest_in : STD_LOGIC_VECTOR (10 downto 0);
    signal aip1E_uid152_sincosTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal xMSB_uid153_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid155_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid158_sincosTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal twoToMiSiYip_uid159_sincosTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal xip1E_9_uid162_sincosTest_a : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1E_9_uid162_sincosTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1E_9_uid162_sincosTest_o : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1E_9_uid162_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_9_uid162_sincosTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal yip1E_9_uid163_sincosTest_a : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_9_uid163_sincosTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_9_uid163_sincosTest_o : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_9_uid163_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_9_uid163_sincosTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal xip1_9_uid169_sincosTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal xip1_9_uid169_sincosTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal yip1_9_uid170_sincosTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal yip1_9_uid170_sincosTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal xSumPreRnd_uid172_sincosTest_in : STD_LOGIC_VECTOR (20 downto 0);
    signal xSumPreRnd_uid172_sincosTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal xSumPostRnd_uid175_sincosTest_a : STD_LOGIC_VECTOR (9 downto 0);
    signal xSumPostRnd_uid175_sincosTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal xSumPostRnd_uid175_sincosTest_o : STD_LOGIC_VECTOR (9 downto 0);
    signal xSumPostRnd_uid175_sincosTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal ySumPreRnd_uid176_sincosTest_in : STD_LOGIC_VECTOR (20 downto 0);
    signal ySumPreRnd_uid176_sincosTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal ySumPostRnd_uid179_sincosTest_a : STD_LOGIC_VECTOR (9 downto 0);
    signal ySumPostRnd_uid179_sincosTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal ySumPostRnd_uid179_sincosTest_o : STD_LOGIC_VECTOR (9 downto 0);
    signal ySumPostRnd_uid179_sincosTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal xPostExc_uid180_sincosTest_in : STD_LOGIC_VECTOR (8 downto 0);
    signal xPostExc_uid180_sincosTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal yPostExc_uid181_sincosTest_in : STD_LOGIC_VECTOR (8 downto 0);
    signal yPostExc_uid181_sincosTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal redist0_ySumPreRnd_uid176_sincosTest_b_1_q : STD_LOGIC_VECTOR (8 downto 0);
    signal redist1_xSumPreRnd_uid172_sincosTest_b_1_q : STD_LOGIC_VECTOR (8 downto 0);
    signal redist2_xMSB_uid153_sincosTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_yip1_8_uid151_sincosTest_b_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist4_xip1_8_uid150_sincosTest_b_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist5_aip1E_uid133_sincosTest_b_1_q : STD_LOGIC_VECTOR (11 downto 0);
    signal redist6_yip1_7_uid132_sincosTest_b_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist7_xip1_7_uid131_sincosTest_b_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist8_aip1E_uid114_sincosTest_b_1_q : STD_LOGIC_VECTOR (12 downto 0);
    signal redist9_yip1_6_uid113_sincosTest_b_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist10_xip1_6_uid112_sincosTest_b_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist11_aip1E_uid98_sincosTest_b_1_q : STD_LOGIC_VECTOR (13 downto 0);
    signal redist12_yip1_5_uid97_sincosTest_b_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist13_xip1_5_uid96_sincosTest_b_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist14_aip1E_uid82_sincosTest_b_1_q : STD_LOGIC_VECTOR (14 downto 0);
    signal redist15_yip1_4_uid81_sincosTest_b_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist16_xip1_4_uid80_sincosTest_b_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist17_aip1E_uid66_sincosTest_b_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist18_yip1_3_uid65_sincosTest_b_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist19_xip1_3_uid64_sincosTest_b_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist20_aip1E_uid50_sincosTest_b_1_q : STD_LOGIC_VECTOR (16 downto 0);
    signal redist21_yip1_2_uid49_sincosTest_b_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist22_xip1_2_uid48_sincosTest_b_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist23_aip1E_uid34_sincosTest_b_1_q : STD_LOGIC_VECTOR (17 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- xMSB_uid99_sincosTest(BITSELECT,98)@5
    xMSB_uid99_sincosTest_b <= STD_LOGIC_VECTOR(redist11_aip1E_uid98_sincosTest_b_1_q(13 downto 13));

    -- cstArcTan2Mi_5_uid106_sincosTest(CONSTANT,105)
    cstArcTan2Mi_5_uid106_sincosTest_q <= "011111111111";

    -- xMSB_uid83_sincosTest(BITSELECT,82)@4
    xMSB_uid83_sincosTest_b <= STD_LOGIC_VECTOR(redist14_aip1E_uid82_sincosTest_b_1_q(14 downto 14));

    -- cstArcTan2Mi_4_uid90_sincosTest(CONSTANT,89)
    cstArcTan2Mi_4_uid90_sincosTest_q <= "0111111111011";

    -- xMSB_uid67_sincosTest(BITSELECT,66)@3
    xMSB_uid67_sincosTest_b <= STD_LOGIC_VECTOR(redist17_aip1E_uid66_sincosTest_b_1_q(15 downto 15));

    -- cstArcTan2Mi_3_uid74_sincosTest(CONSTANT,73)
    cstArcTan2Mi_3_uid74_sincosTest_q <= "01111111010110";

    -- xMSB_uid51_sincosTest(BITSELECT,50)@2
    xMSB_uid51_sincosTest_b <= STD_LOGIC_VECTOR(redist20_aip1E_uid50_sincosTest_b_1_q(16 downto 16));

    -- cstArcTan2Mi_2_uid58_sincosTest(CONSTANT,57)
    cstArcTan2Mi_2_uid58_sincosTest_q <= "011111010110111";

    -- xMSB_uid35_sincosTest(BITSELECT,34)@1
    xMSB_uid35_sincosTest_b <= STD_LOGIC_VECTOR(redist23_aip1E_uid34_sincosTest_b_1_q(17 downto 17));

    -- cstArcTan2Mi_1_uid42_sincosTest(CONSTANT,41)
    cstArcTan2Mi_1_uid42_sincosTest_q <= "0111011010110010";

    -- invSignOfSelectionSignal_uid20_sincosTest(LOGICAL,19)@0
    invSignOfSelectionSignal_uid20_sincosTest_q <= not (VCC_q);

    -- cstArcTan2Mi_0_uid10_sincosTest(CONSTANT,9)
    cstArcTan2Mi_0_uid10_sincosTest_q <= "01100100100010000";

    -- aip1E_1CostZeroPaddingA_uid21_sincosTest(CONSTANT,20)
    aip1E_1CostZeroPaddingA_uid21_sincosTest_q <= "00000";

    -- aip1E_1NA_uid22_sincosTest(BITJOIN,21)@0
    aip1E_1NA_uid22_sincosTest_q <= a & aip1E_1CostZeroPaddingA_uid21_sincosTest_q;

    -- aip1E_1sumAHighB_uid23_sincosTest(ADDSUB,22)@0
    aip1E_1sumAHighB_uid23_sincosTest_s <= invSignOfSelectionSignal_uid20_sincosTest_q;
    aip1E_1sumAHighB_uid23_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & aip1E_1NA_uid22_sincosTest_q));
    aip1E_1sumAHighB_uid23_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 17 => cstArcTan2Mi_0_uid10_sincosTest_q(16)) & cstArcTan2Mi_0_uid10_sincosTest_q));
    aip1E_1sumAHighB_uid23_sincosTest_combproc: PROCESS (aip1E_1sumAHighB_uid23_sincosTest_a, aip1E_1sumAHighB_uid23_sincosTest_b, aip1E_1sumAHighB_uid23_sincosTest_s)
    BEGIN
        IF (aip1E_1sumAHighB_uid23_sincosTest_s = "1") THEN
            aip1E_1sumAHighB_uid23_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_1sumAHighB_uid23_sincosTest_a) + SIGNED(aip1E_1sumAHighB_uid23_sincosTest_b));
        ELSE
            aip1E_1sumAHighB_uid23_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_1sumAHighB_uid23_sincosTest_a) - SIGNED(aip1E_1sumAHighB_uid23_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_1sumAHighB_uid23_sincosTest_q <= aip1E_1sumAHighB_uid23_sincosTest_o(18 downto 0);

    -- aip1E_uid34_sincosTest(BITSELECT,33)@0
    aip1E_uid34_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_1sumAHighB_uid23_sincosTest_q(17 downto 0));
    aip1E_uid34_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid34_sincosTest_in(17 downto 0));

    -- redist23_aip1E_uid34_sincosTest_b_1(DELAY,208)
    redist23_aip1E_uid34_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 18, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_uid34_sincosTest_b, xout => redist23_aip1E_uid34_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- aip1E_2_uid47_sincosTest(ADDSUB,46)@1
    aip1E_2_uid47_sincosTest_s <= xMSB_uid35_sincosTest_b;
    aip1E_2_uid47_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 18 => redist23_aip1E_uid34_sincosTest_b_1_q(17)) & redist23_aip1E_uid34_sincosTest_b_1_q));
    aip1E_2_uid47_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 16 => cstArcTan2Mi_1_uid42_sincosTest_q(15)) & cstArcTan2Mi_1_uid42_sincosTest_q));
    aip1E_2_uid47_sincosTest_combproc: PROCESS (aip1E_2_uid47_sincosTest_a, aip1E_2_uid47_sincosTest_b, aip1E_2_uid47_sincosTest_s)
    BEGIN
        IF (aip1E_2_uid47_sincosTest_s = "1") THEN
            aip1E_2_uid47_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_2_uid47_sincosTest_a) + SIGNED(aip1E_2_uid47_sincosTest_b));
        ELSE
            aip1E_2_uid47_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_2_uid47_sincosTest_a) - SIGNED(aip1E_2_uid47_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_2_uid47_sincosTest_q <= aip1E_2_uid47_sincosTest_o(18 downto 0);

    -- aip1E_uid50_sincosTest(BITSELECT,49)@1
    aip1E_uid50_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_2_uid47_sincosTest_q(16 downto 0));
    aip1E_uid50_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid50_sincosTest_in(16 downto 0));

    -- redist20_aip1E_uid50_sincosTest_b_1(DELAY,205)
    redist20_aip1E_uid50_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_uid50_sincosTest_b, xout => redist20_aip1E_uid50_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- aip1E_3_uid63_sincosTest(ADDSUB,62)@2
    aip1E_3_uid63_sincosTest_s <= xMSB_uid51_sincosTest_b;
    aip1E_3_uid63_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 17 => redist20_aip1E_uid50_sincosTest_b_1_q(16)) & redist20_aip1E_uid50_sincosTest_b_1_q));
    aip1E_3_uid63_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 15 => cstArcTan2Mi_2_uid58_sincosTest_q(14)) & cstArcTan2Mi_2_uid58_sincosTest_q));
    aip1E_3_uid63_sincosTest_combproc: PROCESS (aip1E_3_uid63_sincosTest_a, aip1E_3_uid63_sincosTest_b, aip1E_3_uid63_sincosTest_s)
    BEGIN
        IF (aip1E_3_uid63_sincosTest_s = "1") THEN
            aip1E_3_uid63_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_3_uid63_sincosTest_a) + SIGNED(aip1E_3_uid63_sincosTest_b));
        ELSE
            aip1E_3_uid63_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_3_uid63_sincosTest_a) - SIGNED(aip1E_3_uid63_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_3_uid63_sincosTest_q <= aip1E_3_uid63_sincosTest_o(17 downto 0);

    -- aip1E_uid66_sincosTest(BITSELECT,65)@2
    aip1E_uid66_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_3_uid63_sincosTest_q(15 downto 0));
    aip1E_uid66_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid66_sincosTest_in(15 downto 0));

    -- redist17_aip1E_uid66_sincosTest_b_1(DELAY,202)
    redist17_aip1E_uid66_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_uid66_sincosTest_b, xout => redist17_aip1E_uid66_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- aip1E_4_uid79_sincosTest(ADDSUB,78)@3
    aip1E_4_uid79_sincosTest_s <= xMSB_uid67_sincosTest_b;
    aip1E_4_uid79_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 16 => redist17_aip1E_uid66_sincosTest_b_1_q(15)) & redist17_aip1E_uid66_sincosTest_b_1_q));
    aip1E_4_uid79_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 14 => cstArcTan2Mi_3_uid74_sincosTest_q(13)) & cstArcTan2Mi_3_uid74_sincosTest_q));
    aip1E_4_uid79_sincosTest_combproc: PROCESS (aip1E_4_uid79_sincosTest_a, aip1E_4_uid79_sincosTest_b, aip1E_4_uid79_sincosTest_s)
    BEGIN
        IF (aip1E_4_uid79_sincosTest_s = "1") THEN
            aip1E_4_uid79_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_4_uid79_sincosTest_a) + SIGNED(aip1E_4_uid79_sincosTest_b));
        ELSE
            aip1E_4_uid79_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_4_uid79_sincosTest_a) - SIGNED(aip1E_4_uid79_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_4_uid79_sincosTest_q <= aip1E_4_uid79_sincosTest_o(16 downto 0);

    -- aip1E_uid82_sincosTest(BITSELECT,81)@3
    aip1E_uid82_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_4_uid79_sincosTest_q(14 downto 0));
    aip1E_uid82_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid82_sincosTest_in(14 downto 0));

    -- redist14_aip1E_uid82_sincosTest_b_1(DELAY,199)
    redist14_aip1E_uid82_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 15, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_uid82_sincosTest_b, xout => redist14_aip1E_uid82_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- aip1E_5_uid95_sincosTest(ADDSUB,94)@4
    aip1E_5_uid95_sincosTest_s <= xMSB_uid83_sincosTest_b;
    aip1E_5_uid95_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 15 => redist14_aip1E_uid82_sincosTest_b_1_q(14)) & redist14_aip1E_uid82_sincosTest_b_1_q));
    aip1E_5_uid95_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 13 => cstArcTan2Mi_4_uid90_sincosTest_q(12)) & cstArcTan2Mi_4_uid90_sincosTest_q));
    aip1E_5_uid95_sincosTest_combproc: PROCESS (aip1E_5_uid95_sincosTest_a, aip1E_5_uid95_sincosTest_b, aip1E_5_uid95_sincosTest_s)
    BEGIN
        IF (aip1E_5_uid95_sincosTest_s = "1") THEN
            aip1E_5_uid95_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_5_uid95_sincosTest_a) + SIGNED(aip1E_5_uid95_sincosTest_b));
        ELSE
            aip1E_5_uid95_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_5_uid95_sincosTest_a) - SIGNED(aip1E_5_uid95_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_5_uid95_sincosTest_q <= aip1E_5_uid95_sincosTest_o(15 downto 0);

    -- aip1E_uid98_sincosTest(BITSELECT,97)@4
    aip1E_uid98_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_5_uid95_sincosTest_q(13 downto 0));
    aip1E_uid98_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid98_sincosTest_in(13 downto 0));

    -- redist11_aip1E_uid98_sincosTest_b_1(DELAY,196)
    redist11_aip1E_uid98_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 14, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_uid98_sincosTest_b, xout => redist11_aip1E_uid98_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- aip1E_6_uid111_sincosTest(ADDSUB,110)@5
    aip1E_6_uid111_sincosTest_s <= xMSB_uid99_sincosTest_b;
    aip1E_6_uid111_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 14 => redist11_aip1E_uid98_sincosTest_b_1_q(13)) & redist11_aip1E_uid98_sincosTest_b_1_q));
    aip1E_6_uid111_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 12 => cstArcTan2Mi_5_uid106_sincosTest_q(11)) & cstArcTan2Mi_5_uid106_sincosTest_q));
    aip1E_6_uid111_sincosTest_combproc: PROCESS (aip1E_6_uid111_sincosTest_a, aip1E_6_uid111_sincosTest_b, aip1E_6_uid111_sincosTest_s)
    BEGIN
        IF (aip1E_6_uid111_sincosTest_s = "1") THEN
            aip1E_6_uid111_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_6_uid111_sincosTest_a) + SIGNED(aip1E_6_uid111_sincosTest_b));
        ELSE
            aip1E_6_uid111_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_6_uid111_sincosTest_a) - SIGNED(aip1E_6_uid111_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_6_uid111_sincosTest_q <= aip1E_6_uid111_sincosTest_o(14 downto 0);

    -- aip1E_uid114_sincosTest(BITSELECT,113)@5
    aip1E_uid114_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_6_uid111_sincosTest_q(12 downto 0));
    aip1E_uid114_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid114_sincosTest_in(12 downto 0));

    -- redist8_aip1E_uid114_sincosTest_b_1(DELAY,193)
    redist8_aip1E_uid114_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 13, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_uid114_sincosTest_b, xout => redist8_aip1E_uid114_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- xMSB_uid115_sincosTest(BITSELECT,114)@6
    xMSB_uid115_sincosTest_b <= STD_LOGIC_VECTOR(redist8_aip1E_uid114_sincosTest_b_1_q(12 downto 12));

    -- cstArcTan2Mi_6_uid122_sincosTest(CONSTANT,121)
    cstArcTan2Mi_6_uid122_sincosTest_q <= "01000000000";

    -- highABits_uid128_sincosTest(BITSELECT,127)@6
    highABits_uid128_sincosTest_b <= STD_LOGIC_VECTOR(redist8_aip1E_uid114_sincosTest_b_1_q(12 downto 1));

    -- aip1E_7high_uid129_sincosTest(ADDSUB,128)@6
    aip1E_7high_uid129_sincosTest_s <= xMSB_uid115_sincosTest_b;
    aip1E_7high_uid129_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 12 => highABits_uid128_sincosTest_b(11)) & highABits_uid128_sincosTest_b));
    aip1E_7high_uid129_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 11 => cstArcTan2Mi_6_uid122_sincosTest_q(10)) & cstArcTan2Mi_6_uid122_sincosTest_q));
    aip1E_7high_uid129_sincosTest_combproc: PROCESS (aip1E_7high_uid129_sincosTest_a, aip1E_7high_uid129_sincosTest_b, aip1E_7high_uid129_sincosTest_s)
    BEGIN
        IF (aip1E_7high_uid129_sincosTest_s = "1") THEN
            aip1E_7high_uid129_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_7high_uid129_sincosTest_a) + SIGNED(aip1E_7high_uid129_sincosTest_b));
        ELSE
            aip1E_7high_uid129_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_7high_uid129_sincosTest_a) - SIGNED(aip1E_7high_uid129_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_7high_uid129_sincosTest_q <= aip1E_7high_uid129_sincosTest_o(12 downto 0);

    -- lowRangeA_uid127_sincosTest(BITSELECT,126)@6
    lowRangeA_uid127_sincosTest_in <= redist8_aip1E_uid114_sincosTest_b_1_q(0 downto 0);
    lowRangeA_uid127_sincosTest_b <= lowRangeA_uid127_sincosTest_in(0 downto 0);

    -- aip1E_7_uid130_sincosTest(BITJOIN,129)@6
    aip1E_7_uid130_sincosTest_q <= aip1E_7high_uid129_sincosTest_q & lowRangeA_uid127_sincosTest_b;

    -- aip1E_uid133_sincosTest(BITSELECT,132)@6
    aip1E_uid133_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_7_uid130_sincosTest_q(11 downto 0));
    aip1E_uid133_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid133_sincosTest_in(11 downto 0));

    -- redist5_aip1E_uid133_sincosTest_b_1(DELAY,190)
    redist5_aip1E_uid133_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 12, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_uid133_sincosTest_b, xout => redist5_aip1E_uid133_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- xMSB_uid134_sincosTest(BITSELECT,133)@7
    xMSB_uid134_sincosTest_b <= STD_LOGIC_VECTOR(redist5_aip1E_uid133_sincosTest_b_1_q(11 downto 11));

    -- cstArcTan2Mi_7_uid141_sincosTest(CONSTANT,140)
    cstArcTan2Mi_7_uid141_sincosTest_q <= "0100000000";

    -- highABits_uid147_sincosTest(BITSELECT,146)@7
    highABits_uid147_sincosTest_b <= STD_LOGIC_VECTOR(redist5_aip1E_uid133_sincosTest_b_1_q(11 downto 1));

    -- aip1E_8high_uid148_sincosTest(ADDSUB,147)@7
    aip1E_8high_uid148_sincosTest_s <= xMSB_uid134_sincosTest_b;
    aip1E_8high_uid148_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 11 => highABits_uid147_sincosTest_b(10)) & highABits_uid147_sincosTest_b));
    aip1E_8high_uid148_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 10 => cstArcTan2Mi_7_uid141_sincosTest_q(9)) & cstArcTan2Mi_7_uid141_sincosTest_q));
    aip1E_8high_uid148_sincosTest_combproc: PROCESS (aip1E_8high_uid148_sincosTest_a, aip1E_8high_uid148_sincosTest_b, aip1E_8high_uid148_sincosTest_s)
    BEGIN
        IF (aip1E_8high_uid148_sincosTest_s = "1") THEN
            aip1E_8high_uid148_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_8high_uid148_sincosTest_a) + SIGNED(aip1E_8high_uid148_sincosTest_b));
        ELSE
            aip1E_8high_uid148_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_8high_uid148_sincosTest_a) - SIGNED(aip1E_8high_uid148_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_8high_uid148_sincosTest_q <= aip1E_8high_uid148_sincosTest_o(11 downto 0);

    -- lowRangeA_uid146_sincosTest(BITSELECT,145)@7
    lowRangeA_uid146_sincosTest_in <= redist5_aip1E_uid133_sincosTest_b_1_q(0 downto 0);
    lowRangeA_uid146_sincosTest_b <= lowRangeA_uid146_sincosTest_in(0 downto 0);

    -- aip1E_8_uid149_sincosTest(BITJOIN,148)@7
    aip1E_8_uid149_sincosTest_q <= aip1E_8high_uid148_sincosTest_q & lowRangeA_uid146_sincosTest_b;

    -- aip1E_uid152_sincosTest(BITSELECT,151)@7
    aip1E_uid152_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_8_uid149_sincosTest_q(10 downto 0));
    aip1E_uid152_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid152_sincosTest_in(10 downto 0));

    -- xMSB_uid153_sincosTest(BITSELECT,152)@7
    xMSB_uid153_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid152_sincosTest_b(10 downto 10));

    -- redist2_xMSB_uid153_sincosTest_b_1(DELAY,187)
    redist2_xMSB_uid153_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid153_sincosTest_b, xout => redist2_xMSB_uid153_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- signOfSelectionSignal_uid155_sincosTest(LOGICAL,154)@8
    signOfSelectionSignal_uid155_sincosTest_q <= not (redist2_xMSB_uid153_sincosTest_b_1_q);

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- signOfSelectionSignal_uid117_sincosTest(LOGICAL,116)@6
    signOfSelectionSignal_uid117_sincosTest_q <= not (xMSB_uid115_sincosTest_b);

    -- signOfSelectionSignal_uid85_sincosTest(LOGICAL,84)@4
    signOfSelectionSignal_uid85_sincosTest_q <= not (xMSB_uid83_sincosTest_b);

    -- signOfSelectionSignal_uid53_sincosTest(LOGICAL,52)@2
    signOfSelectionSignal_uid53_sincosTest_q <= not (xMSB_uid51_sincosTest_b);

    -- xMSB_uid28_sincosTest(BITSELECT,27)@1
    xMSB_uid28_sincosTest_b <= STD_LOGIC_VECTOR(yip1E_1sumAHighB_uid19_sincosTest_q(21 downto 21));

    -- cstOneOverK_uid6_sincosTest(CONSTANT,5)
    cstOneOverK_uid6_sincosTest_q <= "10011011011101001111";

    -- yip1E_1CostZeroPaddingA_uid17_sincosTest(CONSTANT,16)
    yip1E_1CostZeroPaddingA_uid17_sincosTest_q <= "00000000000000000000";

    -- yip1E_1NA_uid18_sincosTest(BITJOIN,17)@0
    yip1E_1NA_uid18_sincosTest_q <= GND_q & yip1E_1CostZeroPaddingA_uid17_sincosTest_q;

    -- yip1E_1sumAHighB_uid19_sincosTest(ADDSUB,18)@0 + 1
    yip1E_1sumAHighB_uid19_sincosTest_s <= VCC_q;
    yip1E_1sumAHighB_uid19_sincosTest_a <= STD_LOGIC_VECTOR("00" & yip1E_1NA_uid18_sincosTest_q);
    yip1E_1sumAHighB_uid19_sincosTest_b <= STD_LOGIC_VECTOR("000" & cstOneOverK_uid6_sincosTest_q);
    yip1E_1sumAHighB_uid19_sincosTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            yip1E_1sumAHighB_uid19_sincosTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (yip1E_1sumAHighB_uid19_sincosTest_s = "1") THEN
                yip1E_1sumAHighB_uid19_sincosTest_o <= STD_LOGIC_VECTOR(UNSIGNED(yip1E_1sumAHighB_uid19_sincosTest_a) + UNSIGNED(yip1E_1sumAHighB_uid19_sincosTest_b));
            ELSE
                yip1E_1sumAHighB_uid19_sincosTest_o <= STD_LOGIC_VECTOR(UNSIGNED(yip1E_1sumAHighB_uid19_sincosTest_a) - UNSIGNED(yip1E_1sumAHighB_uid19_sincosTest_b));
            END IF;
        END IF;
    END PROCESS;
    yip1E_1sumAHighB_uid19_sincosTest_q <= yip1E_1sumAHighB_uid19_sincosTest_o(21 downto 0);

    -- yip1_1_mergedSignalTM_uid32_sincosTest(BITJOIN,31)@1
    yip1_1_mergedSignalTM_uid32_sincosTest_q <= xMSB_uid28_sincosTest_b & yip1E_1sumAHighB_uid19_sincosTest_q;

    -- twoToMiSiYip_uid41_sincosTest(BITSELECT,40)@1
    twoToMiSiYip_uid41_sincosTest_b <= STD_LOGIC_VECTOR(yip1_1_mergedSignalTM_uid32_sincosTest_q(22 downto 1));

    -- xip1E_1_uid16_sincosTest(BITJOIN,15)@1
    xip1E_1_uid16_sincosTest_q <= STD_LOGIC_VECTOR((2 downto 1 => GND_q(0)) & GND_q) & cstOneOverK_uid6_sincosTest_q;

    -- xip1_1_topRange_uid25_sincosTest(BITSELECT,24)@1
    xip1_1_topRange_uid25_sincosTest_in <= xip1E_1_uid16_sincosTest_q(21 downto 0);
    xip1_1_topRange_uid25_sincosTest_b <= xip1_1_topRange_uid25_sincosTest_in(21 downto 0);

    -- xip1_1_mergedSignalTM_uid26_sincosTest(BITJOIN,25)@1
    xip1_1_mergedSignalTM_uid26_sincosTest_q <= GND_q & xip1_1_topRange_uid25_sincosTest_b;

    -- xip1E_2_uid44_sincosTest(ADDSUB,43)@1
    xip1E_2_uid44_sincosTest_s <= xMSB_uid35_sincosTest_b;
    xip1E_2_uid44_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 23 => xip1_1_mergedSignalTM_uid26_sincosTest_q(22)) & xip1_1_mergedSignalTM_uid26_sincosTest_q));
    xip1E_2_uid44_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 22 => twoToMiSiYip_uid41_sincosTest_b(21)) & twoToMiSiYip_uid41_sincosTest_b));
    xip1E_2_uid44_sincosTest_combproc: PROCESS (xip1E_2_uid44_sincosTest_a, xip1E_2_uid44_sincosTest_b, xip1E_2_uid44_sincosTest_s)
    BEGIN
        IF (xip1E_2_uid44_sincosTest_s = "1") THEN
            xip1E_2_uid44_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_2_uid44_sincosTest_a) + SIGNED(xip1E_2_uid44_sincosTest_b));
        ELSE
            xip1E_2_uid44_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_2_uid44_sincosTest_a) - SIGNED(xip1E_2_uid44_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_2_uid44_sincosTest_q <= xip1E_2_uid44_sincosTest_o(23 downto 0);

    -- xip1_2_uid48_sincosTest(BITSELECT,47)@1
    xip1_2_uid48_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_2_uid44_sincosTest_q(22 downto 0));
    xip1_2_uid48_sincosTest_b <= STD_LOGIC_VECTOR(xip1_2_uid48_sincosTest_in(22 downto 0));

    -- redist22_xip1_2_uid48_sincosTest_b_1(DELAY,207)
    redist22_xip1_2_uid48_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_2_uid48_sincosTest_b, xout => redist22_xip1_2_uid48_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- twoToMiSiXip_uid56_sincosTest(BITSELECT,55)@2
    twoToMiSiXip_uid56_sincosTest_b <= STD_LOGIC_VECTOR(redist22_xip1_2_uid48_sincosTest_b_1_q(22 downto 2));

    -- signOfSelectionSignal_uid37_sincosTest(LOGICAL,36)@1
    signOfSelectionSignal_uid37_sincosTest_q <= not (xMSB_uid35_sincosTest_b);

    -- twoToMiSiXip_uid40_sincosTest(BITSELECT,39)@1
    twoToMiSiXip_uid40_sincosTest_b <= STD_LOGIC_VECTOR(xip1_1_mergedSignalTM_uid26_sincosTest_q(22 downto 1));

    -- yip1E_2_uid45_sincosTest(ADDSUB,44)@1
    yip1E_2_uid45_sincosTest_s <= signOfSelectionSignal_uid37_sincosTest_q;
    yip1E_2_uid45_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 23 => yip1_1_mergedSignalTM_uid32_sincosTest_q(22)) & yip1_1_mergedSignalTM_uid32_sincosTest_q));
    yip1E_2_uid45_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 22 => twoToMiSiXip_uid40_sincosTest_b(21)) & twoToMiSiXip_uid40_sincosTest_b));
    yip1E_2_uid45_sincosTest_combproc: PROCESS (yip1E_2_uid45_sincosTest_a, yip1E_2_uid45_sincosTest_b, yip1E_2_uid45_sincosTest_s)
    BEGIN
        IF (yip1E_2_uid45_sincosTest_s = "1") THEN
            yip1E_2_uid45_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_2_uid45_sincosTest_a) + SIGNED(yip1E_2_uid45_sincosTest_b));
        ELSE
            yip1E_2_uid45_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_2_uid45_sincosTest_a) - SIGNED(yip1E_2_uid45_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_2_uid45_sincosTest_q <= yip1E_2_uid45_sincosTest_o(23 downto 0);

    -- yip1_2_uid49_sincosTest(BITSELECT,48)@1
    yip1_2_uid49_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_2_uid45_sincosTest_q(22 downto 0));
    yip1_2_uid49_sincosTest_b <= STD_LOGIC_VECTOR(yip1_2_uid49_sincosTest_in(22 downto 0));

    -- redist21_yip1_2_uid49_sincosTest_b_1(DELAY,206)
    redist21_yip1_2_uid49_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_2_uid49_sincosTest_b, xout => redist21_yip1_2_uid49_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- yip1E_3_uid61_sincosTest(ADDSUB,60)@2
    yip1E_3_uid61_sincosTest_s <= signOfSelectionSignal_uid53_sincosTest_q;
    yip1E_3_uid61_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 23 => redist21_yip1_2_uid49_sincosTest_b_1_q(22)) & redist21_yip1_2_uid49_sincosTest_b_1_q));
    yip1E_3_uid61_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 21 => twoToMiSiXip_uid56_sincosTest_b(20)) & twoToMiSiXip_uid56_sincosTest_b));
    yip1E_3_uid61_sincosTest_combproc: PROCESS (yip1E_3_uid61_sincosTest_a, yip1E_3_uid61_sincosTest_b, yip1E_3_uid61_sincosTest_s)
    BEGIN
        IF (yip1E_3_uid61_sincosTest_s = "1") THEN
            yip1E_3_uid61_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_3_uid61_sincosTest_a) + SIGNED(yip1E_3_uid61_sincosTest_b));
        ELSE
            yip1E_3_uid61_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_3_uid61_sincosTest_a) - SIGNED(yip1E_3_uid61_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_3_uid61_sincosTest_q <= yip1E_3_uid61_sincosTest_o(23 downto 0);

    -- yip1_3_uid65_sincosTest(BITSELECT,64)@2
    yip1_3_uid65_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_3_uid61_sincosTest_q(22 downto 0));
    yip1_3_uid65_sincosTest_b <= STD_LOGIC_VECTOR(yip1_3_uid65_sincosTest_in(22 downto 0));

    -- redist18_yip1_3_uid65_sincosTest_b_1(DELAY,203)
    redist18_yip1_3_uid65_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_3_uid65_sincosTest_b, xout => redist18_yip1_3_uid65_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- twoToMiSiYip_uid73_sincosTest(BITSELECT,72)@3
    twoToMiSiYip_uid73_sincosTest_b <= STD_LOGIC_VECTOR(redist18_yip1_3_uid65_sincosTest_b_1_q(22 downto 3));

    -- twoToMiSiYip_uid57_sincosTest(BITSELECT,56)@2
    twoToMiSiYip_uid57_sincosTest_b <= STD_LOGIC_VECTOR(redist21_yip1_2_uid49_sincosTest_b_1_q(22 downto 2));

    -- xip1E_3_uid60_sincosTest(ADDSUB,59)@2
    xip1E_3_uid60_sincosTest_s <= xMSB_uid51_sincosTest_b;
    xip1E_3_uid60_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 23 => redist22_xip1_2_uid48_sincosTest_b_1_q(22)) & redist22_xip1_2_uid48_sincosTest_b_1_q));
    xip1E_3_uid60_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 21 => twoToMiSiYip_uid57_sincosTest_b(20)) & twoToMiSiYip_uid57_sincosTest_b));
    xip1E_3_uid60_sincosTest_combproc: PROCESS (xip1E_3_uid60_sincosTest_a, xip1E_3_uid60_sincosTest_b, xip1E_3_uid60_sincosTest_s)
    BEGIN
        IF (xip1E_3_uid60_sincosTest_s = "1") THEN
            xip1E_3_uid60_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_3_uid60_sincosTest_a) + SIGNED(xip1E_3_uid60_sincosTest_b));
        ELSE
            xip1E_3_uid60_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_3_uid60_sincosTest_a) - SIGNED(xip1E_3_uid60_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_3_uid60_sincosTest_q <= xip1E_3_uid60_sincosTest_o(23 downto 0);

    -- xip1_3_uid64_sincosTest(BITSELECT,63)@2
    xip1_3_uid64_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_3_uid60_sincosTest_q(22 downto 0));
    xip1_3_uid64_sincosTest_b <= STD_LOGIC_VECTOR(xip1_3_uid64_sincosTest_in(22 downto 0));

    -- redist19_xip1_3_uid64_sincosTest_b_1(DELAY,204)
    redist19_xip1_3_uid64_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_3_uid64_sincosTest_b, xout => redist19_xip1_3_uid64_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- xip1E_4_uid76_sincosTest(ADDSUB,75)@3
    xip1E_4_uid76_sincosTest_s <= xMSB_uid67_sincosTest_b;
    xip1E_4_uid76_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 23 => redist19_xip1_3_uid64_sincosTest_b_1_q(22)) & redist19_xip1_3_uid64_sincosTest_b_1_q));
    xip1E_4_uid76_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 20 => twoToMiSiYip_uid73_sincosTest_b(19)) & twoToMiSiYip_uid73_sincosTest_b));
    xip1E_4_uid76_sincosTest_combproc: PROCESS (xip1E_4_uid76_sincosTest_a, xip1E_4_uid76_sincosTest_b, xip1E_4_uid76_sincosTest_s)
    BEGIN
        IF (xip1E_4_uid76_sincosTest_s = "1") THEN
            xip1E_4_uid76_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_4_uid76_sincosTest_a) + SIGNED(xip1E_4_uid76_sincosTest_b));
        ELSE
            xip1E_4_uid76_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_4_uid76_sincosTest_a) - SIGNED(xip1E_4_uid76_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_4_uid76_sincosTest_q <= xip1E_4_uid76_sincosTest_o(23 downto 0);

    -- xip1_4_uid80_sincosTest(BITSELECT,79)@3
    xip1_4_uid80_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_4_uid76_sincosTest_q(22 downto 0));
    xip1_4_uid80_sincosTest_b <= STD_LOGIC_VECTOR(xip1_4_uid80_sincosTest_in(22 downto 0));

    -- redist16_xip1_4_uid80_sincosTest_b_1(DELAY,201)
    redist16_xip1_4_uid80_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_4_uid80_sincosTest_b, xout => redist16_xip1_4_uid80_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- twoToMiSiXip_uid88_sincosTest(BITSELECT,87)@4
    twoToMiSiXip_uid88_sincosTest_b <= STD_LOGIC_VECTOR(redist16_xip1_4_uid80_sincosTest_b_1_q(22 downto 4));

    -- signOfSelectionSignal_uid69_sincosTest(LOGICAL,68)@3
    signOfSelectionSignal_uid69_sincosTest_q <= not (xMSB_uid67_sincosTest_b);

    -- twoToMiSiXip_uid72_sincosTest(BITSELECT,71)@3
    twoToMiSiXip_uid72_sincosTest_b <= STD_LOGIC_VECTOR(redist19_xip1_3_uid64_sincosTest_b_1_q(22 downto 3));

    -- yip1E_4_uid77_sincosTest(ADDSUB,76)@3
    yip1E_4_uid77_sincosTest_s <= signOfSelectionSignal_uid69_sincosTest_q;
    yip1E_4_uid77_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 23 => redist18_yip1_3_uid65_sincosTest_b_1_q(22)) & redist18_yip1_3_uid65_sincosTest_b_1_q));
    yip1E_4_uid77_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 20 => twoToMiSiXip_uid72_sincosTest_b(19)) & twoToMiSiXip_uid72_sincosTest_b));
    yip1E_4_uid77_sincosTest_combproc: PROCESS (yip1E_4_uid77_sincosTest_a, yip1E_4_uid77_sincosTest_b, yip1E_4_uid77_sincosTest_s)
    BEGIN
        IF (yip1E_4_uid77_sincosTest_s = "1") THEN
            yip1E_4_uid77_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_4_uid77_sincosTest_a) + SIGNED(yip1E_4_uid77_sincosTest_b));
        ELSE
            yip1E_4_uid77_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_4_uid77_sincosTest_a) - SIGNED(yip1E_4_uid77_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_4_uid77_sincosTest_q <= yip1E_4_uid77_sincosTest_o(23 downto 0);

    -- yip1_4_uid81_sincosTest(BITSELECT,80)@3
    yip1_4_uid81_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_4_uid77_sincosTest_q(22 downto 0));
    yip1_4_uid81_sincosTest_b <= STD_LOGIC_VECTOR(yip1_4_uid81_sincosTest_in(22 downto 0));

    -- redist15_yip1_4_uid81_sincosTest_b_1(DELAY,200)
    redist15_yip1_4_uid81_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_4_uid81_sincosTest_b, xout => redist15_yip1_4_uid81_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- yip1E_5_uid93_sincosTest(ADDSUB,92)@4
    yip1E_5_uid93_sincosTest_s <= signOfSelectionSignal_uid85_sincosTest_q;
    yip1E_5_uid93_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 23 => redist15_yip1_4_uid81_sincosTest_b_1_q(22)) & redist15_yip1_4_uid81_sincosTest_b_1_q));
    yip1E_5_uid93_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 19 => twoToMiSiXip_uid88_sincosTest_b(18)) & twoToMiSiXip_uid88_sincosTest_b));
    yip1E_5_uid93_sincosTest_combproc: PROCESS (yip1E_5_uid93_sincosTest_a, yip1E_5_uid93_sincosTest_b, yip1E_5_uid93_sincosTest_s)
    BEGIN
        IF (yip1E_5_uid93_sincosTest_s = "1") THEN
            yip1E_5_uid93_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_5_uid93_sincosTest_a) + SIGNED(yip1E_5_uid93_sincosTest_b));
        ELSE
            yip1E_5_uid93_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_5_uid93_sincosTest_a) - SIGNED(yip1E_5_uid93_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_5_uid93_sincosTest_q <= yip1E_5_uid93_sincosTest_o(23 downto 0);

    -- yip1_5_uid97_sincosTest(BITSELECT,96)@4
    yip1_5_uid97_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_5_uid93_sincosTest_q(22 downto 0));
    yip1_5_uid97_sincosTest_b <= STD_LOGIC_VECTOR(yip1_5_uid97_sincosTest_in(22 downto 0));

    -- redist12_yip1_5_uid97_sincosTest_b_1(DELAY,197)
    redist12_yip1_5_uid97_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_5_uid97_sincosTest_b, xout => redist12_yip1_5_uid97_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- twoToMiSiYip_uid105_sincosTest(BITSELECT,104)@5
    twoToMiSiYip_uid105_sincosTest_b <= STD_LOGIC_VECTOR(redist12_yip1_5_uid97_sincosTest_b_1_q(22 downto 5));

    -- twoToMiSiYip_uid89_sincosTest(BITSELECT,88)@4
    twoToMiSiYip_uid89_sincosTest_b <= STD_LOGIC_VECTOR(redist15_yip1_4_uid81_sincosTest_b_1_q(22 downto 4));

    -- xip1E_5_uid92_sincosTest(ADDSUB,91)@4
    xip1E_5_uid92_sincosTest_s <= xMSB_uid83_sincosTest_b;
    xip1E_5_uid92_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 23 => redist16_xip1_4_uid80_sincosTest_b_1_q(22)) & redist16_xip1_4_uid80_sincosTest_b_1_q));
    xip1E_5_uid92_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 19 => twoToMiSiYip_uid89_sincosTest_b(18)) & twoToMiSiYip_uid89_sincosTest_b));
    xip1E_5_uid92_sincosTest_combproc: PROCESS (xip1E_5_uid92_sincosTest_a, xip1E_5_uid92_sincosTest_b, xip1E_5_uid92_sincosTest_s)
    BEGIN
        IF (xip1E_5_uid92_sincosTest_s = "1") THEN
            xip1E_5_uid92_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_5_uid92_sincosTest_a) + SIGNED(xip1E_5_uid92_sincosTest_b));
        ELSE
            xip1E_5_uid92_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_5_uid92_sincosTest_a) - SIGNED(xip1E_5_uid92_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_5_uid92_sincosTest_q <= xip1E_5_uid92_sincosTest_o(23 downto 0);

    -- xip1_5_uid96_sincosTest(BITSELECT,95)@4
    xip1_5_uid96_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_5_uid92_sincosTest_q(22 downto 0));
    xip1_5_uid96_sincosTest_b <= STD_LOGIC_VECTOR(xip1_5_uid96_sincosTest_in(22 downto 0));

    -- redist13_xip1_5_uid96_sincosTest_b_1(DELAY,198)
    redist13_xip1_5_uid96_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_5_uid96_sincosTest_b, xout => redist13_xip1_5_uid96_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- xip1E_6_uid108_sincosTest(ADDSUB,107)@5
    xip1E_6_uid108_sincosTest_s <= xMSB_uid99_sincosTest_b;
    xip1E_6_uid108_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 23 => redist13_xip1_5_uid96_sincosTest_b_1_q(22)) & redist13_xip1_5_uid96_sincosTest_b_1_q));
    xip1E_6_uid108_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 18 => twoToMiSiYip_uid105_sincosTest_b(17)) & twoToMiSiYip_uid105_sincosTest_b));
    xip1E_6_uid108_sincosTest_combproc: PROCESS (xip1E_6_uid108_sincosTest_a, xip1E_6_uid108_sincosTest_b, xip1E_6_uid108_sincosTest_s)
    BEGIN
        IF (xip1E_6_uid108_sincosTest_s = "1") THEN
            xip1E_6_uid108_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_6_uid108_sincosTest_a) + SIGNED(xip1E_6_uid108_sincosTest_b));
        ELSE
            xip1E_6_uid108_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_6_uid108_sincosTest_a) - SIGNED(xip1E_6_uid108_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_6_uid108_sincosTest_q <= xip1E_6_uid108_sincosTest_o(23 downto 0);

    -- xip1_6_uid112_sincosTest(BITSELECT,111)@5
    xip1_6_uid112_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_6_uid108_sincosTest_q(22 downto 0));
    xip1_6_uid112_sincosTest_b <= STD_LOGIC_VECTOR(xip1_6_uid112_sincosTest_in(22 downto 0));

    -- redist10_xip1_6_uid112_sincosTest_b_1(DELAY,195)
    redist10_xip1_6_uid112_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_6_uid112_sincosTest_b, xout => redist10_xip1_6_uid112_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- twoToMiSiXip_uid120_sincosTest(BITSELECT,119)@6
    twoToMiSiXip_uid120_sincosTest_b <= STD_LOGIC_VECTOR(redist10_xip1_6_uid112_sincosTest_b_1_q(22 downto 6));

    -- signOfSelectionSignal_uid101_sincosTest(LOGICAL,100)@5
    signOfSelectionSignal_uid101_sincosTest_q <= not (xMSB_uid99_sincosTest_b);

    -- twoToMiSiXip_uid104_sincosTest(BITSELECT,103)@5
    twoToMiSiXip_uid104_sincosTest_b <= STD_LOGIC_VECTOR(redist13_xip1_5_uid96_sincosTest_b_1_q(22 downto 5));

    -- yip1E_6_uid109_sincosTest(ADDSUB,108)@5
    yip1E_6_uid109_sincosTest_s <= signOfSelectionSignal_uid101_sincosTest_q;
    yip1E_6_uid109_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 23 => redist12_yip1_5_uid97_sincosTest_b_1_q(22)) & redist12_yip1_5_uid97_sincosTest_b_1_q));
    yip1E_6_uid109_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 18 => twoToMiSiXip_uid104_sincosTest_b(17)) & twoToMiSiXip_uid104_sincosTest_b));
    yip1E_6_uid109_sincosTest_combproc: PROCESS (yip1E_6_uid109_sincosTest_a, yip1E_6_uid109_sincosTest_b, yip1E_6_uid109_sincosTest_s)
    BEGIN
        IF (yip1E_6_uid109_sincosTest_s = "1") THEN
            yip1E_6_uid109_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_6_uid109_sincosTest_a) + SIGNED(yip1E_6_uid109_sincosTest_b));
        ELSE
            yip1E_6_uid109_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_6_uid109_sincosTest_a) - SIGNED(yip1E_6_uid109_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_6_uid109_sincosTest_q <= yip1E_6_uid109_sincosTest_o(23 downto 0);

    -- yip1_6_uid113_sincosTest(BITSELECT,112)@5
    yip1_6_uid113_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_6_uid109_sincosTest_q(22 downto 0));
    yip1_6_uid113_sincosTest_b <= STD_LOGIC_VECTOR(yip1_6_uid113_sincosTest_in(22 downto 0));

    -- redist9_yip1_6_uid113_sincosTest_b_1(DELAY,194)
    redist9_yip1_6_uid113_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_6_uid113_sincosTest_b, xout => redist9_yip1_6_uid113_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- yip1E_7_uid125_sincosTest(ADDSUB,124)@6
    yip1E_7_uid125_sincosTest_s <= signOfSelectionSignal_uid117_sincosTest_q;
    yip1E_7_uid125_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 23 => redist9_yip1_6_uid113_sincosTest_b_1_q(22)) & redist9_yip1_6_uid113_sincosTest_b_1_q));
    yip1E_7_uid125_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 17 => twoToMiSiXip_uid120_sincosTest_b(16)) & twoToMiSiXip_uid120_sincosTest_b));
    yip1E_7_uid125_sincosTest_combproc: PROCESS (yip1E_7_uid125_sincosTest_a, yip1E_7_uid125_sincosTest_b, yip1E_7_uid125_sincosTest_s)
    BEGIN
        IF (yip1E_7_uid125_sincosTest_s = "1") THEN
            yip1E_7_uid125_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_7_uid125_sincosTest_a) + SIGNED(yip1E_7_uid125_sincosTest_b));
        ELSE
            yip1E_7_uid125_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_7_uid125_sincosTest_a) - SIGNED(yip1E_7_uid125_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_7_uid125_sincosTest_q <= yip1E_7_uid125_sincosTest_o(23 downto 0);

    -- yip1_7_uid132_sincosTest(BITSELECT,131)@6
    yip1_7_uid132_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_7_uid125_sincosTest_q(22 downto 0));
    yip1_7_uid132_sincosTest_b <= STD_LOGIC_VECTOR(yip1_7_uid132_sincosTest_in(22 downto 0));

    -- redist6_yip1_7_uid132_sincosTest_b_1(DELAY,191)
    redist6_yip1_7_uid132_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_7_uid132_sincosTest_b, xout => redist6_yip1_7_uid132_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- twoToMiSiYip_uid140_sincosTest(BITSELECT,139)@7
    twoToMiSiYip_uid140_sincosTest_b <= STD_LOGIC_VECTOR(redist6_yip1_7_uid132_sincosTest_b_1_q(22 downto 7));

    -- twoToMiSiYip_uid121_sincosTest(BITSELECT,120)@6
    twoToMiSiYip_uid121_sincosTest_b <= STD_LOGIC_VECTOR(redist9_yip1_6_uid113_sincosTest_b_1_q(22 downto 6));

    -- xip1E_7_uid124_sincosTest(ADDSUB,123)@6
    xip1E_7_uid124_sincosTest_s <= xMSB_uid115_sincosTest_b;
    xip1E_7_uid124_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 23 => redist10_xip1_6_uid112_sincosTest_b_1_q(22)) & redist10_xip1_6_uid112_sincosTest_b_1_q));
    xip1E_7_uid124_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 17 => twoToMiSiYip_uid121_sincosTest_b(16)) & twoToMiSiYip_uid121_sincosTest_b));
    xip1E_7_uid124_sincosTest_combproc: PROCESS (xip1E_7_uid124_sincosTest_a, xip1E_7_uid124_sincosTest_b, xip1E_7_uid124_sincosTest_s)
    BEGIN
        IF (xip1E_7_uid124_sincosTest_s = "1") THEN
            xip1E_7_uid124_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_7_uid124_sincosTest_a) + SIGNED(xip1E_7_uid124_sincosTest_b));
        ELSE
            xip1E_7_uid124_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_7_uid124_sincosTest_a) - SIGNED(xip1E_7_uid124_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_7_uid124_sincosTest_q <= xip1E_7_uid124_sincosTest_o(23 downto 0);

    -- xip1_7_uid131_sincosTest(BITSELECT,130)@6
    xip1_7_uid131_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_7_uid124_sincosTest_q(22 downto 0));
    xip1_7_uid131_sincosTest_b <= STD_LOGIC_VECTOR(xip1_7_uid131_sincosTest_in(22 downto 0));

    -- redist7_xip1_7_uid131_sincosTest_b_1(DELAY,192)
    redist7_xip1_7_uid131_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_7_uid131_sincosTest_b, xout => redist7_xip1_7_uid131_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- xip1E_8_uid143_sincosTest(ADDSUB,142)@7
    xip1E_8_uid143_sincosTest_s <= xMSB_uid134_sincosTest_b;
    xip1E_8_uid143_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 23 => redist7_xip1_7_uid131_sincosTest_b_1_q(22)) & redist7_xip1_7_uid131_sincosTest_b_1_q));
    xip1E_8_uid143_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 16 => twoToMiSiYip_uid140_sincosTest_b(15)) & twoToMiSiYip_uid140_sincosTest_b));
    xip1E_8_uid143_sincosTest_combproc: PROCESS (xip1E_8_uid143_sincosTest_a, xip1E_8_uid143_sincosTest_b, xip1E_8_uid143_sincosTest_s)
    BEGIN
        IF (xip1E_8_uid143_sincosTest_s = "1") THEN
            xip1E_8_uid143_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_8_uid143_sincosTest_a) + SIGNED(xip1E_8_uid143_sincosTest_b));
        ELSE
            xip1E_8_uid143_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_8_uid143_sincosTest_a) - SIGNED(xip1E_8_uid143_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_8_uid143_sincosTest_q <= xip1E_8_uid143_sincosTest_o(23 downto 0);

    -- xip1_8_uid150_sincosTest(BITSELECT,149)@7
    xip1_8_uid150_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_8_uid143_sincosTest_q(22 downto 0));
    xip1_8_uid150_sincosTest_b <= STD_LOGIC_VECTOR(xip1_8_uid150_sincosTest_in(22 downto 0));

    -- redist4_xip1_8_uid150_sincosTest_b_1(DELAY,189)
    redist4_xip1_8_uid150_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_8_uid150_sincosTest_b, xout => redist4_xip1_8_uid150_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- twoToMiSiXip_uid158_sincosTest(BITSELECT,157)@8
    twoToMiSiXip_uid158_sincosTest_b <= STD_LOGIC_VECTOR(redist4_xip1_8_uid150_sincosTest_b_1_q(22 downto 8));

    -- signOfSelectionSignal_uid136_sincosTest(LOGICAL,135)@7
    signOfSelectionSignal_uid136_sincosTest_q <= not (xMSB_uid134_sincosTest_b);

    -- twoToMiSiXip_uid139_sincosTest(BITSELECT,138)@7
    twoToMiSiXip_uid139_sincosTest_b <= STD_LOGIC_VECTOR(redist7_xip1_7_uid131_sincosTest_b_1_q(22 downto 7));

    -- yip1E_8_uid144_sincosTest(ADDSUB,143)@7
    yip1E_8_uid144_sincosTest_s <= signOfSelectionSignal_uid136_sincosTest_q;
    yip1E_8_uid144_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 23 => redist6_yip1_7_uid132_sincosTest_b_1_q(22)) & redist6_yip1_7_uid132_sincosTest_b_1_q));
    yip1E_8_uid144_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 16 => twoToMiSiXip_uid139_sincosTest_b(15)) & twoToMiSiXip_uid139_sincosTest_b));
    yip1E_8_uid144_sincosTest_combproc: PROCESS (yip1E_8_uid144_sincosTest_a, yip1E_8_uid144_sincosTest_b, yip1E_8_uid144_sincosTest_s)
    BEGIN
        IF (yip1E_8_uid144_sincosTest_s = "1") THEN
            yip1E_8_uid144_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_8_uid144_sincosTest_a) + SIGNED(yip1E_8_uid144_sincosTest_b));
        ELSE
            yip1E_8_uid144_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_8_uid144_sincosTest_a) - SIGNED(yip1E_8_uid144_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_8_uid144_sincosTest_q <= yip1E_8_uid144_sincosTest_o(23 downto 0);

    -- yip1_8_uid151_sincosTest(BITSELECT,150)@7
    yip1_8_uid151_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_8_uid144_sincosTest_q(22 downto 0));
    yip1_8_uid151_sincosTest_b <= STD_LOGIC_VECTOR(yip1_8_uid151_sincosTest_in(22 downto 0));

    -- redist3_yip1_8_uid151_sincosTest_b_1(DELAY,188)
    redist3_yip1_8_uid151_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_8_uid151_sincosTest_b, xout => redist3_yip1_8_uid151_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- yip1E_9_uid163_sincosTest(ADDSUB,162)@8
    yip1E_9_uid163_sincosTest_s <= signOfSelectionSignal_uid155_sincosTest_q;
    yip1E_9_uid163_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 23 => redist3_yip1_8_uid151_sincosTest_b_1_q(22)) & redist3_yip1_8_uid151_sincosTest_b_1_q));
    yip1E_9_uid163_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 15 => twoToMiSiXip_uid158_sincosTest_b(14)) & twoToMiSiXip_uid158_sincosTest_b));
    yip1E_9_uid163_sincosTest_combproc: PROCESS (yip1E_9_uid163_sincosTest_a, yip1E_9_uid163_sincosTest_b, yip1E_9_uid163_sincosTest_s)
    BEGIN
        IF (yip1E_9_uid163_sincosTest_s = "1") THEN
            yip1E_9_uid163_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_9_uid163_sincosTest_a) + SIGNED(yip1E_9_uid163_sincosTest_b));
        ELSE
            yip1E_9_uid163_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_9_uid163_sincosTest_a) - SIGNED(yip1E_9_uid163_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_9_uid163_sincosTest_q <= yip1E_9_uid163_sincosTest_o(23 downto 0);

    -- yip1_9_uid170_sincosTest(BITSELECT,169)@8
    yip1_9_uid170_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_9_uid163_sincosTest_q(22 downto 0));
    yip1_9_uid170_sincosTest_b <= STD_LOGIC_VECTOR(yip1_9_uid170_sincosTest_in(22 downto 0));

    -- ySumPreRnd_uid176_sincosTest(BITSELECT,175)@8
    ySumPreRnd_uid176_sincosTest_in <= yip1_9_uid170_sincosTest_b(20 downto 0);
    ySumPreRnd_uid176_sincosTest_b <= ySumPreRnd_uid176_sincosTest_in(20 downto 12);

    -- redist0_ySumPreRnd_uid176_sincosTest_b_1(DELAY,185)
    redist0_ySumPreRnd_uid176_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 9, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => ySumPreRnd_uid176_sincosTest_b, xout => redist0_ySumPreRnd_uid176_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- ySumPostRnd_uid179_sincosTest(ADD,178)@9
    ySumPostRnd_uid179_sincosTest_a <= STD_LOGIC_VECTOR("0" & redist0_ySumPreRnd_uid176_sincosTest_b_1_q);
    ySumPostRnd_uid179_sincosTest_b <= STD_LOGIC_VECTOR("000000000" & VCC_q);
    ySumPostRnd_uid179_sincosTest_o <= STD_LOGIC_VECTOR(UNSIGNED(ySumPostRnd_uid179_sincosTest_a) + UNSIGNED(ySumPostRnd_uid179_sincosTest_b));
    ySumPostRnd_uid179_sincosTest_q <= ySumPostRnd_uid179_sincosTest_o(9 downto 0);

    -- yPostExc_uid181_sincosTest(BITSELECT,180)@9
    yPostExc_uid181_sincosTest_in <= ySumPostRnd_uid179_sincosTest_q(8 downto 0);
    yPostExc_uid181_sincosTest_b <= yPostExc_uid181_sincosTest_in(8 downto 1);

    -- twoToMiSiYip_uid159_sincosTest(BITSELECT,158)@8
    twoToMiSiYip_uid159_sincosTest_b <= STD_LOGIC_VECTOR(redist3_yip1_8_uid151_sincosTest_b_1_q(22 downto 8));

    -- xip1E_9_uid162_sincosTest(ADDSUB,161)@8
    xip1E_9_uid162_sincosTest_s <= redist2_xMSB_uid153_sincosTest_b_1_q;
    xip1E_9_uid162_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 23 => redist4_xip1_8_uid150_sincosTest_b_1_q(22)) & redist4_xip1_8_uid150_sincosTest_b_1_q));
    xip1E_9_uid162_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 15 => twoToMiSiYip_uid159_sincosTest_b(14)) & twoToMiSiYip_uid159_sincosTest_b));
    xip1E_9_uid162_sincosTest_combproc: PROCESS (xip1E_9_uid162_sincosTest_a, xip1E_9_uid162_sincosTest_b, xip1E_9_uid162_sincosTest_s)
    BEGIN
        IF (xip1E_9_uid162_sincosTest_s = "1") THEN
            xip1E_9_uid162_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_9_uid162_sincosTest_a) + SIGNED(xip1E_9_uid162_sincosTest_b));
        ELSE
            xip1E_9_uid162_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_9_uid162_sincosTest_a) - SIGNED(xip1E_9_uid162_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_9_uid162_sincosTest_q <= xip1E_9_uid162_sincosTest_o(23 downto 0);

    -- xip1_9_uid169_sincosTest(BITSELECT,168)@8
    xip1_9_uid169_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_9_uid162_sincosTest_q(22 downto 0));
    xip1_9_uid169_sincosTest_b <= STD_LOGIC_VECTOR(xip1_9_uid169_sincosTest_in(22 downto 0));

    -- xSumPreRnd_uid172_sincosTest(BITSELECT,171)@8
    xSumPreRnd_uid172_sincosTest_in <= xip1_9_uid169_sincosTest_b(20 downto 0);
    xSumPreRnd_uid172_sincosTest_b <= xSumPreRnd_uid172_sincosTest_in(20 downto 12);

    -- redist1_xSumPreRnd_uid172_sincosTest_b_1(DELAY,186)
    redist1_xSumPreRnd_uid172_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 9, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xSumPreRnd_uid172_sincosTest_b, xout => redist1_xSumPreRnd_uid172_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- xSumPostRnd_uid175_sincosTest(ADD,174)@9
    xSumPostRnd_uid175_sincosTest_a <= STD_LOGIC_VECTOR("0" & redist1_xSumPreRnd_uid172_sincosTest_b_1_q);
    xSumPostRnd_uid175_sincosTest_b <= STD_LOGIC_VECTOR("000000000" & VCC_q);
    xSumPostRnd_uid175_sincosTest_o <= STD_LOGIC_VECTOR(UNSIGNED(xSumPostRnd_uid175_sincosTest_a) + UNSIGNED(xSumPostRnd_uid175_sincosTest_b));
    xSumPostRnd_uid175_sincosTest_q <= xSumPostRnd_uid175_sincosTest_o(9 downto 0);

    -- xPostExc_uid180_sincosTest(BITSELECT,179)@9
    xPostExc_uid180_sincosTest_in <= xSumPostRnd_uid175_sincosTest_q(8 downto 0);
    xPostExc_uid180_sincosTest_b <= xPostExc_uid180_sincosTest_in(8 downto 1);

    -- xOut(GPOUT,4)@9
    c <= xPostExc_uid180_sincosTest_b;
    s <= yPostExc_uid181_sincosTest_b;

END normal;
