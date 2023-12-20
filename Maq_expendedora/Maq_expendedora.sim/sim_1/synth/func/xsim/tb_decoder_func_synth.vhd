-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
-- Date        : Wed Dec 20 17:42:49 2023
-- Host        : LAPTOP-KHM45S5R running 64-bit major release  (build 9200)
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               C:/Users/kikem/Documents/GitHub/Maq_expendedora/Maq_expendedora/Maq_expendedora.sim/sim_1/synth/func/xsim/tb_decoder_func_synth.vhd
-- Design      : TOP
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity EDGEDCTR is
  port (
    \FSM_sequential_current_reg[1]\ : out STD_LOGIC;
    \FSM_sequential_current_reg[0]\ : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 0 to 0 );
    \sreg_2_reg[1]_0\ : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    \sreg_2_reg[1]_1\ : out STD_LOGIC;
    \sreg_1_reg[0]_0\ : in STD_LOGIC;
    CLK_IBUF_BUFG : in STD_LOGIC;
    \sreg_2_reg[0]_0\ : in STD_LOGIC;
    \aux_reg[0]_0\ : in STD_LOGIC;
    \FSM_sequential_current_reg[1]_0\ : in STD_LOGIC;
    SW_IBUF : in STD_LOGIC_VECTOR ( 3 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 0 to 0 );
    act_saldo : in STD_LOGIC;
    \FSM_sequential_current_reg[1]_1\ : in STD_LOGIC;
    current : in STD_LOGIC_VECTOR ( 0 to 0 );
    ONE_EUR : in STD_LOGIC;
    drink_out : in STD_LOGIC;
    \total_reg[0]\ : in STD_LOGIC
  );
end EDGEDCTR;

architecture STRUCTURE of EDGEDCTR is
  signal \FSM_sequential_current[1]_i_4_n_0\ : STD_LOGIC;
  signal \^fsm_sequential_current_reg[0]\ : STD_LOGIC;
  signal aux : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \inst_maq/next_state\ : STD_LOGIC_VECTOR ( 1 to 1 );
  signal sreg_1 : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal sreg_2 : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \^sreg_2_reg[1]_0\ : STD_LOGIC;
  signal \^sreg_2_reg[1]_1\ : STD_LOGIC;
  signal \total[4]_i_3_n_0\ : STD_LOGIC;
  signal \total[4]_i_7_n_0\ : STD_LOGIC;
  signal \total[4]_i_8_n_0\ : STD_LOGIC;
begin
  \FSM_sequential_current_reg[0]\ <= \^fsm_sequential_current_reg[0]\;
  \sreg_2_reg[1]_0\ <= \^sreg_2_reg[1]_0\;
  \sreg_2_reg[1]_1\ <= \^sreg_2_reg[1]_1\;
\FSM_sequential_current[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000004"
    )
        port map (
      I0 => sreg_2(1),
      I1 => sreg_2(2),
      I2 => sreg_2(0),
      I3 => current(0),
      I4 => \FSM_sequential_current_reg[1]_0\,
      O => \^sreg_2_reg[1]_1\
    );
\FSM_sequential_current[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \inst_maq/next_state\(1),
      I1 => \^fsm_sequential_current_reg[0]\,
      I2 => \FSM_sequential_current_reg[1]_0\,
      O => \FSM_sequential_current_reg[1]\
    );
\FSM_sequential_current[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00FF040000000400"
    )
        port map (
      I0 => sreg_1(0),
      I1 => sreg_1(2),
      I2 => sreg_1(1),
      I3 => current(0),
      I4 => \FSM_sequential_current_reg[1]_0\,
      I5 => ONE_EUR,
      O => \inst_maq/next_state\(1)
    );
\FSM_sequential_current[1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFF10"
    )
        port map (
      I0 => \FSM_sequential_current_reg[1]_1\,
      I1 => current(0),
      I2 => \FSM_sequential_current_reg[1]_0\,
      I3 => \^sreg_2_reg[1]_1\,
      I4 => \FSM_sequential_current[1]_i_4_n_0\,
      I5 => \inst_maq/next_state\(1),
      O => \^fsm_sequential_current_reg[0]\
    );
\FSM_sequential_current[1]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF08080808080808"
    )
        port map (
      I0 => aux(0),
      I1 => aux(1),
      I2 => aux(2),
      I3 => drink_out,
      I4 => \FSM_sequential_current_reg[1]_0\,
      I5 => current(0),
      O => \FSM_sequential_current[1]_i_4_n_0\
    );
\aux_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => \aux_reg[0]_0\,
      Q => aux(0),
      R => '0'
    );
\aux_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => aux(0),
      Q => aux(1),
      R => '0'
    );
\aux_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => aux(1),
      Q => aux(2),
      R => '0'
    );
\sreg_1_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => \sreg_1_reg[0]_0\,
      Q => sreg_1(0),
      R => '0'
    );
\sreg_1_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => sreg_1(0),
      Q => sreg_1(1),
      R => '0'
    );
\sreg_1_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => sreg_1(1),
      Q => sreg_1(2),
      R => '0'
    );
\sreg_2_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => \sreg_2_reg[0]_0\,
      Q => sreg_2(0),
      R => '0'
    );
\sreg_2_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => sreg_2(0),
      Q => sreg_2(1),
      R => '0'
    );
\sreg_2_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => sreg_2(1),
      Q => sreg_2(2),
      R => '0'
    );
\total[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAA8AAA8AAA800A8"
    )
        port map (
      I0 => \^sreg_2_reg[1]_0\,
      I1 => SW_IBUF(0),
      I2 => SW_IBUF(2),
      I3 => Q(0),
      I4 => SW_IBUF(1),
      I5 => SW_IBUF(3),
      O => D(0)
    );
\total[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8A"
    )
        port map (
      I0 => act_saldo,
      I1 => \total[4]_i_3_n_0\,
      I2 => \^sreg_2_reg[1]_0\,
      O => E(0)
    );
\total[4]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"01160000"
    )
        port map (
      I0 => SW_IBUF(1),
      I1 => SW_IBUF(3),
      I2 => SW_IBUF(0),
      I3 => SW_IBUF(2),
      I4 => \total[4]_i_7_n_0\,
      O => \total[4]_i_3_n_0\
    );
\total[4]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFFB0000"
    )
        port map (
      I0 => sreg_2(1),
      I1 => sreg_2(2),
      I2 => sreg_2(0),
      I3 => \total_reg[0]\,
      I4 => \FSM_sequential_current_reg[1]_1\,
      I5 => \total[4]_i_8_n_0\,
      O => \^sreg_2_reg[1]_0\
    );
\total[4]_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => sreg_1(0),
      I1 => sreg_1(2),
      I2 => sreg_1(1),
      O => \total[4]_i_7_n_0\
    );
\total[4]_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => aux(2),
      I1 => aux(1),
      I2 => aux(0),
      O => \total[4]_i_8_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity Saldo is
  port (
    ONE_EUR : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 0 to 0 );
    \total_reg[1]_0\ : out STD_LOGIC;
    SEGMENT_OBUF : out STD_LOGIC_VECTOR ( 6 downto 0 );
    \total_reg[4]_0\ : out STD_LOGIC;
    act_saldo : in STD_LOGIC;
    \total_reg[1]_1\ : in STD_LOGIC;
    SW_IBUF : in STD_LOGIC_VECTOR ( 3 downto 0 );
    SW_S_IBUF : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \SEGMENT[2]\ : in STD_LOGIC_VECTOR ( 2 downto 0 );
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    CLK_IBUF_BUFG : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end Saldo;

