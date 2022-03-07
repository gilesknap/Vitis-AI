-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and OpenCL
-- Version: 2020.2
-- Copyright (C) 1986-2020 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity gaincontrolkernel is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    src1_data_V_V_dout : IN STD_LOGIC_VECTOR (39 downto 0);
    src1_data_V_V_empty_n : IN STD_LOGIC;
    src1_data_V_V_read : OUT STD_LOGIC;
    dst_data_V_V_din : OUT STD_LOGIC_VECTOR (39 downto 0);
    dst_data_V_V_full_n : IN STD_LOGIC;
    dst_data_V_V_write : OUT STD_LOGIC;
    height : IN STD_LOGIC_VECTOR (15 downto 0);
    width : IN STD_LOGIC_VECTOR (13 downto 0) );
end;


architecture behav of gaincontrolkernel is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (3 downto 0) := "0001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (3 downto 0) := "0010";
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (3 downto 0) := "0100";
    constant ap_ST_fsm_state7 : STD_LOGIC_VECTOR (3 downto 0) := "1000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv13_0 : STD_LOGIC_VECTOR (12 downto 0) := "0000000000000";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv14_0 : STD_LOGIC_VECTOR (13 downto 0) := "00000000000000";
    constant ap_const_lv13_1 : STD_LOGIC_VECTOR (12 downto 0) := "0000000000001";
    constant ap_const_lv14_1 : STD_LOGIC_VECTOR (13 downto 0) := "00000000000001";
    constant ap_const_lv32_A : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001010";
    constant ap_const_lv32_13 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010011";
    constant ap_const_lv32_14 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010100";
    constant ap_const_lv32_1D : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011101";
    constant ap_const_lv32_1E : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011110";
    constant ap_const_lv32_27 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000100111";
    constant ap_const_lv32_11 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010001";
    constant ap_const_lv32_7 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000111";
    constant ap_const_lv32_10 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010000";
    constant ap_const_lv10_3FF : STD_LOGIC_VECTOR (9 downto 0) := "1111111111";
    constant ap_const_lv18_9D : STD_LOGIC_VECTOR (17 downto 0) := "000000000010011101";
    constant ap_const_lv18_8C : STD_LOGIC_VECTOR (17 downto 0) := "000000000010001100";

    signal ap_CS_fsm : STD_LOGIC_VECTOR (3 downto 0) := "0001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal src1_data_V_V_blk_n : STD_LOGIC;
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal icmp_ln85_reg_399 : STD_LOGIC_VECTOR (0 downto 0);
    signal dst_data_V_V_blk_n : STD_LOGIC;
    signal ap_enable_reg_pp0_iter3 : STD_LOGIC := '0';
    signal icmp_ln85_reg_399_pp0_iter2_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal t_V_2_reg_124 : STD_LOGIC_VECTOR (13 downto 0);
    signal trunc_ln1597_fu_135_p1 : STD_LOGIC_VECTOR (0 downto 0);
    signal trunc_ln1597_reg_382 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal icmp_ln887_fu_143_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_V_fu_148_p2 : STD_LOGIC_VECTOR (12 downto 0);
    signal i_V_reg_394 : STD_LOGIC_VECTOR (12 downto 0);
    signal icmp_ln85_fu_154_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_block_state3_pp0_stage0_iter0 : BOOLEAN;
    signal ap_block_state4_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_state5_pp0_stage0_iter2 : BOOLEAN;
    signal ap_block_state6_pp0_stage0_iter3 : BOOLEAN;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal icmp_ln85_reg_399_pp0_iter1_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal add_ln1597_fu_159_p2 : STD_LOGIC_VECTOR (13 downto 0);
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC := '0';
    signal trunc_ln647_fu_165_p1 : STD_LOGIC_VECTOR (9 downto 0);
    signal trunc_ln647_reg_408 : STD_LOGIC_VECTOR (9 downto 0);
    signal p_Result_1_reg_414 : STD_LOGIC_VECTOR (9 downto 0);
    signal p_Result_2_reg_420 : STD_LOGIC_VECTOR (9 downto 0);
    signal p_Result_3_reg_426 : STD_LOGIC_VECTOR (9 downto 0);
    signal select_ln1597_fu_226_p3 : STD_LOGIC_VECTOR (9 downto 0);
    signal select_ln1597_reg_432 : STD_LOGIC_VECTOR (9 downto 0);
    signal select_ln1597_1_fu_259_p3 : STD_LOGIC_VECTOR (9 downto 0);
    signal select_ln1597_1_reg_437 : STD_LOGIC_VECTOR (9 downto 0);
    signal select_ln1597_2_fu_292_p3 : STD_LOGIC_VECTOR (9 downto 0);
    signal select_ln1597_2_reg_442 : STD_LOGIC_VECTOR (9 downto 0);
    signal select_ln1597_3_fu_325_p3 : STD_LOGIC_VECTOR (9 downto 0);
    signal select_ln1597_3_reg_447 : STD_LOGIC_VECTOR (9 downto 0);
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal ap_condition_pp0_exit_iter0_state3 : STD_LOGIC;
    signal ap_enable_reg_pp0_iter2 : STD_LOGIC := '0';
    signal t_V_reg_113 : STD_LOGIC_VECTOR (12 downto 0);
    signal ap_CS_fsm_state7 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state7 : signal is "none";
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal zext_ln887_fu_139_p1 : STD_LOGIC_VECTOR (15 downto 0);
    signal mul_ln1503_fu_340_p2 : STD_LOGIC_VECTOR (17 downto 0);
    signal tmp_138_fu_202_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal trunc_ln7_fu_209_p4 : STD_LOGIC_VECTOR (9 downto 0);
    signal select_ln53_fu_218_p3 : STD_LOGIC_VECTOR (9 downto 0);
    signal mul_ln1503_1_fu_348_p2 : STD_LOGIC_VECTOR (17 downto 0);
    signal tmp_139_fu_235_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal trunc_ln53_1_fu_242_p4 : STD_LOGIC_VECTOR (9 downto 0);
    signal select_ln53_1_fu_251_p3 : STD_LOGIC_VECTOR (9 downto 0);
    signal mul_ln1503_2_fu_356_p2 : STD_LOGIC_VECTOR (17 downto 0);
    signal tmp_140_fu_268_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal trunc_ln53_2_fu_275_p4 : STD_LOGIC_VECTOR (9 downto 0);
    signal select_ln53_2_fu_284_p3 : STD_LOGIC_VECTOR (9 downto 0);
    signal mul_ln1503_3_fu_364_p2 : STD_LOGIC_VECTOR (17 downto 0);
    signal tmp_141_fu_301_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal trunc_ln53_3_fu_308_p4 : STD_LOGIC_VECTOR (9 downto 0);
    signal select_ln53_3_fu_317_p3 : STD_LOGIC_VECTOR (9 downto 0);
    signal mul_ln1503_fu_340_p0 : STD_LOGIC_VECTOR (8 downto 0);
    signal mul_ln1503_fu_340_p1 : STD_LOGIC_VECTOR (9 downto 0);
    signal mul_ln1503_1_fu_348_p0 : STD_LOGIC_VECTOR (8 downto 0);
    signal mul_ln1503_1_fu_348_p1 : STD_LOGIC_VECTOR (9 downto 0);
    signal mul_ln1503_2_fu_356_p0 : STD_LOGIC_VECTOR (8 downto 0);
    signal mul_ln1503_2_fu_356_p1 : STD_LOGIC_VECTOR (9 downto 0);
    signal mul_ln1503_3_fu_364_p0 : STD_LOGIC_VECTOR (8 downto 0);
    signal mul_ln1503_3_fu_364_p1 : STD_LOGIC_VECTOR (9 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (3 downto 0);
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_enable_pp0 : STD_LOGIC;
    signal mul_ln1503_1_fu_348_p10 : STD_LOGIC_VECTOR (17 downto 0);
    signal mul_ln1503_2_fu_356_p10 : STD_LOGIC_VECTOR (17 downto 0);
    signal mul_ln1503_3_fu_364_p10 : STD_LOGIC_VECTOR (17 downto 0);
    signal mul_ln1503_fu_340_p10 : STD_LOGIC_VECTOR (17 downto 0);

    component ISPPipeline_acceljbC IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (8 downto 0);
        din1 : IN STD_LOGIC_VECTOR (9 downto 0);
        dout : OUT STD_LOGIC_VECTOR (17 downto 0) );
    end component;



