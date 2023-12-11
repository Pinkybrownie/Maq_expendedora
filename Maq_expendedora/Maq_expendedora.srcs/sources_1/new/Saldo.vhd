----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.12.2023 20:09:37
-- Design Name: 
-- Module Name: Saldo - Behavioral
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

entity Saldo is
    Port ( SW : in STD_LOGIC_VECTOR (3 downto 0);
           RESET : in STD_LOGIC;
           BOTON : in STD_LOGIC;
           SALIDA: out STD_LOGIC_VECTOR(6 downto 0));
end Saldo;

architecture Behavioral of Saldo is
signal total: unsigned (SALIDA'range):= (others => '0');
begin
    process(SW,RESET,BOTON)
    begin
        if SW(0) = '1' then
            if SW(1) = '0' and SW(2) = '0' and SW(3) = '0' and BOTON = '1' then
                total <= total + 100;  
            end if;
        end if;
        
        if SW(1) = '1' then
            if SW(0) = '0' and SW(2) = '0' and SW(3) = '0' and BOTON = '1' then
                total <= total + 50;  
            end if;
        end if;
        
        if SW(2) = '1' then
            if SW(0) = '0' and SW(1) = '0' and SW(3) = '0' and BOTON = '1' then
                total <= total + 20;  
            end if;
        end if;
        
        if SW(3) = '1' then
            if SW(0) = '0' and SW(1) = '0' and SW(2) = '0' and BOTON = '1' then
                total <= total + 10;  
            end if;
        end if;
        
        if RESET = '0' then
            total <=(others => '0');
        end if;
        
        SALIDA <= std_logic_vector (total);        
    end process;