architecture STRUCTURE of Saldo is
  signal ONE_EUR_reg_i_1_n_0 : STD_LOGIC;
  signal \^q\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal SALIDA : STD_LOGIC_VECTOR ( 4 downto 1 );
  signal \SEGMENT_OBUF[0]_inst_i_2_n_0\ : STD_LOGIC;
  signal \SEGMENT_OBUF[0]_inst_i_3_n_0\ : STD_LOGIC;
  signal \SEGMENT_OBUF[0]_inst_i_4_n_0\ : STD_LOGIC;
  signal \SEGMENT_OBUF[0]_inst_i_5_n_0\ : STD_LOGIC;
  signal \SEGMENT_OBUF[0]_inst_i_6_n_0\ : STD_LOGIC;
  signal \SEGMENT_OBUF[0]_inst_i_7_n_0\ : STD_LOGIC;
  signal \SEGMENT_OBUF[0]_inst_i_8_n_0\ : STD_LOGIC;
  signal \SEGMENT_OBUF[1]_inst_i_2_n_0\ : STD_LOGIC;
  signal \SEGMENT_OBUF[1]_inst_i_3_n_0\ : STD_LOGIC;
  signal \SEGMENT_OBUF[1]_inst_i_4_n_0\ : STD_LOGIC;
  signal \SEGMENT_OBUF[1]_inst_i_5_n_0\ : STD_LOGIC;
  signal \SEGMENT_OBUF[2]_inst_i_2_n_0\ : STD_LOGIC;
  signal \SEGMENT_OBUF[2]_inst_i_3_n_0\ : STD_LOGIC;
  signal \SEGMENT_OBUF[2]_inst_i_4_n_0\ : STD_LOGIC;
  signal \SEGMENT_OBUF[2]_inst_i_5_n_0\ : STD_LOGIC;
  signal \SEGMENT_OBUF[3]_inst_i_10_n_0\ : STD_LOGIC;
  signal \SEGMENT_OBUF[3]_inst_i_11_n_0\ : STD_LOGIC;
  signal \SEGMENT_OBUF[3]_inst_i_12_n_0\ : STD_LOGIC;
  signal \SEGMENT_OBUF[3]_inst_i_13_n_0\ : STD_LOGIC;
  signal \SEGMENT_OBUF[3]_inst_i_14_n_0\ : STD_LOGIC;
  signal \SEGMENT_OBUF[3]_inst_i_2_n_0\ : STD_LOGIC;
  signal \SEGMENT_OBUF[3]_inst_i_3_n_0\ : STD_LOGIC;
  signal \SEGMENT_OBUF[3]_inst_i_4_n_0\ : STD_LOGIC;
  signal \SEGMENT_OBUF[3]_inst_i_5_n_0\ : STD_LOGIC;
  signal \SEGMENT_OBUF[3]_inst_i_6_n_0\ : STD_LOGIC;
  signal \SEGMENT_OBUF[3]_inst_i_8_n_0\ : STD_LOGIC;
  signal \SEGMENT_OBUF[3]_inst_i_9_n_0\ : STD_LOGIC;
  signal \SEGMENT_OBUF[4]_inst_i_2_n_0\ : STD_LOGIC;
  signal \SEGMENT_OBUF[4]_inst_i_3_n_0\ : STD_LOGIC;
  signal \SEGMENT_OBUF[4]_inst_i_4_n_0\ : STD_LOGIC;
  signal \SEGMENT_OBUF[4]_inst_i_5_n_0\ : STD_LOGIC;
  signal \SEGMENT_OBUF[5]_inst_i_2_n_0\ : STD_LOGIC;
  signal \SEGMENT_OBUF[5]_inst_i_3_n_0\ : STD_LOGIC;
  signal \SEGMENT_OBUF[5]_inst_i_4_n_0\ : STD_LOGIC;
  signal \SEGMENT_OBUF[5]_inst_i_5_n_0\ : STD_LOGIC;
  signal \SEGMENT_OBUF[5]_inst_i_6_n_0\ : STD_LOGIC;
  signal \SEGMENT_OBUF[5]_inst_i_7_n_0\ : STD_LOGIC;
  signal \SEGMENT_OBUF[5]_inst_i_8_n_0\ : STD_LOGIC;
  signal \SEGMENT_OBUF[6]_inst_i_10_n_0\ : STD_LOGIC;
  signal \SEGMENT_OBUF[6]_inst_i_11_n_0\ : STD_LOGIC;
  signal \SEGMENT_OBUF[6]_inst_i_2_n_0\ : STD_LOGIC;
  signal \SEGMENT_OBUF[6]_inst_i_3_n_0\ : STD_LOGIC;
  signal \SEGMENT_OBUF[6]_inst_i_4_n_0\ : STD_LOGIC;
  signal \SEGMENT_OBUF[6]_inst_i_5_n_0\ : STD_LOGIC;
  signal \SEGMENT_OBUF[6]_inst_i_6_n_0\ : STD_LOGIC;
  signal \SEGMENT_OBUF[6]_inst_i_7_n_0\ : STD_LOGIC;
  signal \SEGMENT_OBUF[6]_inst_i_8_n_0\ : STD_LOGIC;
  signal \inst_decoder/display5__0\ : STD_LOGIC_VECTOR ( 5 downto 3 );
  signal \total[1]_i_1_n_0\ : STD_LOGIC;
  signal \total[1]_i_2_n_0\ : STD_LOGIC;
  signal \total[2]_i_1_n_0\ : STD_LOGIC;
  signal \total[2]_i_2_n_0\ : STD_LOGIC;
  signal \total[3]_i_1_n_0\ : STD_LOGIC;
  signal \total[3]_i_2_n_0\ : STD_LOGIC;
  signal \total[3]_i_3_n_0\ : STD_LOGIC;
  signal \total[4]_i_2_n_0\ : STD_LOGIC;
  signal \total[4]_i_5_n_0\ : STD_LOGIC;
  signal \total[4]_i_6_n_0\ : STD_LOGIC;
  signal \^total_reg[1]_0\ : STD_LOGIC;
  signal \^total_reg[4]_0\ : STD_LOGIC;
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of ONE_EUR_reg : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of ONE_EUR_reg : label is "VCC:GE GND:CLR";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \SEGMENT_OBUF[0]_inst_i_3\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \SEGMENT_OBUF[0]_inst_i_5\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \SEGMENT_OBUF[0]_inst_i_7\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \SEGMENT_OBUF[0]_inst_i_8\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \SEGMENT_OBUF[1]_inst_i_3\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \SEGMENT_OBUF[1]_inst_i_4\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \SEGMENT_OBUF[1]_inst_i_6\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \SEGMENT_OBUF[2]_inst_i_5\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \SEGMENT_OBUF[3]_inst_i_10\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \SEGMENT_OBUF[3]_inst_i_12\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \SEGMENT_OBUF[3]_inst_i_14\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \SEGMENT_OBUF[3]_inst_i_5\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \SEGMENT_OBUF[3]_inst_i_8\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \SEGMENT_OBUF[4]_inst_i_5\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \SEGMENT_OBUF[5]_inst_i_7\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \SEGMENT_OBUF[6]_inst_i_10\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \SEGMENT_OBUF[6]_inst_i_11\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \SEGMENT_OBUF[6]_inst_i_3\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \SEGMENT_OBUF[6]_inst_i_4\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \SEGMENT_OBUF[6]_inst_i_6\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \SEGMENT_OBUF[6]_inst_i_9\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \total[4]_i_6\ : label is "soft_lutpair14";
begin
  Q(0) <= \^q\(0);
  \total_reg[1]_0\ <= \^total_reg[1]_0\;
  \total_reg[4]_0\ <= \^total_reg[4]_0\;
ONE_EUR_reg: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => ONE_EUR_reg_i_1_n_0,
      G => act_saldo,
      GE => '1',
      Q => ONE_EUR
    );
ONE_EUR_reg_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000080"
    )
        port map (
      I0 => act_saldo,
      I1 => SALIDA(3),
      I2 => SALIDA(1),
      I3 => SALIDA(4),
      I4 => \^q\(0),
      I5 => SALIDA(2),
      O => ONE_EUR_reg_i_1_n_0
    );
