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
            port (CLK   : in std_logic;
              SW    : in std_logic_vector (3 downto 0);
              dinero : in std_logic_vector (4 downto 0);
              SEG   : out std_logic_vector (6 downto 0);
              DIG   : out std_logic_vector (7 downto 0));
    end component;
    constant digitos : positive := 8; 
    signal clk   : std_logic;
    signal switch    : std_logic_vector (3 downto 0):="0000";
    signal dinero_i : std_logic_vector (4 downto 0):="00000";
    signal seg   : std_logic_vector (6 downto 0);
    signal dig   : std_logic_vector (7 downto 0);

    constant TbPeriod : time := 20 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    Inst_decoder: decoder
    port map (CLK   => TbClock,
              SW    => switch,
              DINERO => dinero_i,
              SEG   => SEG,
              DIG   => DIG);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2;

    -- EDIT: Check that CLK is really your main clock signal
    CLK <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        if(dinero_i = "00000") then
            if rising_edge(CLK) then              
                for i in 0 to 4 loop
                        wait for 100 ns;
                        switch <= std_logic_vector(to_unsigned(i,4)); 
                end loop;
                dinero_i <= "00001";
                switch <= "0000";       
            else
                wait for 10 ns;
                for j in 1 to 11 loop
                    wait for 100 ns;
                    dinero_i <= std_logic_vector(to_unsigned(j,5)); 
                end loop;
            end if;
        end if;
        
        -- EDIT Add stimuli here
        wait for 100ns;
    end process;

end tb;
