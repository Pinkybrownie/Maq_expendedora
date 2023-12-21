----------------------------------------------------------------------------------
-- Company: UPM 
-- Engineer: Enrique Maseda
-- 
-- Create Date: 10.12.2023 21:10:28
-- Design Name: 
-- Module Name: decoder_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity tb_decoder is
end tb_decoder;

architecture tb of tb_decoder is
component decoder is
    port (CLK: in STD_LOGIC;
          SW_P : in STD_LOGIC_VECTOR (3 downto 0);
          ACT_SALDO: in STD_LOGIC;
          ERR_FLAG: in STD_LOGIC_VECTOR(1 downto 0);
          REF: in STD_LOGIC;
          DINERO : in STD_LOGIC_VECTOR (4 downto 0); --SALIDA DE LA ENTIDA SALDO
          SEG : out STD_LOGIC_VECTOR (6 downto 0);--segmentos de CADA DIGITO
          DIGIT : out STD_LOGIC_VECTOR (7 downto 0));--Cada uno de los digitos del decoder
end component;

signal clock: std_logic := '0';
constant period: time := 10 ns;

signal sw: std_logic_vector (3 downto 0):= "0000";
signal val: std_logic_vector (4 downto 0):= (others => '0');
signal seg: std_logic_vector (6 downto 0);
signal dig: std_logic_vector (7 downto 0);

signal flag: std_logic_vector (1 downto 0):= "00";
signal saldo_on: std_logic := '0';
signal drink_out: std_logic := '0';

begin
Inst_decoder: decoder
    port map (CLK => clock,
              SW_P => sw,
              ACT_SALDO => saldo_on,
              ERR_FLAG => flag,
              REF => drink_out,
              DINERO => val,
              SEG => seg,
              DIGIT => dig);

--clock generation       
 clock <= not clock after period/2;

--SWITCHES (obligar saldo_on=drink_out=0)
--process
--begin
--sw <= "0001";
--wait for 300ns;
--sw <= "0010";
--wait for 300ns;
--sw <= "0100";
--wait for 300ns;
--sw <= "1000";
--wait for 300ns;
--sw <= "0000";
--end process;

--DINERO (obligar saldo_on=1 y drink_out=0)
--process
--variable valor: unsigned (val'range):= (others => '0');
--begin
--val <= std_logic_vector(valor);
--wait for 85ns;
--valor := valor + 1;
--end process;

--SALIDA REFRESCO (obligar saldo_on=0 y drink_out=1)
drink_out <= not drink_out after 100ns;

end tb;