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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity err_gestor_tb is
--  Port ( );
end err_gestor_tb;

architecture Behavioral of err_gestor_tb is
component Err_gestor is
    Port ( switch: in STD_LOGIC_VECTOR (3 downto 0);
           value: integer range 0 to 8;
           button: in STD_LOGIC;
           clk: in STD_LOGIC;
           err_flag : out STD_LOGIC_VECTOR (1 downto 0));
    end component;

signal clock: std_logic := '0';
constant period: time := 100 ns;
signal moneda: std_logic_vector(3 downto 0):= "0000";
signal button: std_logic:= '0';
signal saldo: integer:= 0;
signal flag: std_logic_vector (1 downto 0):= "00";

begin
 utt: err_gestor port map(
        button => button, --no se evalua el saldo
        value => saldo,
        clk => clock,
        switch => moneda,
        err_flag => flag
        );
 --clock generation       
 clock <= not clock after period/2;
 --estímulo monedas
 moneda(0) <= not moneda(0) after period;
 moneda(1) <= not moneda(1) after 3*period;
 moneda(2) <= not moneda(2) after 5*period;
 moneda(3) <= not moneda(3) after 7*period;
 --saldo
saldo<= to_integer(unsigned(moneda));
end Behavioral;