\SEGMENT_OBUF[0]_inst_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8F3B8C0"
    )
        port map (
      I0 => \SEGMENT_OBUF[0]_inst_i_2_n_0\,
      I1 => \SEGMENT[2]\(2),
      I2 => \SEGMENT_OBUF[0]_inst_i_3_n_0\,
      I3 => \SEGMENT[2]\(1),
      I4 => \SEGMENT_OBUF[0]_inst_i_4_n_0\,
      O => SEGMENT_OBUF(0)
    );
\SEGMENT_OBUF[0]_inst_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFEFAFAAF"
    )
        port map (
      I0 => \SEGMENT[2]\(0),
      I1 => \^q\(0),
      I2 => SALIDA(3),
      I3 => SALIDA(1),
      I4 => SALIDA(2),
      I5 => SALIDA(4),
      O => \SEGMENT_OBUF[0]_inst_i_2_n_0\
    );
\SEGMENT_OBUF[0]_inst_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \SEGMENT_OBUF[0]_inst_i_5_n_0\,
      I1 => \SEGMENT[2]\(0),
      I2 => \SEGMENT_OBUF[0]_inst_i_6_n_0\,
      O => \SEGMENT_OBUF[0]_inst_i_3_n_0\
    );
\SEGMENT_OBUF[0]_inst_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB8B8"
    )
        port map (
      I0 => \SEGMENT_OBUF[0]_inst_i_6_n_0\,
      I1 => \SEGMENT[2]\(0),
      I2 => \SEGMENT_OBUF[6]_inst_i_4_n_0\,
      I3 => \SEGMENT_OBUF[0]_inst_i_7_n_0\,
      I4 => \SEGMENT_OBUF[0]_inst_i_8_n_0\,
      O => \SEGMENT_OBUF[0]_inst_i_4_n_0\
    );
\SEGMENT_OBUF[0]_inst_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEFFFFFF"
    )
        port map (
      I0 => SALIDA(2),
      I1 => \^q\(0),
      I2 => SALIDA(4),
      I3 => SALIDA(1),
      I4 => SALIDA(3),
      O => \SEGMENT_OBUF[0]_inst_i_5_n_0\
    );
\SEGMENT_OBUF[0]_inst_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAABAAABABAAA"
    )
        port map (
      I0 => \SEGMENT_OBUF[6]_inst_i_4_n_0\,
      I1 => SW_S_IBUF(2),
      I2 => \^total_reg[1]_0\,
      I3 => SW_S_IBUF(0),
      I4 => SW_S_IBUF(1),
      I5 => SW_S_IBUF(3),
      O => \SEGMENT_OBUF[0]_inst_i_6_n_0\
    );
\SEGMENT_OBUF[0]_inst_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FEED"
    )
        port map (
      I0 => SW_S_IBUF(3),
      I1 => SW_S_IBUF(1),
      I2 => SW_S_IBUF(0),
      I3 => SW_S_IBUF(2),
      O => \SEGMENT_OBUF[0]_inst_i_7_n_0\
    );
\SEGMENT_OBUF[0]_inst_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1115"
    )
        port map (
      I0 => SALIDA(4),
      I1 => SALIDA(3),
      I2 => SALIDA(2),
      I3 => SALIDA(1),
      O => \SEGMENT_OBUF[0]_inst_i_8_n_0\
    );
\SEGMENT_OBUF[1]_inst_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \SEGMENT_OBUF[1]_inst_i_2_n_0\,
      I1 => \SEGMENT[2]\(1),
      I2 => \SEGMENT_OBUF[1]_inst_i_3_n_0\,
      I3 => \SEGMENT[2]\(2),
      I4 => \SEGMENT_OBUF[6]_inst_i_4_n_0\,
      O => SEGMENT_OBUF(1)
    );
\SEGMENT_OBUF[1]_inst_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8B8B8B88BBBBBBBB"
    )
        port map (
      I0 => \SEGMENT_OBUF[6]_inst_i_5_n_0\,
      I1 => \SEGMENT[2]\(0),
      I2 => \SEGMENT_OBUF[1]_inst_i_4_n_0\,
      I3 => SALIDA(1),
      I4 => \SEGMENT_OBUF[1]_inst_i_5_n_0\,
      I5 => \^total_reg[4]_0\,
      O => \SEGMENT_OBUF[1]_inst_i_2_n_0\
    );
\SEGMENT_OBUF[1]_inst_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \SEGMENT_OBUF[6]_inst_i_7_n_0\,
      I1 => \SEGMENT[2]\(0),
      I2 => \SEGMENT_OBUF[6]_inst_i_8_n_0\,
      O => \SEGMENT_OBUF[1]_inst_i_3_n_0\
    );
\SEGMENT_OBUF[1]_inst_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BFAA"
    )
        port map (
      I0 => SALIDA(3),
      I1 => \^q\(0),
      I2 => SALIDA(1),
      I3 => SALIDA(2),
      O => \SEGMENT_OBUF[1]_inst_i_4_n_0\
    );
\SEGMENT_OBUF[1]_inst_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAFFFFFEFF"
    )
        port map (
      I0 => SALIDA(2),
      I1 => SW_S_IBUF(3),
      I2 => SW_S_IBUF(1),
      I3 => SW_S_IBUF(0),
      I4 => SW_S_IBUF(2),
      I5 => \^q\(0),
      O => \SEGMENT_OBUF[1]_inst_i_5_n_0\
    );
\SEGMENT_OBUF[1]_inst_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"01115555"
    )
        port map (
      I0 => SALIDA(4),
      I1 => SALIDA(2),
      I2 => SALIDA(1),
      I3 => \^q\(0),
      I4 => SALIDA(3),
      O => \^total_reg[4]_0\
    );
\SEGMENT_OBUF[2]_inst_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBB8BBBB8B888888"
    )
        port map (
      I0 => \SEGMENT_OBUF[2]_inst_i_2_n_0\,
      I1 => \SEGMENT[2]\(2),
      I2 => \SEGMENT[2]\(0),
      I3 => \SEGMENT_OBUF[2]_inst_i_3_n_0\,
      I4 => \SEGMENT[2]\(1),
      I5 => \SEGMENT_OBUF[6]_inst_i_4_n_0\,
      O => SEGMENT_OBUF(2)
    );
\SEGMENT_OBUF[2]_inst_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \SEGMENT_OBUF[6]_inst_i_5_n_0\,
      I1 => \SEGMENT_OBUF[2]_inst_i_4_n_0\,
      I2 => \SEGMENT[2]\(1),
      I3 => \SEGMENT_OBUF[5]_inst_i_8_n_0\,
      I4 => \SEGMENT[2]\(0),
      I5 => \SEGMENT_OBUF[6]_inst_i_8_n_0\,
      O => \SEGMENT_OBUF[2]_inst_i_2_n_0\
    );
\SEGMENT_OBUF[2]_inst_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000F003F000F003E"
    )
        port map (
      I0 => \^q\(0),
      I1 => SALIDA(1),
      I2 => SALIDA(3),
      I3 => SALIDA(4),
      I4 => SALIDA(2),
      I5 => \SEGMENT_OBUF[2]_inst_i_5_n_0\,
      O => \SEGMENT_OBUF[2]_inst_i_3_n_0\
    );
\SEGMENT_OBUF[2]_inst_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFF0F5A1"
    )
        port map (
      I0 => SALIDA(1),
      I1 => \SEGMENT_OBUF[6]_inst_i_10_n_0\,
      I2 => \^q\(0),
      I3 => SALIDA(2),
      I4 => SALIDA(3),
      I5 => SALIDA(4),
      O => \SEGMENT_OBUF[2]_inst_i_4_n_0\
    );
