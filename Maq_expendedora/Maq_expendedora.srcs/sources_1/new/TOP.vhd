library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TOP is
  Port (   CLK: in STD_LOGIC;
           SW : in STD_LOGIC_VECTOR (3 downto 0);
           SW_S : in STD_LOGIC_VECTOR (3 downto 0);
           RST : in STD_LOGIC;
           MONEDA: in STD_LOGIC;
           PROD: in STD_LOGIC;
           LED: out STD_LOGIC_VECTOR(2 downto 0);
           SEGMENT: out STD_LOGIC_VECTOR(6 downto 0);
           DOT: out STD_LOGIC;
           EUR_FLAG: out STD_LOGIC;--LED QUE INDICA QUE SE HA ALCANZADO 1 EUR
           DIGIT: out STD_LOGIC_VECTOR(7 downto 0)
           );
end TOP;

architecture Behavioral of TOP is
component synchrnzr is
    Port ( CLK : in STD_LOGIC;
           RESET: in STD_LOGIC;
           ASYNC_IN_1 : in STD_LOGIC;
           ASYNC_IN_2 : in STD_LOGIC;
           SYNC_OUT_1 : out STD_LOGIC;
           SYNC_OUT_2 : out STD_LOGIC;
           RST_OUT: out STD_LOGIC);
end component;
component EDGEDCTR is
    Port ( CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           SYNC_IN_1 : in STD_LOGIC;
           SYNC_IN_2 : in STD_LOGIC;
           EDGE_MON : out STD_LOGIC;
           EDGE_PROD: out STD_LOGIC;
           RST_EDGE : out STD_LOGIC);
end component;
component maq_exp is
    Port ( clk: in STD_LOGIC;
           RESET: in STD_LOGIC;
           button_mon: in STD_LOGIC;
           button_prod: in STD_LOGIC;
           SW: in STD_LOGIC_VECTOR (3 downto 0);
           EUR_flag: in STD_LOGIC;
           err_flag : in STD_LOGIC_VECTOR (1 downto 0);
           act_saldo: out STD_LOGIC;--S1
           refresco: inout STD_LOGIC;--);--S2
           LED: out STD_LOGIC_VECTOR (2 downto 0));
end component;
component Saldo is
    Port ( CLK: in STD_LOGIC;
           ACT_FLAG: in STD_LOGIC;--senal de activacion
           SW : in STD_LOGIC_VECTOR (3 downto 0);
           RESET : in STD_LOGIC;
           BOTON : in STD_LOGIC;
           ERR_FLAG: in STD_LOGIC_VECTOR (1 downto 0);
           ONE_EUR: out STD_LOGIC;--señal de alcanzado 1 EUR
           SALIDA: out STD_LOGIC_VECTOR(4 downto 0)); --10c equivaldran a 00001, 20c a 00010...
end component;
component Err_gestor is
    Port ( switch: in STD_LOGIC_VECTOR (3 downto 0);
           sw_p: in STD_LOGIC_VECTOR (3 downto 0);
           value: in STD_LOGIC_VECTOR(4 downto 0);
           button: in STD_LOGIC;
           err_flag : out STD_LOGIC_VECTOR (1 downto 0));
    end component;
component decoder is
    Port ( CLK: in STD_LOGIC;
           SW_P : in STD_LOGIC_VECTOR (3 downto 0);
           ACT_SALDO: in STD_LOGIC;
           ERR_FLAG: in STD_LOGIC_VECTOR(1 downto 0);
           REF: in STD_LOGIC;
           DINERO : in STD_LOGIC_VECTOR (4 downto 0); --SALIDA DE LA ENTIDA SALDO
           SEG : out STD_LOGIC_VECTOR (6 downto 0);--segmentos de CADA DIGITO
           PUNTO: out STD_LOGIC;--punto de CADA DIGITO
           DIGIT : out STD_LOGIC_VECTOR (7 downto 0)--Cada uno de los digitos del decoder
         );
    end component;

signal reset_sync: std_logic:= '0';
signal m_sync: std_logic:= '0';
signal p_sync: std_logic:= '0';
signal reset_edge: std_logic:= '0';
signal m_edge: std_logic:= '0';
signal p_edge: std_logic:= '0';
signal val: std_logic_vector(4 downto 0):= (others => '0');
signal un_euro: std_logic := '0';
signal flag: std_logic_vector (1 downto 0):= "00";
signal saldo_on: std_logic := '0';
signal drink_out: std_logic := '0';
signal state: std_logic_vector (3 downto 0) := (others => '0');

begin
inst_sync: synchrnzr port map(
           CLK => CLK,
           RESET => RST,
           ASYNC_IN_1 => MONEDA,
           ASYNC_IN_2 => PROD,
           SYNC_OUT_1 => m_sync,
           SYNC_OUT_2 => p_sync,
           RST_OUT => reset_sync
        );
inst_edge: edgedctr port map(
           CLK => CLK,
           RST => reset_sync,
           SYNC_IN_1 => m_sync,
           SYNC_IN_2 => p_sync,
           EDGE_MON => m_edge,
           EDGE_PROD => p_edge,
           RST_EDGE => reset_edge
        );
inst_maq: maq_exp port map (
           clk => CLK,
           RESET => reset_edge,
           button_mon => m_edge,
           button_prod => p_edge,
           SW => SW_S,
           EUR_flag => un_euro,
           err_flag => flag,
           act_saldo => saldo_on,
           refresco => drink_out,
           LED => LED
           );
inst_saldo: saldo port map(
            CLK => CLK,
            SW => SW,
            RESET => reset_edge,
            BOTON => m_edge,
            ACT_FLAG => saldo_on,--senal de activacion
            ONE_EUR => un_euro, --señal de alcanzado 1 EUR
            ERR_FLAG => flag,
            SALIDA => val 
        );
inst_err: err_gestor port map(
            button => p_edge,
            value => val,
            switch => SW,
            sw_p => SW_S,
            err_flag => flag
        );
inst_decoder: decoder port map(           
            CLK => CLK,
            SW_P => SW_S,
            ACT_SALDO => saldo_on,
            ERR_FLAG => flag,
            REF => drink_out,
            DINERO => val,
            SEG => SEGMENT,
            PUNTO => DOT,
            DIGIT => DIGIT 
        );    
 EUR_FLAG <= un_euro;      
end Behavioral;
