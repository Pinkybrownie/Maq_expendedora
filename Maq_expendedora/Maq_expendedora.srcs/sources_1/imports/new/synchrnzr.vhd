library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--En esta entidad, cuando ocurre un flanco positivo en la entrada del reloj,
--la señal de salida cambia al valor del bit mas significativo de sreg
--y sreg pasa a valer el [BLS, valor de la señal asíncrona]
--(En este caso la señal asíncrona será el boton).
--De esta manera se genera un desplazamiento de bits en la señal sreg.
 
entity synchrnzr is
    Port ( CLK : in STD_LOGIC;
           RESET: in STD_LOGIC;
           ASYNC_IN : in STD_LOGIC;
           SYNC_OUT : out STD_LOGIC;
           RST_OUT: out STD_LOGIC);
end synchrnzr;

architecture Behavioral of synchrnzr is
    signal sreg: std_logic_vector(1 downto 0);
    signal aux: std_logic_vector(1 downto 0);
begin
    process (CLK)
    begin
        if rising_edge(CLK) then
          SYNC_OUT <= sreg(1);
          RST_OUT <= aux(1);
          sreg <= sreg(0) & ASYNC_IN;
          aux <= aux(0) & RESET;
        end if;
    end process;
end Behavioral;
