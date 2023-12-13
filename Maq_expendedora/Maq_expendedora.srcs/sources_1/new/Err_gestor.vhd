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
           value: in STD_LOGIC_VECTOR(7 downto 0);
           button: in STD_LOGIC;
           err_flag : out STD_LOGIC_VECTOR (1 downto 0));
end Err_gestor;

architecture Behavioral of Err_gestor is

begin
    process(switch, value)
    begin
    --codigo "11" saldo>1EUR ERROR MÁS RESTRICTIVO
    if(to_integer(unsigned(value))>100) then
        err_flag <= (others => '1');
    else
        --Error en introduccion de monedas
        case to_integer(unsigned(switch)) is
            when 0|1|2|4|8 => err_flag <= (others => '0');
            when others => err_flag <= "01"; --codigo "01"
        end case;
        --código "10" comprar bebida cuando saldo<1EUR 
        if (button='1' and to_integer(unsigned(value))<100) then
            err_flag <= "10";
        end if;
    end if;
    end process;
end Behavioral;
