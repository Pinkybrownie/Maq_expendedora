----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.12.2023 17:38:01
-- Design Name: 
-- Module Name: TOP - Behavioral
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


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TOP is
  Port (   CLK: in STD_LOGIC;
           SW : in STD_LOGIC_VECTOR (3 downto 0);
           RST : in STD_LOGIC;
           MONEDA: in STD_LOGIC;
           PROD: in STD_LOGIC;
           LED: out STD_LOGIC_VECTOR(6 downto 0)
           );
end TOP;

architecture Behavioral of TOP is
component Err_gestor is
    Port ( switch: in STD_LOGIC_VECTOR (3 downto 0);
           value: in STD_LOGIC_VECTOR(6 downto 0);
           button: in STD_LOGIC;
           clk: in STD_LOGIC;
           err_flag : out STD_LOGIC_VECTOR (1 downto 0));
    end component;
component Saldo is
    Port ( SW : in STD_LOGIC_VECTOR (3 downto 0);
           RESET : in STD_LOGIC;
           BOTON : in STD_LOGIC;
           ERR_FLAG: in STD_LOGIC_VECTOR (1 downto 0);
           SALIDA: out STD_LOGIC_VECTOR(6 downto 0));
end component;

signal val: std_logic_vector(6 downto 0):= (others => '0');
signal flag: std_logic_vector (1 downto 0):= "00";

begin
inst2: saldo port map(
            SW => SW,
            RESET => RST,
            BOTON => MONEDA,
            ERR_FLAG => flag,
            SALIDA => val 
        );

inst1: err_gestor port map(
            button => PROD,
            value => val,
            clk => CLK,
            switch => SW,
            err_flag => flag
        );
        
LED <= val;

end Behavioral;
