----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
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

entity decoder_tb is
end decoder_tb;

architecture Behavioral of decoder_tb is
    signal CLK_tb: STD_LOGIC := '0';
    signal SW_tb: STD_LOGIC_VECTOR (3 downto 0) := "0000";
    signal SALIDA_tb: real := 0.00;
    signal SEG_tb: STD_LOGIC_VECTOR (55 downto 0);

    constant CLK_PERIOD : time := 10 ns;  -- Ajusta el periodo del reloj según tus necesidades

    component decoder
        Port ( CLK: in STD_LOGIC;
               SW : in STD_LOGIC_VECTOR (3 downto 0);
               SEG : out STD_LOGIC_VECTOR (55 downto 0);
               SALIDA : in real);
    end component;

begin
    -- Instancia del módulo a probar
    UUT: decoder port map (CLK_tb, SW_tb, SEG_tb, SALIDA_tb);

    -- Proceso de reloj
    CLK_process: process
    begin
        while true loop
            CLK_tb <= not CLK_tb after CLK_PERIOD / 2;
            wait for CLK_PERIOD / 2;
        end loop;
    end process;

    -- Proceso de estimulación
    stimulus_process: process
    begin
        -- Configuración inicial
        SW_tb <= "0000";
        SALIDA_tb <= 0.00;

        -- Esperar unos ciclos antes de cambiar los valores
        wait for CLK_PERIOD * 5;

        -- Prueba de cada caso del decoder
        SW_tb <= "0000";  -- COCACOLA
        wait for CLK_PERIOD * 5;

        SW_tb <= "0001";  -- FANTA
        wait for CLK_PERIOD * 5;

        SW_tb <= "0010";  -- NESTEA
        wait for CLK_PERIOD * 5;

        SW_tb <= "0011";  -- AGUA
        wait for CLK_PERIOD * 5;

        -- Prueba de diferentes valores de SALIDA
        SALIDA_tb <= 0.10;
        wait for CLK_PERIOD * 5;

        SALIDA_tb <= 0.50;
        wait for CLK_PERIOD * 5;

        SALIDA_tb <= 1.00;
        wait for CLK_PERIOD * 5;

        SALIDA_tb <= 1.20;  -- Error
        wait for CLK_PERIOD * 5;

        wait;
    end process;

end Behavioral;
