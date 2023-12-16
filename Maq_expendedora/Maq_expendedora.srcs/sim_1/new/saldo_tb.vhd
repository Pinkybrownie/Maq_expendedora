library ieee;
use ieee.std_logic_1164.all;

entity tb_Saldo is
end tb_Saldo;

architecture tb of tb_Saldo is

    component Saldo
        port (SW     : in std_logic_vector (3 downto 0);
              RESET  : in std_logic;
              BOTON  : in std_logic;
              ERR_FLAG: in STD_LOGIC_VECTOR (1 downto 0);
              SALIDA : out STD_LOGIC_VECTOR(4 downto 0));
    end component;

    signal SW     : std_logic_vector (3 downto 0);
    signal RESET  : std_logic;
    signal BOTON  : std_logic;
    signal ERR_FLAG: STD_LOGIC_VECTOR (1 downto 0);
    signal SALIDA : STD_LOGIC_VECTOR(4 downto 0);

begin

    dut : Saldo
    port map (SW     => SW,
              RESET  => RESET,
              BOTON  => BOTON,
              ERR_FLAG => ERR_FLAG,
              SALIDA => SALIDA);

    stimuli : process
    begin
        SW <= (others => '0');
        BOTON <= '0';
        ERR_FLAG <= "00";
        
        RESET <= '0';
        wait for 100 ns;
        RESET <= '1';
        wait for 100 ns;

        for i in 3 downto 0 loop
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
