----------------------------------------------------------------------------------
-- Company: UPM 
-- Engineer: Enrique Maseda
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
           DINERO : in STD_LOGIC_VECTOR (4 downto 0); --SALIDA DE LA ENTIDA SALDO
           SEG : out STD_LOGIC_VECTOR (6 downto 0);
           DIG : out STD_LOGIC_VECTOR (7 downto 0)
         );
end decoder;

architecture Behavioral of decoder is

begin
    process(CLK)
        variable display1, display2, display3, display4, display5, display6, display7, display8 : std_logic_vector(6 downto 0);
        variable display : integer := 0;
    begin
        --if rising_edge(CLK) then 
            if (DINERO = 0) then
                case SW is
                    when "0001" =>
                        display1 := "0110001"; --C
                        display2 := "0000001"; --O
                        display3 := "0110001"; --C
                        display4 := "0001001"; --A
                        display5 := "0110001"; --C
                        display6 := "0000001"; --O
                        display7 := "1110001"; --L
                        display8 := "0001001"; --A
                    when "0010" => 
                        display1 := "0111000"; --F
                        display2 := "0001001"; --A
                        display3 := "0001001"; --N
                        display4 := "0111001"; --T
                        display5 := "0001001"; --A
                        display6 := "1111111"; --
                        display7 := "1111111"; --
                        display8 := "1111111"; --
                    when "0100" => 
                        display1 := "0001001"; --N
                        display2 := "0110000"; --E
                        display3 := "0100100"; --S
                        display4 := "0111001"; --T
                        display5 := "0110000"; --E
                        display6 := "0001001"; --A
                        display7 := "1111111"; --
                        display8 := "1111111"; --
                    when "1000" =>
                        display1 := "0001001"; --A
                        display2 := "0100001"; --G
                        display3 := "1000001"; --U
                        display4 := "0001001"; --A
                        display5 := "1111111"; --
                        display6 := "1111111"; --
                        display7 := "1111111"; --
                        display8 := "1111111"; --
                    when others =>
                        display1 := "0110000"; --E
                        display2 := "0001000"; --R
                        display3 := "0001000"; --R
                        display4 := "0000001"; --O
                        display5 := "0001000"; --R
                        display6 := "1111111"; --
                        display7 := "1111111"; --
                        display8 := "1111111"; --
                end case;
            elsif (DINERO /= 0) then
                if (DINERO = 1) then
                    display1 := "1111111"; --
                    display2 := "1111111"; --
                    display3 := "1111111"; --
                    display4 := "1111111"; --
                    display5 := "1111111"; --
                    display6 := "0000001"; --0
                    display7 := "0110001"; --1
                    display8 := "0000001"; --0                 
                    -- "01000000" esto es el punto del DP??
                elsif (DINERO = 2) then
                    display1 := "1111111"; --
                    display2 := "1111111"; --
                    display3 := "1111111"; --
                    display4 := "1111111"; --
                    display5 := "1111111"; --
                    display6 := "0000001"; --0
                    display7 := "0010010"; --2
                    display8 := "0000001"; --0
                elsif (DINERO = 3) then
                    display1 := "1111111"; --
                    display2 := "1111111"; --
                    display3 := "1111111"; --
                    display4 := "1111111"; --
                    display5 := "1111111"; --
                    display6 := "0000001"; --0
                    display7 := "0000110"; --3
                    display8 := "0000001"; --0
                elsif (DINERO = 4) then
                    display1 := "1111111"; --
                    display2 := "1111111"; --
                    display3 := "1111111"; --
                    display4 := "1111111"; --
                    display5 := "1111111"; --
                    display6 := "0000001"; --0
                    display7 := "1001100"; --4
                    display8 := "0000001"; --0
                elsif (DINERO = 5) then
                    display1 := "1111111"; --
                    display2 := "1111111"; --
                    display3 := "1111111"; --
                    display4 := "1111111"; --
                    display5 := "1111111"; --
                    display6 := "0000001"; --0
                    display7 := "0100100"; --5
                    display8 := "0000001"; --0
                elsif (DINERO = 6) then
                    display1 := "1111111"; --
                    display2 := "1111111"; --
                    display3 := "1111111"; --
                    display4 := "1111111"; --
                    display5 := "1111111"; --
                    display6 := "0000001"; --0
                    display7 := "0100000"; --6
                    display8 := "0000001"; --0
                elsif (DINERO = 7) then
                    display1 := "1111111"; --
                    display2 := "1111111"; --
                    display3 := "1111111"; --
                    display4 := "1111111"; --
                    display5 := "1111111"; --
                    display6 := "0000001"; --0
                    display7 := "0001111"; --7
                    display8 := "0000001"; --0
                elsif (DINERO = 8) then
                    display1 := "1111111"; --
                    display2 := "1111111"; --
                    display3 := "1111111"; --
                    display4 := "1111111"; --
                    display5 := "1111111"; --
                    display6 := "0000001"; --0
                    display7 := "0000000"; --8
                    display8 := "0000001"; --0
                elsif (DINERO = 9) then
                    display1 := "1111111"; --
                    display2 := "1111111"; --
                    display3 := "1111111"; --
                    display4 := "1111111"; --
                    display5 := "1111111"; --
                    display6 := "0000001"; --0
                    display7 := "0000100"; --9
                    display8 := "0000001"; --0
                elsif (DINERO = 10) then
                    display1 := "0001000"; --R
                    display2 := "0110000"; --E
                    display3 := "0111000"; --F
                    display4 := "0001000"; --R
                    display5 := "0110000"; --E
                    display6 := "0100100"; --S
                    display7 := "0110001"; --C
                    display8 := "0000001"; --O
                elsif DINERO > 10 then
                    display1 := "0110000"; --E
                    display2 := "0001000"; --R
                    display3 := "0001000"; --R
                    display4 := "0000001"; --O
                    display5 := "0001000"; --R
                    display6 := "1111111"; --
                    display7 := "1111111"; --
                    display8 := "1111111"; --
                end if;
            end if;
            if rising_edge(CLK) then
                display := (display + 1) mod 8;
            end if;
            case display is 
                when 0 =>
                    DIG <= "01111111";
                    SEG <= display1;
                when 1 =>
                    DIG <= "10111111";
                    SEG <= display2;
                when 2 =>
                    DIG <= "11011111";
                    SEG <= display3;
                when 3 =>
                    DIG <= "11101111";
                    SEG <= display4;
                when 4 =>
                    DiG <= "11110111";
                    SEG <= display5;
                when 5 =>
                    DIG <= "11111011";
                    SEG <= display6;
                when 6 =>
                    DIG <= "11111101";
                    SEG <= display7;
                when others =>
                    DIG <= "11111110";        
                    SEG <= display8;
            end case;
        --end if;
    end process;
end Behavioral;