----------------------------------------------------------------------------------
-- Company: UPM 
-- Engineer: Enrique Maseda
-- 
-- Create Date: 10.12.2023 21:09:50
-- Design Name: 
-- Module Name: decoder - Behavioral

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;
--use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity decoder is
    Port ( CLK: in STD_LOGIC;
           SW_P : in STD_LOGIC_VECTOR (3 downto 0);
           ACT_SALDO: in STD_LOGIC;
           ERR_FLAG: in STD_LOGIC_VECTOR(1 downto 0);
           REF: in STD_LOGIC;
           DINERO : in STD_LOGIC_VECTOR (4 downto 0); --SALIDA DE LA ENTIDA SALDO
           SEG : out STD_LOGIC_VECTOR (6 downto 0);--segmentos de CADA DIGITO
           DIGIT : out STD_LOGIC_VECTOR (7 downto 0)--Cada uno de los digitos del decoder
         );
end decoder;

architecture Behavioral of decoder is
--signal dig1, dig2, dig3, dig4, dig5, dig6, dig7, dig8 : std_logic_vector(6 downto 0);
type digitos is array (0 to 7) of std_logic_vector(6 downto 0);
signal dig: digitos;
begin
--pantalla is (dig1, dig2, dig3, dig4, dig5, dig6, dig7, dig8);
ShowInDecoder: process(ERR_FLAG,ACT_SALDO, REF, DINERO, SW_P)
 begin
 if ERR_FLAG="00" then
   if ACT_SALDO = '0' and REF= '0' then 
    case SW_P is
      when "0001" =>
        dig(0) <= "0110001"; --C
        dig(1) <= "0000001"; --O
        dig(2) <= "0110001"; --C
        dig(3) <= "0001001"; --A
        dig(4) <= "0110001"; --C
        dig(5) <= "0000001"; --O
        dig(6) <= "1110001"; --L
        dig(7) <= "0001001"; --A
      when "0010" => 
        dig(0) <= "0111000"; --F
        dig(1) <= "0001001"; --A
        dig(2) <= "0001001"; --N
        dig(3) <= "0111001"; --T
        dig(4) <= "0001001"; --A
        dig(5) <= "1111111"; --
        dig(6) <= "1111111"; --
        dig(7) <= "1111111"; --
      when "0100" => 
        dig(0) <= "0001001"; --N
        dig(1) <= "0110000"; --E
        dig(2) <= "0100100"; --S
        dig(3) <= "0111001"; --T
        dig(4) <= "0110000"; --E
        dig(5) <= "0001001"; --A
        dig(6) <= "1111111"; --
        dig(7) <= "1111111"; --
      when "1000" =>
        dig(0) <= "0001001"; --A
        dig(1) <= "0100001"; --G
        dig(2) <= "1000001"; --U
        dig(3) <= "0001001"; --A
        dig(4) <= "1111111"; --
        dig(5) <= "1111111"; --
        dig(6) <= "1111111"; --
        dig(7) <= "1111111"; --
      when others =>
        dig(0) <= "0110000"; --E
        dig(1) <= "0001000"; --R
        dig(2) <= "0001000"; --R
        dig(3) <= "0000001"; --O
        dig(4) <= "0001000"; --R
        dig(5) <= "1111111"; --
        dig(6) <= "1111111"; --
        dig(7) <= "1111111"; --
    end case;
  elsif ACT_SALDO='1' and REF='0' then
    dig(0) <= "1111111"; --
    dig(1) <= "1111111"; --
    dig(2) <= "1111111"; --
    dig(3) <= "1111111"; --
    dig(4) <= "1111111"; --
    dig(5) <= "0000001"; --0
    dig(7) <= "0000001"; --0
    case DINERO is
        when "00000" => dig(6) <= "0000001"; --0
        when "00001" => dig(6) <= "0110001"; --1
        when "00010" => dig(6) <= "0010010"; --2
        when "00011" => dig(6) <= "0000110"; --3
        when "00100" => dig(6) <= "1001100"; --4
        when "00101" => dig(6) <= "0100100"; --5
        when "00110" => dig(6) <= "0100000"; --6
        when "00111" => dig(6) <= "0001111"; --7
        when "01000" => dig(6) <= "0000000"; --8
        when "01001" => dig(6) <= "0000100"; --9
        when "01010" =>
            dig(5) <= "0110001"; --1
            dig(6) <= "0000001"; --0
        when others =>
            dig(0) <= "0110000"; --E
            dig(1) <= "0001000"; --R
            dig(2) <= "0001000"; --R
            dig(3) <= "0000001"; --O
            dig(4) <= "0001000"; --R
            dig(5) <= "1111111"; --
            dig(6) <= "1111111"; --
            dig(7) <= "1111111"; --    
    end case;                           
-- "01000000" esto es el punto del DP??
  elsif ACT_SALDO='0' and REF='1' then
    dig(0) <= "0001000"; --R
    dig(1) <= "0110000"; --E
    dig(2) <= "0111000"; --F
    dig(3) <= "0001000"; --R
    dig(4) <= "0110000"; --E
    dig(5) <= "0100100"; --S
    dig(6) <= "0110001"; --C
    dig(7) <= "0000001"; --O
  end if;
 else
    dig(0) <= "0110000"; --E
    dig(1) <= "0001000"; --R
    dig(2) <= "0001000"; --R
    dig(3) <= "0000001"; --O
    dig(4) <= "0001000"; --R
    dig(5) <= "1111111"; --
    dig(6) <= "1111111"; --
    dig(7) <= "1111111"; --
 end if;
end process;

OneByOne: process(CLK)
variable i: integer := 0;
begin
 DIGIT <= (OTHERS => '1');
 if i<8 then
     if rising_edge(CLK) then
        DIGIT(i) <= '0';
        seg <= dig(7-i);
        i := i+1;
     end if;
 else i:=0;
 end if;
end process;
end Behavioral;