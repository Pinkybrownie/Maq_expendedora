----------------------------------------------------------------------------------
-- Engineer: Andrea Marron Rosado
-- 
-- Create Date: 06.12.2023 23:10:47
-- Design Name: 
-- Module Name: Err_gestor - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Err_gestor is
    Port ( switch: in STD_LOGIC_VECTOR (3 downto 0);
           value: integer range 0 to 8;
           button: in STD_LOGIC;
           clk: in STD_LOGIC;
           err_flag : out STD_LOGIC_VECTOR (1 downto 0));
end Err_gestor;

architecture Behavioral of Err_gestor is

begin
    process(clk, switch)
    begin
    if rising_edge(clk) then
        --Error en introduccion de monedas
        case to_integer(unsigned(switch)) is
            when 0|1|2|4|8 => err_flag <= (others => '0');
            when others => err_flag <= (others => '1');
        end case;
        --código "10" saldo<1EUR
        if (button='1' and value<8) then
            err_flag <= "10";
        end if;
    end if;
    end process;
end Behavioral;