\SEGMENT_OBUF[2]_inst_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0010"
    )
        port map (
      I0 => SW_S_IBUF(3),
      I1 => SW_S_IBUF(1),
      I2 => SW_S_IBUF(2),
      I3 => SW_S_IBUF(0),
      O => \SEGMENT_OBUF[2]_inst_i_5_n_0\
    );
\SEGMENT_OBUF[3]_inst_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \SEGMENT_OBUF[3]_inst_i_2_n_0\,
      I1 => \SEGMENT[2]\(2),
      I2 => \SEGMENT_OBUF[3]_inst_i_3_n_0\,
      I3 => \SEGMENT[2]\(1),
      I4 => \SEGMENT_OBUF[3]_inst_i_4_n_0\,
      O => SEGMENT_OBUF(3)
    );
\SEGMENT_OBUF[3]_inst_i_10\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEF9FFFF"
    )
        port map (
      I0 => SW_S_IBUF(2),
      I1 => SW_S_IBUF(0),
      I2 => SW_S_IBUF(1),
      I3 => SW_S_IBUF(3),
      I4 => \^total_reg[1]_0\,
      O => \SEGMENT_OBUF[3]_inst_i_10_n_0\
    );
\SEGMENT_OBUF[3]_inst_i_11\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF0FF4"
    )
        port map (
      I0 => \SEGMENT_OBUF[6]_inst_i_11_n_0\,
      I1 => \SEGMENT_OBUF[3]_inst_i_12_n_0\,
      I2 => SALIDA(1),
      I3 => SALIDA(3),
      I4 => \SEGMENT_OBUF[3]_inst_i_14_n_0\,
      O => \SEGMENT_OBUF[3]_inst_i_11_n_0\
    );
\SEGMENT_OBUF[3]_inst_i_12\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFEF"
    )
        port map (
      I0 => SW_S_IBUF(1),
      I1 => SW_S_IBUF(0),
      I2 => SW_S_IBUF(3),
      I3 => SW_S_IBUF(2),
      O => \SEGMENT_OBUF[3]_inst_i_12_n_0\
    );
\SEGMENT_OBUF[3]_inst_i_13\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FEEF"
    )
        port map (
      I0 => SW_S_IBUF(3),
      I1 => SW_S_IBUF(0),
      I2 => SW_S_IBUF(1),
      I3 => SW_S_IBUF(2),
      O => \SEGMENT_OBUF[3]_inst_i_13_n_0\
    );
\SEGMENT_OBUF[3]_inst_i_14\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => SALIDA(4),
      I1 => \^q\(0),
      I2 => SALIDA(2),
      O => \SEGMENT_OBUF[3]_inst_i_14_n_0\
    );
\SEGMENT_OBUF[3]_inst_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5F50CFCF5F50C0C0"
    )
        port map (
      I0 => \SEGMENT_OBUF[3]_inst_i_5_n_0\,
      I1 => \SEGMENT_OBUF[3]_inst_i_6_n_0\,
      I2 => \SEGMENT[2]\(1),
      I3 => \SEGMENT_OBUF[6]_inst_i_5_n_0\,
      I4 => \SEGMENT[2]\(0),
      I5 => \inst_decoder/display5__0\(3),
      O => \SEGMENT_OBUF[3]_inst_i_2_n_0\
    );
\SEGMENT_OBUF[3]_inst_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0155FFFF01550000"
    )
        port map (
      I0 => SALIDA(4),
      I1 => SALIDA(3),
      I2 => \SEGMENT_OBUF[3]_inst_i_8_n_0\,
      I3 => \SEGMENT_OBUF[3]_inst_i_9_n_0\,
      I4 => \SEGMENT[2]\(0),
      I5 => \SEGMENT_OBUF[3]_inst_i_10_n_0\,
      O => \SEGMENT_OBUF[3]_inst_i_3_n_0\
    );
\SEGMENT_OBUF[3]_inst_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88888B888B8B8B8B"
    )
        port map (
      I0 => \SEGMENT_OBUF[3]_inst_i_11_n_0\,
      I1 => \SEGMENT[2]\(0),
      I2 => SALIDA(4),
      I3 => \^q\(0),
      I4 => SALIDA(3),
      I5 => \SEGMENT_OBUF[3]_inst_i_9_n_0\,
      O => \SEGMENT_OBUF[3]_inst_i_4_n_0\
    );
\SEGMENT_OBUF[3]_inst_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"01551154"
    )
        port map (
      I0 => SALIDA(4),
      I1 => SALIDA(2),
      I2 => \^q\(0),
      I3 => SALIDA(3),
      I4 => SALIDA(1),
      O => \SEGMENT_OBUF[3]_inst_i_5_n_0\
    );
\SEGMENT_OBUF[3]_inst_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFCCFC001"
    )
        port map (
      I0 => \SEGMENT_OBUF[6]_inst_i_10_n_0\,
      I1 => SALIDA(3),
      I2 => \^q\(0),
      I3 => SALIDA(1),
      I4 => SALIDA(2),
      I5 => SALIDA(4),
      O => \SEGMENT_OBUF[3]_inst_i_6_n_0\
    );
\SEGMENT_OBUF[3]_inst_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEFEFFFFFFFFFEFF"
    )
        port map (
      I0 => SALIDA(2),
      I1 => \^q\(0),
      I2 => SALIDA(4),
      I3 => \SEGMENT_OBUF[6]_inst_i_11_n_0\,
      I4 => SALIDA(3),
      I5 => SALIDA(1),
      O => \inst_decoder/display5__0\(3)
    );
\SEGMENT_OBUF[3]_inst_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"55555545"
    )
        port map (
      I0 => \^q\(0),
      I1 => SW_S_IBUF(2),
      I2 => SW_S_IBUF(0),
      I3 => SW_S_IBUF(1),
      I4 => SW_S_IBUF(3),
      O => \SEGMENT_OBUF[3]_inst_i_8_n_0\
    );
\SEGMENT_OBUF[3]_inst_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EAEAEAEA51000000"
    )
        port map (
      I0 => SALIDA(2),
      I1 => SALIDA(1),
      I2 => \^q\(0),
      I3 => \SEGMENT_OBUF[3]_inst_i_12_n_0\,
      I4 => \SEGMENT_OBUF[3]_inst_i_13_n_0\,
      I5 => SALIDA(3),
      O => \SEGMENT_OBUF[3]_inst_i_9_n_0\
    );
\SEGMENT_OBUF[4]_inst_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \SEGMENT_OBUF[4]_inst_i_2_n_0\,
      I1 => \SEGMENT_OBUF[4]_inst_i_3_n_0\,
      O => SEGMENT_OBUF(4),
      S => \SEGMENT[2]\(2)
    );
\SEGMENT_OBUF[4]_inst_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA03F3FAFA03030"
    )
        port map (
      I0 => \SEGMENT_OBUF[5]_inst_i_4_n_0\,
      I1 => \SEGMENT_OBUF[6]_inst_i_5_n_0\,
      I2 => \SEGMENT[2]\(1),
      I3 => \SEGMENT_OBUF[4]_inst_i_4_n_0\,
      I4 => \SEGMENT[2]\(0),
      I5 => \SEGMENT_OBUF[5]_inst_i_6_n_0\,
      O => \SEGMENT_OBUF[4]_inst_i_2_n_0\
    );
\SEGMENT_OBUF[4]_inst_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \SEGMENT_OBUF[6]_inst_i_5_n_0\,
      I1 => \SEGMENT_OBUF[4]_inst_i_5_n_0\,
      I2 => \SEGMENT[2]\(1),
      I3 => \SEGMENT_OBUF[6]_inst_i_7_n_0\,
      I4 => \SEGMENT[2]\(0),
      I5 => \inst_decoder/display5__0\(5),
      O => \SEGMENT_OBUF[4]_inst_i_3_n_0\
    );
