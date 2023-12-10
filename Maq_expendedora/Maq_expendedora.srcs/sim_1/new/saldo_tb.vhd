----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.12.2023 18:24:21
-- Design Name: 
-- Module Name: saldo_tb - Behavioral
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

entity tb_Saldo is
end tb_Saldo;

architecture tb of tb_Saldo is

    component Saldo
        port (SW     : in std_logic_vector (3 downto 0);
              RESET  : in std_logic;
              BOTON  : in std_logic;
              SALIDA : out real);
    end component;

    signal SW     : std_logic_vector (3 downto 0);
    signal RESET  : std_logic;
    signal BOTON  : std_logic;
    signal SALIDA : real;

    constant TbPeriod : time := 1500 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : Saldo
    port map (SW     => SW,
              RESET  => RESET,
              BOTON  => BOTON,
              SALIDA => SALIDA);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    --  EDIT: Replace YOURCLOCKSIGNAL below by the name of your clock as I haven't guessed it
    --  YOURCLOCKSIGNAL <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        SW <= (others => '0');
        BOTON <= '0';

        -- Reset generation
        -- EDIT: Check that RESET is really your reset signal
        RESET <= '1';
        wait for 100 ns;
        RESET <= '0';
        wait for 100 ns;
        
        -- EDIT Add stimuli here
        SW(3) <= '1';
        wait for 100 ns;
        BOTON <= '1'; 
        wait for 50 ns;
        BOTON <= '0';
        wait for 200 ns;
        SW(3) <= '0'; 
        wait for 50 ns;
        SW(2) <= '1';
        wait for 100 ns;
        BOTON <= '1'; 
        wait for 50 ns;
        BOTON <= '0';
        wait for 200 ns;
        SW(2) <= '0'; 
        wait for 50 ns;
        SW(1) <= '1';
        wait for 100 ns;
        BOTON <= '1'; 
        wait for 50 ns;
        BOTON <= '0';
        wait for 200 ns;
        SW(1) <= '0'; 
        wait for 50 ns;
        SW(0) <= '1';
        wait for 100 ns;
        BOTON <= '1'; 
        wait for 50 ns;
        BOTON <= '0';
        wait for 200 ns;
        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;