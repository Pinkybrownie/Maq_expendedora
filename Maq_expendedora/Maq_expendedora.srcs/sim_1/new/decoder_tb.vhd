----------------------------------------------------------------------------------
-- Company: UPM 
-- Engineer: Enrique Maseda
-- 
-- Create Date: 10.12.2023 21:10:28
-- Design Name: 
-- Module Name: decoder_tb - Behavioral
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
use IEEE. STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_decoder is 
end tb_decoder;

architecture Behavioral of tb_decoder is
    COMPONENT DECODER is
        Generic ( DIGITOS : positive);
        Port ( CLK: in STD_LOGIC;
               SW : in STD_LOGIC_VECTOR (3 downto 0);
               SALDO : in STD_LOGIC_VECTOR (6 downto 0); --SALIDA DE LA ENTIDA SALDO
               SEG : out STD_LOGIC_VECTOR (6 downto 0);
               DIG : out STD_LOGIC_VECTOR (DIGITOS - 1 downto 0)
         );
    END COMPONENT;
    constant digitos : positive := 8; 
    signal clk : std_logic;
    signal sw : std_logic_vector(3 downto 0);
    signal saldo : std_logic_vector(6 downto 0); 
    signal dig : std_logic_vector(digitos - 1 downto 0); 
    signal seg : std_logic_vector(6 downto 0);
    signal i_t : std_logic_vector(6 downto 0) := (others => '0');
begin
    process begin 
        clk <= '0';
        wait for 25 ns;
        clk <= '1';
        wait for 25 ns;
    end process;
    
    Inat_decoder: DECODER
        generic map(DIGITOS)
            port map (
                CLK => clk,
                SW => sw,
                SALDO => saldo,
                DIG => dig,
                SEG => seg
                );
    process
        begin
            wait for 125 ns;       
            for i in 0 to 11 loop
                wait for 900 ns;
                saldo <= std_logic_vector(to_unsigned(i,7)); 
                SW <= "0000";
            end loop;
                wait for 900 ns;
            assert false
                report "Simulation finished."
                severity failure;
    end process;
end;