\SEGMENT_OBUF[4]_inst_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000F0F3FFE"
    )
        port map (
      I0 => \SEGMENT_OBUF[2]_inst_i_5_n_0\,
      I1 => SALIDA(1),
      I2 => SALIDA(3),
      I3 => \^q\(0),
      I4 => SALIDA(2),
      I5 => SALIDA(4),
      O => \SEGMENT_OBUF[4]_inst_i_4_n_0\
    );
\SEGMENT_OBUF[4]_inst_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFAAABF"
    )
        port map (
      I0 => SALIDA(4),
      I1 => \^q\(0),
      I2 => SALIDA(1),
      I3 => SALIDA(2),
      I4 => SALIDA(3),
      O => \SEGMENT_OBUF[4]_inst_i_5_n_0\
    );
\SEGMENT_OBUF[5]_inst_i_1\: unisim.vcomponents.MUXF7
     port map (
      I0 => \SEGMENT_OBUF[5]_inst_i_2_n_0\,
      I1 => \SEGMENT_OBUF[5]_inst_i_3_n_0\,
      O => SEGMENT_OBUF(5),
      S => \SEGMENT[2]\(2)
    );
\SEGMENT_OBUF[5]_inst_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA03F3FAFA03030"
    )
        port map (
      I0 => \SEGMENT_OBUF[5]_inst_i_4_n_0\,
      I1 => \SEGMENT_OBUF[6]_inst_i_7_n_0\,
      I2 => \SEGMENT[2]\(1),
      I3 => \SEGMENT_OBUF[5]_inst_i_5_n_0\,
      I4 => \SEGMENT[2]\(0),
      I5 => \SEGMENT_OBUF[5]_inst_i_6_n_0\,
      O => \SEGMENT_OBUF[5]_inst_i_2_n_0\
    );
\SEGMENT_OBUF[5]_inst_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \SEGMENT_OBUF[6]_inst_i_5_n_0\,
      I1 => \SEGMENT_OBUF[5]_inst_i_7_n_0\,
      I2 => \SEGMENT[2]\(1),
      I3 => \SEGMENT_OBUF[5]_inst_i_8_n_0\,
      I4 => \SEGMENT[2]\(0),
      I5 => \inst_decoder/display5__0\(5),
      O => \SEGMENT_OBUF[5]_inst_i_3_n_0\
    );
\SEGMENT_OBUF[5]_inst_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAABABAAAAAAAAAA"
    )
        port map (
      I0 => \SEGMENT_OBUF[6]_inst_i_4_n_0\,
      I1 => SW_S_IBUF(3),
      I2 => SW_S_IBUF(0),
      I3 => SW_S_IBUF(1),
      I4 => SW_S_IBUF(2),
      I5 => \SEGMENT_OBUF[0]_inst_i_8_n_0\,
      O => \SEGMENT_OBUF[5]_inst_i_4_n_0\
    );
\SEGMENT_OBUF[5]_inst_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00000028"
    )
        port map (
      I0 => \^total_reg[1]_0\,
      I1 => SW_S_IBUF(2),
      I2 => SW_S_IBUF(3),
      I3 => SW_S_IBUF(0),
      I4 => SW_S_IBUF(1),
      I5 => \SEGMENT_OBUF[3]_inst_i_5_n_0\,
      O => \SEGMENT_OBUF[5]_inst_i_5_n_0\
    );
\SEGMENT_OBUF[5]_inst_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAAAAA22A"
    )
        port map (
      I0 => \SEGMENT_OBUF[0]_inst_i_5_n_0\,
      I1 => \^total_reg[1]_0\,
      I2 => SW_S_IBUF(2),
      I3 => SW_S_IBUF(3),
      I4 => SW_S_IBUF(0),
      I5 => SW_S_IBUF(1),
      O => \SEGMENT_OBUF[5]_inst_i_6_n_0\
    );
\SEGMENT_OBUF[5]_inst_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEEBEBB"
    )
        port map (
      I0 => SALIDA(4),
      I1 => SALIDA(1),
      I2 => \^q\(0),
      I3 => SALIDA(2),
      I4 => SALIDA(3),
      O => \SEGMENT_OBUF[5]_inst_i_7_n_0\
    );
\SEGMENT_OBUF[5]_inst_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FAFAFAF0FAFAFAF1"
    )
        port map (
      I0 => SALIDA(3),
      I1 => \^q\(0),
      I2 => SALIDA(4),
      I3 => SALIDA(1),
      I4 => SALIDA(2),
      I5 => \SEGMENT_OBUF[6]_inst_i_11_n_0\,
      O => \SEGMENT_OBUF[5]_inst_i_8_n_0\
    );
\SEGMENT_OBUF[5]_inst_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAEAAAEAAEA"
    )
        port map (
      I0 => \SEGMENT_OBUF[3]_inst_i_5_n_0\,
      I1 => \^total_reg[1]_0\,
      I2 => SW_S_IBUF(3),
      I3 => SW_S_IBUF(1),
      I4 => SW_S_IBUF(0),
      I5 => SW_S_IBUF(2),
      O => \inst_decoder/display5__0\(5)
    );
\SEGMENT_OBUF[6]_inst_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBBBBBB8B888888"
    )
        port map (
      I0 => \SEGMENT_OBUF[6]_inst_i_2_n_0\,
      I1 => \SEGMENT[2]\(2),
      I2 => \SEGMENT[2]\(0),
      I3 => \SEGMENT_OBUF[6]_inst_i_3_n_0\,
      I4 => \SEGMENT[2]\(1),
      I5 => \SEGMENT_OBUF[6]_inst_i_4_n_0\,
      O => SEGMENT_OBUF(6)
    );
\SEGMENT_OBUF[6]_inst_i_10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0010"
    )
        port map (
      I0 => SW_S_IBUF(3),
      I1 => SW_S_IBUF(1),
      I2 => SW_S_IBUF(0),
      I3 => SW_S_IBUF(2),
      O => \SEGMENT_OBUF[6]_inst_i_10_n_0\
    );
\SEGMENT_OBUF[6]_inst_i_11\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0006"
    )
        port map (
      I0 => SW_S_IBUF(2),
      I1 => SW_S_IBUF(0),
      I2 => SW_S_IBUF(1),
      I3 => SW_S_IBUF(3),
      O => \SEGMENT_OBUF[6]_inst_i_11_n_0\
    );
\SEGMENT_OBUF[6]_inst_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \SEGMENT_OBUF[6]_inst_i_5_n_0\,
      I1 => \SEGMENT_OBUF[6]_inst_i_6_n_0\,
      I2 => \SEGMENT[2]\(1),
      I3 => \SEGMENT_OBUF[6]_inst_i_7_n_0\,
      I4 => \SEGMENT[2]\(0),
      I5 => \SEGMENT_OBUF[6]_inst_i_8_n_0\,
      O => \SEGMENT_OBUF[6]_inst_i_2_n_0\
    );
\SEGMENT_OBUF[6]_inst_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000020"
    )
        port map (
      I0 => \^total_reg[1]_0\,
      I1 => SW_S_IBUF(2),
      I2 => SW_S_IBUF(3),
      I3 => SW_S_IBUF(0),
      I4 => SW_S_IBUF(1),
      O => \SEGMENT_OBUF[6]_inst_i_3_n_0\
    );
\SEGMENT_OBUF[6]_inst_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00551154"
    )
        port map (
      I0 => SALIDA(4),
      I1 => SALIDA(2),
      I2 => \^q\(0),
      I3 => SALIDA(3),
      I4 => SALIDA(1),
      O => \SEGMENT_OBUF[6]_inst_i_4_n_0\
    );
