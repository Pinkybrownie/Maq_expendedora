----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.12.2023 21:09:50
-- Design Name: 
-- Module Name: decoder - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity decoder is
    Port ( CLK: in STD_LOGIC;
           SW : in STD_LOGIC_VECTOR (3 downto 0);
           SEG : out STD_LOGIC_VECTOR (55 downto 0);
           SALIDA : in real);
end decoder;

architecture Behavioral of decoder is

begin
    process(CLK)
    begin
        if rising_edge(CLK) then 
            if (SALIDA = 0.00) then
                case SW is
                    when "0000" => 
                        SEG <= "0110001" & "0000001" & "0110001" & "0001001" & "0110001" & "0000001" & "1110001" & "0001001"; --COCACOLA
                    when "0001" => 
                        SEG <= "0111000" & "0001001" & "0001001" & "0111001" & "0001001"; --FANTA
                    when "0010" => 
                        SEG <= "0001001" & "0110000" & "0100100" & "0111001" & "0110000" & "0001001"; --NESTEA
                    when "0011" => 
                        SEG <= "0001001" & "0100001" & "1000001" & "0001001"; --AGUA
                    when others => 
                        SEG <= "0110000" & "0001000" & "0001000" & "0000001" & "0001000"; --ERROR
                end case;
            elsif (SALIDA /= 0.00) then
                if (SALIDA = 0.10) then
                    SEG <= "0000001" & "01000000" & "0110001" & "0000001"; --0.10
                elsif (SALIDA = 0.20) then
                    SEG <= "0000001" & "01000000" & "0010010" & "0000001"; --0.20
                elsif (SALIDA = 0.30) then
                    SEG <= "0000001" & "01000000" & "0000110" & "0000001"; --0.30    
                elsif (SALIDA = 0.40) then
                    SEG <= "0000001" & "01000000" & "1001100" & "0000001"; --0.40    
                elsif (SALIDA = 0.50) then
                    SEG <= "0000001" & "01000000" & "0100100" & "0000001"; --0.50                
                elsif (SALIDA = 0.60) then
                    SEG <= "0000001" & "01000000" & "0100000" & "0000001"; --0.60    
                elsif (SALIDA = 0.70) then
                    SEG <= "0000001" & "01000000" & "0001111" & "0000001"; --0.70    
                elsif (SALIDA = 0.80) then
                    SEG <= "0000001" & "01000000" & "0000000" & "0000001"; --0.80    
                elsif (SALIDA = 0.90) then
                    SEG <= "0000001" & "01000000" & "0000100" & "0000001"; --0.90    
                elsif (SALIDA = 1.00) then
                    SEG <= "0001000" & "0110000" & "0111000" & "0001000" & "0110000" & "0100100" & "0110001" & "0000001"; --REFRESCO    
                elsif SALIDA > 1.00 then
                    SEG <= "0110000" & "0001000" & "0001000" & "0000001" & "0001000"; --ERROR
                end if;
            end if;
        end if;
    end process;
end Behavioral;