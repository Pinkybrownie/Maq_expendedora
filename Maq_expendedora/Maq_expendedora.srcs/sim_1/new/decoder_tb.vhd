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


library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity tb_decoder is
end tb_decoder;

architecture tb of tb_decoder is
    component decoder
            Generic ( DIGITOS : positive);      
            port (CLK   : in std_logic;
              SW    : in std_logic_vector (3 downto 0);
              SALDO : in std_logic_vector (6 downto 0);
              SEG   : out std_logic_vector (6 downto 0);
              DIG   : out std_logic_vector (DIGITOS-1 downto 0));
    end component;
    constant digitos : positive := 8; 
    signal clk   : std_logic;
    signal switch    : std_logic_vector (3 downto 0):="0000";
    signal dinero : std_logic_vector (6 downto 0):="0000000";
    signal seg   : std_logic_vector (6 downto 0);
    signal dig   : std_logic_vector (digitos -1 downto 0);

    constant TbPeriod : time := 20 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    Inat_decoder: decoder
    generic map(DIGITOS)
    port map (CLK   => TbClock,
              SW    => switch,
              SALDO => dinero,
              SEG   => SEG,
              DIG   => DIG);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2;

    -- EDIT: Check that CLK is really your main clock signal
    CLK <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        if(dinero = "0000000") then 
            for i in 0 to 4 loop
                    wait for 100 ns;
                    switch <= std_logic_vector(to_unsigned(i,4)); 
            end loop;
            dinero <= "0000001";
            switch <= "0000";       
        else
            wait for 10 ns;
            for j in 1 to 11 loop
                wait for 100 ns;
                dinero <= std_logic_vector(to_unsigned(j,7)); 
            end loop;
        end if;
        
        -- EDIT Add stimuli here
        wait for 100ns;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_decoder of tb_decoder is
    for tb
    end for;
end cfg_tb_decoder;