begin
    ISPPipeline_acceljbC_U89 : component ISPPipeline_acceljbC
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 9,
        din1_WIDTH => 10,
        dout_WIDTH => 18)
    port map (
        din0 => mul_ln1503_fu_340_p0,
        din1 => mul_ln1503_fu_340_p1,
        dout => mul_ln1503_fu_340_p2);

    ISPPipeline_acceljbC_U90 : component ISPPipeline_acceljbC
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 9,
        din1_WIDTH => 10,
        dout_WIDTH => 18)
    port map (
        din0 => mul_ln1503_1_fu_348_p0,
        din1 => mul_ln1503_1_fu_348_p1,
        dout => mul_ln1503_1_fu_348_p2);

    ISPPipeline_acceljbC_U91 : component ISPPipeline_acceljbC
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 9,
        din1_WIDTH => 10,
        dout_WIDTH => 18)
    port map (
        din0 => mul_ln1503_2_fu_356_p0,
        din1 => mul_ln1503_2_fu_356_p1,
        dout => mul_ln1503_2_fu_356_p2);

    ISPPipeline_acceljbC_U92 : component ISPPipeline_acceljbC
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 9,
        din1_WIDTH => 10,
        dout_WIDTH => 18)
    port map (
        din0 => mul_ln1503_3_fu_364_p0,
        din1 => mul_ln1503_3_fu_364_p1,
        dout => mul_ln1503_3_fu_364_p2);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter0_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter0 <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_logic_1 = ap_condition_pp0_exit_iter0_state3) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then 
                    ap_enable_reg_pp0_iter0 <= ap_const_logic_0;
                elsif (((icmp_ln887_fu_143_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                    ap_enable_reg_pp0_iter0 <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then
                    if ((ap_const_logic_1 = ap_condition_pp0_exit_iter0_state3)) then 
                        ap_enable_reg_pp0_iter1 <= (ap_const_logic_1 xor ap_condition_pp0_exit_iter0_state3);
                    elsif ((ap_const_boolean_1 = ap_const_boolean_1)) then 
                        ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
                    end if;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter2_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter2 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter3_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter3 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
                elsif (((icmp_ln887_fu_143_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                    ap_enable_reg_pp0_iter3 <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    t_V_2_reg_124_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln85_fu_154_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                t_V_2_reg_124 <= add_ln1597_fu_159_p2;
            elsif (((icmp_ln887_fu_143_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                t_V_2_reg_124 <= ap_const_lv14_0;
            end if; 
        end if;
    end process;

    t_V_reg_113_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state7)) then 
                t_V_reg_113 <= i_V_reg_394;
            elsif (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                t_V_reg_113 <= ap_const_lv13_0;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state2)) then
                i_V_reg_394 <= i_V_fu_148_p2;
                trunc_ln1597_reg_382 <= trunc_ln1597_fu_135_p1;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                icmp_ln85_reg_399 <= icmp_ln85_fu_154_p2;
                icmp_ln85_reg_399_pp0_iter1_reg <= icmp_ln85_reg_399;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                icmp_ln85_reg_399_pp0_iter2_reg <= icmp_ln85_reg_399_pp0_iter1_reg;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln85_reg_399 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                p_Result_1_reg_414 <= src1_data_V_V_dout(19 downto 10);
                p_Result_2_reg_420 <= src1_data_V_V_dout(29 downto 20);
                p_Result_3_reg_426 <= src1_data_V_V_dout(39 downto 30);
                trunc_ln647_reg_408 <= trunc_ln647_fu_165_p1;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln85_reg_399_pp0_iter1_reg = ap_const_lv1_0))) then
                select_ln1597_1_reg_437 <= select_ln1597_1_fu_259_p3;
                select_ln1597_2_reg_442 <= select_ln1597_2_fu_292_p3;
                select_ln1597_3_reg_447 <= select_ln1597_3_fu_325_p3;
                select_ln1597_reg_432 <= select_ln1597_fu_226_p3;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter3, ap_CS_fsm_state2, icmp_ln887_fu_143_p2, icmp_ln85_fu_154_p2, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_subdone, ap_enable_reg_pp0_iter2)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((icmp_ln887_fu_143_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                end if;
            when ap_ST_fsm_pp0_stage0 => 
                if ((not(((icmp_ln85_fu_154_p2 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) and not(((ap_enable_reg_pp0_iter3 = ap_const_logic_1) and (ap_enable_reg_pp0_iter2 = ap_const_logic_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))))) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                elsif ((((icmp_ln85_fu_154_p2 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) or ((ap_enable_reg_pp0_iter3 = ap_const_logic_1) and (ap_enable_reg_pp0_iter2 = ap_const_logic_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone)))) then
                    ap_NS_fsm <= ap_ST_fsm_state7;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                end if;
            when ap_ST_fsm_state7 => 
                ap_NS_fsm <= ap_ST_fsm_state2;
            when others =>  
                ap_NS_fsm <= "XXXX";
        end case;
    end process;
    add_ln1597_fu_159_p2 <= std_logic_vector(unsigned(t_V_2_reg_124) + unsigned(ap_const_lv14_1));
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(2);
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state7 <= ap_CS_fsm(3);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_pp0_stage0_01001_assign_proc : process(src1_data_V_V_empty_n, dst_data_V_V_full_n, ap_enable_reg_pp0_iter1, icmp_ln85_reg_399, ap_enable_reg_pp0_iter3, icmp_ln85_reg_399_pp0_iter2_reg)
    begin
                ap_block_pp0_stage0_01001 <= (((icmp_ln85_reg_399_pp0_iter2_reg = ap_const_lv1_0) and (dst_data_V_V_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1)) or ((icmp_ln85_reg_399 = ap_const_lv1_0) and (src1_data_V_V_empty_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1)));
    end process;


    ap_block_pp0_stage0_11001_assign_proc : process(src1_data_V_V_empty_n, dst_data_V_V_full_n, ap_enable_reg_pp0_iter1, icmp_ln85_reg_399, ap_enable_reg_pp0_iter3, icmp_ln85_reg_399_pp0_iter2_reg)
    begin
                ap_block_pp0_stage0_11001 <= (((icmp_ln85_reg_399_pp0_iter2_reg = ap_const_lv1_0) and (dst_data_V_V_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1)) or ((icmp_ln85_reg_399 = ap_const_lv1_0) and (src1_data_V_V_empty_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1)));
    end process;


    ap_block_pp0_stage0_subdone_assign_proc : process(src1_data_V_V_empty_n, dst_data_V_V_full_n, ap_enable_reg_pp0_iter1, icmp_ln85_reg_399, ap_enable_reg_pp0_iter3, icmp_ln85_reg_399_pp0_iter2_reg)
    begin
                ap_block_pp0_stage0_subdone <= (((icmp_ln85_reg_399_pp0_iter2_reg = ap_const_lv1_0) and (dst_data_V_V_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1)) or ((icmp_ln85_reg_399 = ap_const_lv1_0) and (src1_data_V_V_empty_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1)));
    end process;

        ap_block_state3_pp0_stage0_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_state4_pp0_stage0_iter1_assign_proc : process(src1_data_V_V_empty_n, icmp_ln85_reg_399)
    begin
                ap_block_state4_pp0_stage0_iter1 <= ((icmp_ln85_reg_399 = ap_const_lv1_0) and (src1_data_V_V_empty_n = ap_const_logic_0));
    end process;

        ap_block_state5_pp0_stage0_iter2 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_state6_pp0_stage0_iter3_assign_proc : process(dst_data_V_V_full_n, icmp_ln85_reg_399_pp0_iter2_reg)
    begin
                ap_block_state6_pp0_stage0_iter3 <= ((icmp_ln85_reg_399_pp0_iter2_reg = ap_const_lv1_0) and (dst_data_V_V_full_n = ap_const_logic_0));
    end process;


    ap_condition_pp0_exit_iter0_state3_assign_proc : process(icmp_ln85_fu_154_p2)
    begin
        if ((icmp_ln85_fu_154_p2 = ap_const_lv1_1)) then 
            ap_condition_pp0_exit_iter0_state3 <= ap_const_logic_1;
        else 
            ap_condition_pp0_exit_iter0_state3 <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_assign_proc : process(ap_start, ap_CS_fsm_state1, ap_CS_fsm_state2, icmp_ln887_fu_143_p2)
    begin
        if ((((icmp_ln887_fu_143_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2)) or ((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1)))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;

    ap_enable_pp0 <= (ap_idle_pp0 xor ap_const_logic_1);

    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter3, ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter2)
    begin
        if (((ap_enable_reg_pp0_iter0 = ap_const_logic_0) and (ap_enable_reg_pp0_iter3 = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_CS_fsm_state2, icmp_ln887_fu_143_p2)
    begin
        if (((icmp_ln887_fu_143_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    dst_data_V_V_blk_n_assign_proc : process(dst_data_V_V_full_n, ap_block_pp0_stage0, ap_enable_reg_pp0_iter3, icmp_ln85_reg_399_pp0_iter2_reg)
    begin
        if (((icmp_ln85_reg_399_pp0_iter2_reg = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1))) then 
            dst_data_V_V_blk_n <= dst_data_V_V_full_n;
        else 
            dst_data_V_V_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    dst_data_V_V_din <= (((select_ln1597_3_reg_447 & select_ln1597_2_reg_442) & select_ln1597_1_reg_437) & select_ln1597_reg_432);

    dst_data_V_V_write_assign_proc : process(ap_enable_reg_pp0_iter3, icmp_ln85_reg_399_pp0_iter2_reg, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln85_reg_399_pp0_iter2_reg = ap_const_lv1_0) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1))) then 
            dst_data_V_V_write <= ap_const_logic_1;
        else 
            dst_data_V_V_write <= ap_const_logic_0;
        end if; 
    end process;

    i_V_fu_148_p2 <= std_logic_vector(unsigned(ap_const_lv13_1) + unsigned(t_V_reg_113));
    icmp_ln85_fu_154_p2 <= "1" when (t_V_2_reg_124 = width) else "0";
    icmp_ln887_fu_143_p2 <= "1" when (unsigned(zext_ln887_fu_139_p1) < unsigned(height)) else "0";
    mul_ln1503_1_fu_348_p0 <= ap_const_lv18_8C(9 - 1 downto 0);
    mul_ln1503_1_fu_348_p1 <= mul_ln1503_1_fu_348_p10(10 - 1 downto 0);
    mul_ln1503_1_fu_348_p10 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(p_Result_1_reg_414),18));
    mul_ln1503_2_fu_356_p0 <= ap_const_lv18_9D(9 - 1 downto 0);
    mul_ln1503_2_fu_356_p1 <= mul_ln1503_2_fu_356_p10(10 - 1 downto 0);
    mul_ln1503_2_fu_356_p10 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(p_Result_2_reg_420),18));
    mul_ln1503_3_fu_364_p0 <= ap_const_lv18_8C(9 - 1 downto 0);
    mul_ln1503_3_fu_364_p1 <= mul_ln1503_3_fu_364_p10(10 - 1 downto 0);
    mul_ln1503_3_fu_364_p10 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(p_Result_3_reg_426),18));
    mul_ln1503_fu_340_p0 <= ap_const_lv18_9D(9 - 1 downto 0);
    mul_ln1503_fu_340_p1 <= mul_ln1503_fu_340_p10(10 - 1 downto 0);
    mul_ln1503_fu_340_p10 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(trunc_ln647_reg_408),18));
    select_ln1597_1_fu_259_p3 <= 
        select_ln53_1_fu_251_p3 when (trunc_ln1597_reg_382(0) = '1') else 
        p_Result_1_reg_414;
    select_ln1597_2_fu_292_p3 <= 
        p_Result_2_reg_420 when (trunc_ln1597_reg_382(0) = '1') else 
        select_ln53_2_fu_284_p3;
    select_ln1597_3_fu_325_p3 <= 
        select_ln53_3_fu_317_p3 when (trunc_ln1597_reg_382(0) = '1') else 
        p_Result_3_reg_426;
    select_ln1597_fu_226_p3 <= 
        trunc_ln647_reg_408 when (trunc_ln1597_reg_382(0) = '1') else 
        select_ln53_fu_218_p3;
    select_ln53_1_fu_251_p3 <= 
        ap_const_lv10_3FF when (tmp_139_fu_235_p3(0) = '1') else 
        trunc_ln53_1_fu_242_p4;
    select_ln53_2_fu_284_p3 <= 
        ap_const_lv10_3FF when (tmp_140_fu_268_p3(0) = '1') else 
        trunc_ln53_2_fu_275_p4;
    select_ln53_3_fu_317_p3 <= 
        ap_const_lv10_3FF when (tmp_141_fu_301_p3(0) = '1') else 
        trunc_ln53_3_fu_308_p4;
    select_ln53_fu_218_p3 <= 
        ap_const_lv10_3FF when (tmp_138_fu_202_p3(0) = '1') else 
        trunc_ln7_fu_209_p4;

    src1_data_V_V_blk_n_assign_proc : process(src1_data_V_V_empty_n, ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0, icmp_ln85_reg_399)
    begin
        if (((icmp_ln85_reg_399 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            src1_data_V_V_blk_n <= src1_data_V_V_empty_n;
        else 
            src1_data_V_V_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    src1_data_V_V_read_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, icmp_ln85_reg_399, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln85_reg_399 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            src1_data_V_V_read <= ap_const_logic_1;
        else 
            src1_data_V_V_read <= ap_const_logic_0;
        end if; 
    end process;

    tmp_138_fu_202_p3 <= mul_ln1503_fu_340_p2(17 downto 17);
    tmp_139_fu_235_p3 <= mul_ln1503_1_fu_348_p2(17 downto 17);
    tmp_140_fu_268_p3 <= mul_ln1503_2_fu_356_p2(17 downto 17);
    tmp_141_fu_301_p3 <= mul_ln1503_3_fu_364_p2(17 downto 17);
    trunc_ln1597_fu_135_p1 <= t_V_reg_113(1 - 1 downto 0);
    trunc_ln53_1_fu_242_p4 <= mul_ln1503_1_fu_348_p2(16 downto 7);
    trunc_ln53_2_fu_275_p4 <= mul_ln1503_2_fu_356_p2(16 downto 7);
    trunc_ln53_3_fu_308_p4 <= mul_ln1503_3_fu_364_p2(16 downto 7);
    trunc_ln647_fu_165_p1 <= src1_data_V_V_dout(10 - 1 downto 0);
    trunc_ln7_fu_209_p4 <= mul_ln1503_fu_340_p2(16 downto 7);
    zext_ln887_fu_139_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(t_V_reg_113),16));
end behav;