library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--Sreg es una señal auxiliar que expresa el desplazamiento de bits
--en el que se introduce por la drch el valor de la señal síncrona.
--Cambia el valor de EDGE a 1 solo cuando sreg valga 100, que es
--cuando termina la pulsación del boton.
entity EDGEDCTR is
    Port ( CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           SYNC_IN : in STD_LOGIC;
           EDGE : out STD_LOGIC;
           RST_EDGE : out STD_LOGIC);
end EDGEDCTR;

architecture Behavioral of EDGEDCTR is
    signal sreg: std_logic_vector(2 downto 0);
    signal aux: std_logic_vector(2 downto 0);
begin
    process (CLK)
    begin
        if rising_edge(CLK) then
          sreg <= sreg(1 downto 0) & SYNC_IN;
          aux <= aux(1 downto 0) & RST;
        end if;
    end process;
    with sreg select
      EDGE <= '1' when "100",
              '0' when others;
    with aux select
      RST_EDGE <= '1' when "100",
                  '0' when others;
end Behavioral;