\SEGMENT_OBUF[6]_inst_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FCFCF8F0FCFCF8F1"
    )
        port map (
      I0 => SALIDA(1),
      I1 => SALIDA(3),
      I2 => SALIDA(4),
      I3 => \^q\(0),
      I4 => SALIDA(2),
      I5 => \SEGMENT_OBUF[6]_inst_i_10_n_0\,
      O => \SEGMENT_OBUF[6]_inst_i_5_n_0\
    );
\SEGMENT_OBUF[6]_inst_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FCECECEF"
    )
        port map (
      I0 => SALIDA(2),
      I1 => SALIDA(4),
      I2 => SALIDA(3),
      I3 => SALIDA(1),
      I4 => \^q\(0),
      O => \SEGMENT_OBUF[6]_inst_i_6_n_0\
    );
\SEGMENT_OBUF[6]_inst_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FAFAF8F0FAFAF8F1"
    )
        port map (
      I0 => SALIDA(3),
      I1 => \^q\(0),
      I2 => SALIDA(4),
      I3 => SALIDA(1),
      I4 => SALIDA(2),
      I5 => \SEGMENT_OBUF[6]_inst_i_11_n_0\,
      O => \SEGMENT_OBUF[6]_inst_i_7_n_0\
    );
\SEGMENT_OBUF[6]_inst_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAABAAAAAAAAAA"
    )
        port map (
      I0 => \SEGMENT_OBUF[6]_inst_i_4_n_0\,
      I1 => SW_S_IBUF(1),
      I2 => SW_S_IBUF(0),
      I3 => SW_S_IBUF(3),
      I4 => SW_S_IBUF(2),
      I5 => \^total_reg[1]_0\,
      O => \SEGMENT_OBUF[6]_inst_i_8_n_0\
    );
\SEGMENT_OBUF[6]_inst_i_9\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => SALIDA(1),
      I1 => SALIDA(3),
      I2 => SALIDA(2),
      I3 => \^q\(0),
      I4 => SALIDA(4),
      O => \^total_reg[1]_0\
    );
\total[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"222222028A8A8A02"
    )
        port map (
      I0 => \total_reg[1]_1\,
      I1 => SALIDA(1),
      I2 => \total[1]_i_2_n_0\,
      I3 => SW_IBUF(0),
      I4 => SW_IBUF(2),
      I5 => \^q\(0),
      O => \total[1]_i_1_n_0\
    );
\total[1]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => SW_IBUF(3),
      I1 => SW_IBUF(1),
      O => \total[1]_i_2_n_0\
    );
\total[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A888888888A8A8A8"
    )
        port map (
      I0 => \total_reg[1]_1\,
      I1 => \total[2]_i_2_n_0\,
      I2 => SW_IBUF(2),
      I3 => \^q\(0),
      I4 => SALIDA(1),
      I5 => SALIDA(2),
      O => \total[2]_i_1_n_0\
    );
\total[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0FF0FEF00EE00EE0"
    )
        port map (
      I0 => SW_IBUF(1),
      I1 => SW_IBUF(3),
      I2 => SALIDA(2),
      I3 => SALIDA(1),
      I4 => \^q\(0),
      I5 => SW_IBUF(0),
      O => \total[2]_i_2_n_0\
    );
\total[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8A"
    )
        port map (
      I0 => \total_reg[1]_1\,
      I1 => \total[3]_i_2_n_0\,
      I2 => \total[3]_i_3_n_0\,
      O => \total[3]_i_1_n_0\
    );
\total[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BB333EEE88222222"
    )
        port map (
      I0 => SW_IBUF(3),
      I1 => SALIDA(3),
      I2 => \^q\(0),
      I3 => SALIDA(1),
      I4 => SALIDA(2),
      I5 => SW_IBUF(2),
      O => \total[3]_i_2_n_0\
    );
\total[3]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"D00F0F0FD75F5F5F"
    )
        port map (
      I0 => SW_IBUF(0),
      I1 => \^q\(0),
      I2 => SALIDA(3),
      I3 => SALIDA(1),
      I4 => SALIDA(2),
      I5 => SW_IBUF(1),
      O => \total[3]_i_3_n_0\
    );
\total[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8AAAA88888888888"
    )
        port map (
      I0 => \total_reg[1]_1\,
      I1 => \total[4]_i_5_n_0\,
      I2 => \total[4]_i_6_n_0\,
      I3 => SALIDA(3),
      I4 => SALIDA(4),
      I5 => SW_IBUF(0),
      O => \total[4]_i_2_n_0\
    );
\total[4]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3EECECEC22282828"
    )
        port map (
      I0 => SW_IBUF(3),
      I1 => SALIDA(4),
      I2 => SALIDA(3),
      I3 => SALIDA(2),
      I4 => SALIDA(1),
      I5 => SW_IBUF(1),
      O => \total[4]_i_5_n_0\
    );
\total[4]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => SALIDA(1),
      I1 => \^q\(0),
      I2 => SALIDA(2),
      O => \total[4]_i_6_n_0\
    );
\total_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => E(0),
      CLR => ONE_EUR_reg_i_1_n_0,
      D => D(0),
      Q => \^q\(0)
    );
\total_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => E(0),
      CLR => ONE_EUR_reg_i_1_n_0,
      D => \total[1]_i_1_n_0\,
      Q => SALIDA(1)
    );
\total_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => E(0),
      CLR => ONE_EUR_reg_i_1_n_0,
      D => \total[2]_i_1_n_0\,
      Q => SALIDA(2)
    );
\total_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => E(0),
      CLR => ONE_EUR_reg_i_1_n_0,
      D => \total[3]_i_1_n_0\,
      Q => SALIDA(3)
    );
\total_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => E(0),
      CLR => ONE_EUR_reg_i_1_n_0,
      D => \total[4]_i_2_n_0\,
      Q => SALIDA(4)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decoder is
  port (
    Q : out STD_LOGIC_VECTOR ( 2 downto 0 );
    DIGIT_OBUF : out STD_LOGIC_VECTOR ( 7 downto 0 );
    CLK_IBUF_BUFG : in STD_LOGIC
  );
end decoder;

architecture STRUCTURE of decoder is
  signal \^q\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal display1 : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \display[2]_i_1_n_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \DIGIT_OBUF[0]_inst_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \DIGIT_OBUF[1]_inst_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \DIGIT_OBUF[2]_inst_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \DIGIT_OBUF[3]_inst_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \DIGIT_OBUF[4]_inst_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \DIGIT_OBUF[5]_inst_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \DIGIT_OBUF[6]_inst_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \DIGIT_OBUF[7]_inst_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \display[1]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \display[2]_i_1\ : label is "soft_lutpair3";
begin
  Q(2 downto 0) <= \^q\(2 downto 0);
\DIGIT_OBUF[0]_inst_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(0),
      I2 => \^q\(1),
      O => DIGIT_OBUF(0)
    );
\DIGIT_OBUF[1]_inst_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BF"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(2),
      I2 => \^q\(1),
      O => DIGIT_OBUF(1)
    );
\DIGIT_OBUF[2]_inst_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BF"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(2),
      I2 => \^q\(0),
      O => DIGIT_OBUF(2)
    );
\DIGIT_OBUF[3]_inst_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FD"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(0),
      I2 => \^q\(1),
      O => DIGIT_OBUF(3)
    );
\DIGIT_OBUF[4]_inst_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BF"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(0),
      I2 => \^q\(1),
      O => DIGIT_OBUF(4)
    );
\DIGIT_OBUF[5]_inst_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EF"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(2),
      I2 => \^q\(1),
      O => DIGIT_OBUF(5)
    );
\DIGIT_OBUF[6]_inst_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FD"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(2),
      I2 => \^q\(1),
      O => DIGIT_OBUF(6)
    );
\DIGIT_OBUF[7]_inst_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      I2 => \^q\(2),
      O => DIGIT_OBUF(7)
    );
\display[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^q\(0),
      O => display1(0)
    );
