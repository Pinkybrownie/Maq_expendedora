----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.12.2023 23:52:21
-- Design Name: 
-- Module Name: err_gestor_tb - Behavioral
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
-- Banco de pruebas detector de introducción dos o mas monedas
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity err_gestor_tb is
--  Port ( );
end err_gestor_tb;

architecture Behavioral of err_gestor_tb is
component Err_gestor is
    Port ( switch: in STD_LOGIC_VECTOR (3 downto 0);
           sw_p: in STD_LOGIC_VECTOR (3 downto 0);
           value: in STD_LOGIC_VECTOR(4 downto 0);
           button: in STD_LOGIC;
           saldo_act: in STD_LOGIC;
           err_flag : out STD_LOGIC_VECTOR (1 downto 0));
    end component;
component Saldo is
    Port ( CLK: in STD_LOGIC;
           ACT_FLAG: in STD_LOGIC;--senal de activacion
           SW : in STD_LOGIC_VECTOR (3 downto 0);
           RESET : in STD_LOGIC;
           BOTON : in STD_LOGIC;
           ERR_FLAG: in STD_LOGIC_VECTOR (1 downto 0);
           ONE_EUR: out STD_LOGIC;--señal de alcanzado 1 EUR
           SALIDA: out STD_LOGIC_VECTOR(4 downto 0)); --10c equivaldran a 00001, 20c a 00010...
end component;

signal clock: std_logic := '0';
constant period: time := 100 ns;
signal moneda: std_logic_vector(3 downto 0):= "0000";
signal b_prod: std_logic:= '0';
signal b_mon: std_logic:= '0';
signal val: std_logic_vector(4 downto 0):= (others => '0');
signal flag: std_logic_vector (1 downto 0):= "00";
signal un_euro: std_logic := '0';

begin
 inst1: err_gestor port map(
            button => b_prod,
            value => val,
            switch => moneda,
            sw_p => "0000",
            saldo_act => '1',
            err_flag => flag
        );
 inst2: saldo port map(
            CLK => clock,
            ACT_FLAG => '1',
            SW => moneda,
            RESET => '0',
            BOTON => b_mon,
            ERR_FLAG => flag,
            ONE_EUR => un_euro,
            SALIDA => val 
        );
 --clock generation       
 clock <= not clock after period/2;
 --estímulo monedas
 process
 begin
   moneda(0) <= not moneda(0) after period;
   moneda(1) <= not moneda(1) after 3*period;
   moneda(2) <= not moneda(2) after 5*period;
   moneda(3) <= not moneda(3) after 7*period;
   wait for 100ns;
 end process;
 --saldo
 process
 begin
   --b_mon <= '1' after 2*period/3, '0' after 2*period/3 + 10ns;
   b_mon <= '1' after period/2, '0' after period/2 + 10ns;
   wait for 100ns;
 end process;
b_prod <= '1' after 3*period, '0' after 3*period+10ns;
end Behavioral;
