library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--Sreg es una señal auxiliar que expresa el desplazamiento de bits
--en el que se introduce por la drch el valor de la señal síncrona.
--Cambia el valor de EDGE a 1 solo cuando sreg valga 100, que es
--cuando termina la pulsación del boton.
entity EDGEDCTR is
    Port ( CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           SYNC_IN_1 : in STD_LOGIC;
           SYNC_IN_2 : in STD_LOGIC;
           EDGE_MON : out STD_LOGIC;
           EDGE_PROD: out STD_LOGIC;
           RST_EDGE : out STD_LOGIC);
end EDGEDCTR;

architecture Behavioral of EDGEDCTR is
    signal sreg_1: std_logic_vector(2 downto 0):= (others => '0');
    signal sreg_2: std_logic_vector(2 downto 0):= (others => '0');
    signal aux: std_logic_vector(2 downto 0):= (others => '1');
begin
    process (CLK)
    begin
        if rising_edge(CLK) then
          sreg_1 <= sreg_1(1 downto 0) & SYNC_IN_1;
          sreg_2 <= sreg_2(1 downto 0) & SYNC_IN_2;
          aux <= aux(1 downto 0) & RST;
        end if;
    end process;
    with sreg_1 select
      EDGE_MON <= '1' when "100",
              '0' when others;
    with sreg_2 select
      EDGE_PROD <= '1' when "100",
              '0' when others;
    with aux select
      RST_EDGE <= '1' when "011",
                  '0' when others;
end Behavioral;