\display[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      O => display1(1)
    );
\display[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      I2 => \^q\(2),
      O => \display[2]_i_1_n_0\
    );
\display_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => display1(0),
      Q => \^q\(0),
      R => '0'
    );
\display_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => display1(1),
      Q => \^q\(1),
      R => '0'
    );
\display_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => \display[2]_i_1_n_0\,
      Q => \^q\(2),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity maq_exp is
  port (
    \FSM_sequential_current_reg[1]_0\ : out STD_LOGIC;
    current : out STD_LOGIC_VECTOR ( 0 to 0 );
    act_saldo : out STD_LOGIC;
    LED_OBUF : out STD_LOGIC_VECTOR ( 3 downto 0 );
    drink_out : out STD_LOGIC;
    \FSM_sequential_current_reg[1]_1\ : in STD_LOGIC;
    CLK_IBUF_BUFG : in STD_LOGIC;
    ONE_EUR : in STD_LOGIC;
    \FSM_sequential_current_reg[0]_0\ : in STD_LOGIC;
    \FSM_sequential_current_reg[0]_1\ : in STD_LOGIC
  );
end maq_exp;

architecture STRUCTURE of maq_exp is
  signal \FSM_sequential_current[0]_i_1_n_0\ : STD_LOGIC;
  signal \^fsm_sequential_current_reg[1]_0\ : STD_LOGIC;
  signal \^led_obuf\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal act_saldo_reg_i_1_n_0 : STD_LOGIC;
  signal \^current\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal refresco_reg_i_1_n_0 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_current[0]_i_1\ : label is "soft_lutpair5";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_current_reg[0]\ : label is "s1:01,s2:10,s0:00,s3:11";
  attribute FSM_ENCODED_STATES of \FSM_sequential_current_reg[1]\ : label is "s1:01,s2:10,s0:00,s3:11";
  attribute SOFT_HLUTNM of \LED_OBUF[1]_inst_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \LED_OBUF[2]_inst_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \LED_OBUF[3]_inst_i_1\ : label is "soft_lutpair5";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of act_saldo_reg : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of act_saldo_reg : label is "VCC:GE GND:CLR";
  attribute SOFT_HLUTNM of act_saldo_reg_i_1 : label is "soft_lutpair7";
  attribute XILINX_LEGACY_PRIM of refresco_reg : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of refresco_reg : label is "VCC:GE GND:CLR";
  attribute SOFT_HLUTNM of refresco_reg_i_1 : label is "soft_lutpair6";
begin
  \FSM_sequential_current_reg[1]_0\ <= \^fsm_sequential_current_reg[1]_0\;
  LED_OBUF(3 downto 0) <= \^led_obuf\(3 downto 0);
  current(0) <= \^current\(0);
\FSM_sequential_current[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0FFF800"
    )
        port map (
      I0 => \^fsm_sequential_current_reg[1]_0\,
      I1 => ONE_EUR,
      I2 => \FSM_sequential_current_reg[0]_0\,
      I3 => \FSM_sequential_current_reg[0]_1\,
      I4 => \^current\(0),
      O => \FSM_sequential_current[0]_i_1_n_0\
    );
\FSM_sequential_current_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => \FSM_sequential_current[0]_i_1_n_0\,
      Q => \^current\(0),
      R => '0'
    );
\FSM_sequential_current_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => \FSM_sequential_current_reg[1]_1\,
      Q => \^fsm_sequential_current_reg[1]_0\,
      R => '0'
    );
\LED_OBUF[0]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^current\(0),
      I1 => \^fsm_sequential_current_reg[1]_0\,
      O => \^led_obuf\(0)
    );
\LED_OBUF[1]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^current\(0),
      I1 => \^fsm_sequential_current_reg[1]_0\,
      O => \^led_obuf\(1)
    );
\LED_OBUF[2]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^fsm_sequential_current_reg[1]_0\,
      I1 => \^current\(0),
      O => \^led_obuf\(2)
    );
\LED_OBUF[3]_inst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^fsm_sequential_current_reg[1]_0\,
      I1 => \^current\(0),
      O => \^led_obuf\(3)
    );
act_saldo_reg: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \^led_obuf\(1),
      G => act_saldo_reg_i_1_n_0,
      GE => '1',
      Q => act_saldo
    );
act_saldo_reg_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \^current\(0),
      I1 => \^fsm_sequential_current_reg[1]_0\,
      O => act_saldo_reg_i_1_n_0
    );
refresco_reg: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => \^fsm_sequential_current_reg[1]_0\,
      G => refresco_reg_i_1_n_0,
      GE => '1',
      Q => drink_out
    );
refresco_reg_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^current\(0),
      I1 => \^fsm_sequential_current_reg[1]_0\,
      O => refresco_reg_i_1_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity synchrnzr is
  port (
    \sreg_1_reg[0]_0\ : out STD_LOGIC;
    \sreg_2_reg[0]_0\ : out STD_LOGIC;
    \aux_reg[0]_0\ : out STD_LOGIC;
    CLK_IBUF_BUFG : in STD_LOGIC;
    MONEDA_IBUF : in STD_LOGIC;
    PROD_IBUF : in STD_LOGIC;
    RST_IBUF : in STD_LOGIC
  );
end synchrnzr;

architecture STRUCTURE of synchrnzr is
  signal \aux_reg_n_0_[0]\ : STD_LOGIC;
  signal \sreg_1_reg_n_0_[0]\ : STD_LOGIC;
  signal \sreg_2_reg_n_0_[0]\ : STD_LOGIC;
  attribute srl_name : string;
  attribute srl_name of RST_OUT_reg_srl2 : label is "\inst_sync/RST_OUT_reg_srl2 ";
  attribute srl_name of SYNC_OUT_1_reg_srl2 : label is "\inst_sync/SYNC_OUT_1_reg_srl2 ";
  attribute srl_name of SYNC_OUT_2_reg_srl2 : label is "\inst_sync/SYNC_OUT_2_reg_srl2 ";
begin
RST_OUT_reg_srl2: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0001"
    )
        port map (
      A0 => '1',
      A1 => '0',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => CLK_IBUF_BUFG,
      D => \aux_reg_n_0_[0]\,
      Q => \aux_reg[0]_0\
    );
SYNC_OUT_1_reg_srl2: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '1',
      A1 => '0',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => CLK_IBUF_BUFG,
      D => \sreg_1_reg_n_0_[0]\,
      Q => \sreg_1_reg[0]_0\
    );
SYNC_OUT_2_reg_srl2: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '1',
      A1 => '0',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => CLK_IBUF_BUFG,
      D => \sreg_2_reg_n_0_[0]\,
      Q => \sreg_2_reg[0]_0\
    );
\aux_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => RST_IBUF,
      Q => \aux_reg_n_0_[0]\,
      R => '0'
    );
\sreg_1_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => MONEDA_IBUF,
      Q => \sreg_1_reg_n_0_[0]\,
      R => '0'
    );
