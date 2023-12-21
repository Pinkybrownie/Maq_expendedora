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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity decoder is
    Port ( CLK: in STD_LOGIC;
           SW_P : in STD_LOGIC_VECTOR (3 downto 0);
           ACT_SALDO: in STD_LOGIC;
           ERR_FLAG: in STD_LOGIC_VECTOR(1 downto 0);
           REF: in STD_LOGIC;
           DINERO : in STD_LOGIC_VECTOR (4 downto 0); --SALIDA DE LA ENTIDA SALDO
           SEG : out STD_LOGIC_VECTOR (6 downto 0);--segmentos de CADA DIGITO
           PUNTO: out STD_LOGIC; --punto de CADA DIGITO
           DIGIT : out STD_LOGIC_VECTOR (7 downto 0)--Cada uno de los digitos del decoder
         );
end decoder;

architecture Dataflow of decoder is
signal reloj_aux : std_logic := '0';
type digitos is array (0 to 7) of std_logic_vector(6 downto 0);
signal dig: digitos;
begin
--RELOJ AUXILIAR PARA PODER VISUALIZAR EL DECODER
--Si se utilizara la frecuencia del reloj interno, el ojo humano no lo puede captar.
clk_aux:process (CLK)
    subtype ciclos is integer range 0 to 10**8;
    variable contaje : ciclos;
begin
    if rising_edge(CLK) then
        contaje := contaje+1;
        if contaje = 10**5 -1 then
            contaje := 0;
            reloj_aux <= not reloj_aux;
        end if;
    end if;
end process;

ShowInDecoder:process(reloj_aux, ERR_FLAG, ACT_SALDO, REF, DINERO, SW_P)
    variable i: integer := 0;
begin
PUNTO <= '1';
if rising_edge(reloj_aux) then 
 if ERR_FLAG="00" then
   if ACT_SALDO = '0' and REF= '0' then 
    case SW_P is
      when "0001" =>
        dig(0) <= "0110001"; --C
        dig(1) <= "0000001"; --O
        dig(2) <= "0110001"; --C
        dig(3) <= "0001000"; --A
        dig(4) <= "0110001"; --C
        dig(5) <= "0000001"; --O
        dig(6) <= "1110001"; --L
        dig(7) <= "0001000"; --A
      when "0010" => 
        dig(0) <= "0111000"; --F
        dig(1) <= "0001000"; --A
        dig(2) <= "0001001"; --N
        dig(3) <= "0111001"; --T
        dig(4) <= "0001000"; --A
        dig(5) <= "1111111"; --
        dig(6) <= "1111111"; --
        dig(7) <= "1111111"; --
      when "0100" => 
        dig(0) <= "0001001"; --N
        dig(1) <= "0110000"; --E
        dig(2) <= "0100100"; --S
        dig(3) <= "0111001"; --T
        dig(4) <= "0110000"; --E
        dig(5) <= "0001000"; --A
        dig(6) <= "1111111"; --
        dig(7) <= "1111111"; --
      when "1000" =>
        dig(0) <= "0001000"; --A
        dig(1) <= "0100001"; --G
        dig(2) <= "1000001"; --U
        dig(3) <= "0001000"; --A
        dig(4) <= "1111111"; --
        dig(5) <= "1111111"; --
        dig(6) <= "1111111"; --
        dig(7) <= "1111111"; --
      when others =>
        dig(0) <= "0001000"; --R
        dig(1) <= "0110000"; --E
        dig(2) <= "0111000"; --F
        dig(3) <= "0001000"; --R
        dig(4) <= "0110000"; --E
        dig(5) <= "0100100"; --S
        dig(6) <= "0110001"; --C
        dig(7) <= "0000001"; --O
    end case;
   elsif ACT_SALDO='1' and REF='0' then
    dig(0) <= "1111111"; --
    dig(1) <= "1111111"; --
    dig(2) <= "1111111"; --
    dig(3) <= "1111111"; --
    dig(4) <= "1111111"; --
    dig(7) <= "0000001"; --0
    case DINERO is
        when "00000" => dig(5) <= "0000001"; dig(6) <= "0000001"; --00
        when "00001" => dig(5) <= "0000001"; dig(6) <= "1111001"; --01
        when "00010" => dig(5) <= "0000001"; dig(6) <= "0010010"; --02
        when "00011" => dig(5) <= "0000001"; dig(6) <= "0000110"; --03
        when "00100" => dig(5) <= "0000001"; dig(6) <= "1001100"; --04
        when "00101" => dig(5) <= "0000001"; dig(6) <= "0100100"; --05
        when "00110" => dig(5) <= "0000001"; dig(6) <= "0100000"; --06
        when "00111" => dig(5) <= "0000001"; dig(6) <= "0001111"; --07
        when "01000" => dig(5) <= "0000001"; dig(6) <= "0000000"; --08
        when "01001" => dig(5) <= "0000001"; dig(6) <= "0000100"; --09
        when "01010" => dig(5) <= "1111001"; dig(6) <= "0000001"; --10
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
   elsif ACT_SALDO='0' and REF='1' then
    dig(0) <= "0101000"; --P (es una A)
    dig(1) <= "1111001"; --I
    dig(2) <= "0110001"; --C
    dig(3) <= "1001000"; --K
    dig(4) <= "1111111"; -- 
    dig(5) <= "1111111"; --
    dig(6) <= "1000001"; --U
    dig(7) <= "0101000"; --P (es una A)
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
 i := (i + 1) mod 8;
 case i is 
   when 0 =>
        DIGIT <= "01111111";
        SEG <= dig(0);
   when 1 =>
        DIGIT <= "10111111";
        SEG <= dig(1);
   when 2 =>
        DIGIT <= "11011111";
        SEG <= dig(2);
   when 3 =>
        DIGIT <= "11101111";
        SEG <= dig(3);
   when 4 =>
        DIGIT <= "11110111";
        SEG <= dig(4);
   when 5 =>
        DIGIT <= "11111011";
        SEG <= dig(5);
        if ACT_SALDO='1' and REF='0' then
            PUNTO <= '0';
        else PUNTO <= '1';
        end if;
   when 6 =>
        DIGIT <= "11111101";
        SEG <= dig(6);
   when others =>
        DIGIT <= "11111110";        
        SEG <= dig(7);
 end case;
end if;
end process;
end Dataflow;