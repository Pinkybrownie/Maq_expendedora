library ieee;
use ieee.std_logic_1164.all;

entity tb_Saldo is
end tb_Saldo;

architecture tb of tb_Saldo is

    component Saldo
        port (SW     : in std_logic_vector (3 downto 0);
              RESET  : in std_logic;
              BOTON  : in std_logic;
              SALIDA : out std_logic_vector (6 downto 0));
    end component;

    signal SW     : std_logic_vector (3 downto 0);
    signal RESET  : std_logic;
    signal BOTON  : std_logic;
    signal SALIDA : std_logic_vector (6 downto 0);

begin

    dut : Saldo
    port map (SW     => SW,
              RESET  => RESET,
              BOTON  => BOTON,
              SALIDA => SALIDA);

    stimuli : process
    begin
        SW <= (others => '0');
        BOTON <= '0';

        RESET <= '1';
        wait for 100 ns;
        RESET <= '0';
        wait for 100 ns;

        for i in 0 to 3 loop
            SW(i) <= '1';
            wait for 100 ns;
            BOTON <= '1'; 
            wait for 50 ns;
            BOTON <= '0';
            wait for 200 ns;
            SW(i) <= '0';
        end loop;
        wait;
    end process;

end tb;