\sreg_2_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IBUF_BUFG,
      CE => '1',
      D => PROD_IBUF,
      Q => \sreg_2_reg_n_0_[0]\,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity TOP is
  port (
    CLK : in STD_LOGIC;
    SW : in STD_LOGIC_VECTOR ( 3 downto 0 );
    SW_S : in STD_LOGIC_VECTOR ( 3 downto 0 );
    RST : in STD_LOGIC;
    MONEDA : in STD_LOGIC;
    PROD : in STD_LOGIC;
    LED : out STD_LOGIC_VECTOR ( 3 downto 0 );
    SEGMENT : out STD_LOGIC_VECTOR ( 6 downto 0 );
    DIGIT : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of TOP : entity is true;
end TOP;

architecture STRUCTURE of TOP is
  signal CLK_IBUF : STD_LOGIC;
  signal CLK_IBUF_BUFG : STD_LOGIC;
  signal DIGIT_OBUF : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal LED_OBUF : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal MONEDA_IBUF : STD_LOGIC;
  signal ONE_EUR : STD_LOGIC;
  signal PROD_IBUF : STD_LOGIC;
  signal RST_IBUF : STD_LOGIC;
  signal SALIDA : STD_LOGIC_VECTOR ( 0 to 0 );
  signal SEGMENT_OBUF : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal SW_IBUF : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal SW_S_IBUF : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal act_saldo : STD_LOGIC;
  signal current : STD_LOGIC_VECTOR ( 0 to 0 );
  signal display : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal drink_out : STD_LOGIC;
  signal inst_edge_n_0 : STD_LOGIC;
  signal inst_edge_n_1 : STD_LOGIC;
  signal inst_edge_n_2 : STD_LOGIC;
  signal inst_edge_n_3 : STD_LOGIC;
  signal inst_edge_n_5 : STD_LOGIC;
  signal inst_maq_n_0 : STD_LOGIC;
  signal inst_saldo_n_10 : STD_LOGIC;
  signal inst_saldo_n_2 : STD_LOGIC;
  signal inst_sync_n_0 : STD_LOGIC;
  signal inst_sync_n_1 : STD_LOGIC;
  signal inst_sync_n_2 : STD_LOGIC;
  signal total0 : STD_LOGIC;
begin
CLK_IBUF_BUFG_inst: unisim.vcomponents.BUFG
     port map (
      I => CLK_IBUF,
      O => CLK_IBUF_BUFG
    );
CLK_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => CLK,
      O => CLK_IBUF
    );
\DIGIT_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => DIGIT_OBUF(0),
      O => DIGIT(0)
    );
\DIGIT_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => DIGIT_OBUF(1),
      O => DIGIT(1)
    );
\DIGIT_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => DIGIT_OBUF(2),
      O => DIGIT(2)
    );
\DIGIT_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => DIGIT_OBUF(3),
      O => DIGIT(3)
    );
\DIGIT_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => DIGIT_OBUF(4),
      O => DIGIT(4)
    );
\DIGIT_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => DIGIT_OBUF(5),
      O => DIGIT(5)
    );
\DIGIT_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => DIGIT_OBUF(6),
      O => DIGIT(6)
    );
\DIGIT_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => DIGIT_OBUF(7),
      O => DIGIT(7)
    );
\LED_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => LED_OBUF(0),
      O => LED(0)
    );
\LED_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => LED_OBUF(1),
      O => LED(1)
    );
\LED_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => LED_OBUF(2),
      O => LED(2)
    );
\LED_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => LED_OBUF(3),
      O => LED(3)
    );
MONEDA_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => MONEDA,
      O => MONEDA_IBUF
    );
PROD_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => PROD,
      O => PROD_IBUF
    );
RST_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => RST,
      O => RST_IBUF
    );
\SEGMENT_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => SEGMENT_OBUF(0),
      O => SEGMENT(0)
    );
\SEGMENT_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => SEGMENT_OBUF(1),
      O => SEGMENT(1)
    );
\SEGMENT_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => SEGMENT_OBUF(2),
      O => SEGMENT(2)
    );
\SEGMENT_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => SEGMENT_OBUF(3),
      O => SEGMENT(3)
    );
\SEGMENT_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => SEGMENT_OBUF(4),
      O => SEGMENT(4)
    );
\SEGMENT_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => SEGMENT_OBUF(5),
      O => SEGMENT(5)
    );
\SEGMENT_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => SEGMENT_OBUF(6),
      O => SEGMENT(6)
    );
\SW_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => SW(0),
      O => SW_IBUF(0)
    );
\SW_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => SW(1),
      O => SW_IBUF(1)
    );
\SW_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => SW(2),
      O => SW_IBUF(2)
    );
\SW_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => SW(3),
      O => SW_IBUF(3)
    );
\SW_S_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => SW_S(0),
      O => SW_S_IBUF(0)
    );
\SW_S_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => SW_S(1),
      O => SW_S_IBUF(1)
    );
\SW_S_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => SW_S(2),
      O => SW_S_IBUF(2)
    );
\SW_S_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => SW_S(3),
      O => SW_S_IBUF(3)
    );
inst_decoder: entity work.decoder
     port map (
      CLK_IBUF_BUFG => CLK_IBUF_BUFG,
      DIGIT_OBUF(7 downto 0) => DIGIT_OBUF(7 downto 0),
      Q(2 downto 0) => display(2 downto 0)
    );
inst_edge: entity work.EDGEDCTR
     port map (
      CLK_IBUF_BUFG => CLK_IBUF_BUFG,
      D(0) => inst_edge_n_2,
      E(0) => total0,
      \FSM_sequential_current_reg[0]\ => inst_edge_n_1,
      \FSM_sequential_current_reg[1]\ => inst_edge_n_0,
      \FSM_sequential_current_reg[1]_0\ => inst_maq_n_0,
      \FSM_sequential_current_reg[1]_1\ => inst_saldo_n_10,
      ONE_EUR => ONE_EUR,
      Q(0) => SALIDA(0),
      SW_IBUF(3 downto 0) => SW_IBUF(3 downto 0),
      act_saldo => act_saldo,
      \aux_reg[0]_0\ => inst_sync_n_2,
      current(0) => current(0),
      drink_out => drink_out,
      \sreg_1_reg[0]_0\ => inst_sync_n_0,
      \sreg_2_reg[0]_0\ => inst_sync_n_1,
      \sreg_2_reg[1]_0\ => inst_edge_n_3,
      \sreg_2_reg[1]_1\ => inst_edge_n_5,
      \total_reg[0]\ => inst_saldo_n_2
    );
inst_maq: entity work.maq_exp
     port map (
      CLK_IBUF_BUFG => CLK_IBUF_BUFG,
      \FSM_sequential_current_reg[0]_0\ => inst_edge_n_5,
      \FSM_sequential_current_reg[0]_1\ => inst_edge_n_1,
      \FSM_sequential_current_reg[1]_0\ => inst_maq_n_0,
      \FSM_sequential_current_reg[1]_1\ => inst_edge_n_0,
      LED_OBUF(3 downto 0) => LED_OBUF(3 downto 0),
      ONE_EUR => ONE_EUR,
      act_saldo => act_saldo,
      current(0) => current(0),
      drink_out => drink_out
    );
inst_saldo: entity work.Saldo
     port map (
      CLK_IBUF_BUFG => CLK_IBUF_BUFG,
      D(0) => inst_edge_n_2,
      E(0) => total0,
      ONE_EUR => ONE_EUR,
      Q(0) => SALIDA(0),
      \SEGMENT[2]\(2 downto 0) => display(2 downto 0),
      SEGMENT_OBUF(6 downto 0) => SEGMENT_OBUF(6 downto 0),
      SW_IBUF(3 downto 0) => SW_IBUF(3 downto 0),
      SW_S_IBUF(3 downto 0) => SW_S_IBUF(3 downto 0),
      act_saldo => act_saldo,
      \total_reg[1]_0\ => inst_saldo_n_2,
      \total_reg[1]_1\ => inst_edge_n_3,
      \total_reg[4]_0\ => inst_saldo_n_10
    );
inst_sync: entity work.synchrnzr
     port map (
      CLK_IBUF_BUFG => CLK_IBUF_BUFG,
      MONEDA_IBUF => MONEDA_IBUF,
      PROD_IBUF => PROD_IBUF,
      RST_IBUF => RST_IBUF,
      \aux_reg[0]_0\ => inst_sync_n_2,
      \sreg_1_reg[0]_0\ => inst_sync_n_0,
      \sreg_2_reg[0]_0\ => inst_sync_n_1
    );
end STRUCTURE;
