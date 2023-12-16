----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.12.2023 17:38:01
-- Design Name: 
-- Module Name: TOP - Behavioral
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
           RST : in STD_LOGIC;
           MONEDA: in STD_LOGIC;
           PROD: in STD_LOGIC;
           LED: out STD_LOGIC_VECTOR(6 downto 0)
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
component Saldo is
    Port ( CLK : in STD_LOGIC;
           SW : in STD_LOGIC_VECTOR (3 downto 0);
           RESET : in STD_LOGIC;
           BOTON : in STD_LOGIC;
           ERR_FLAG: in STD_LOGIC_VECTOR (1 downto 0);
           ONE_EUR: out STD_LOGIC;
           SALIDA: out STD_LOGIC_VECTOR(6 downto 0));
end component;
component Err_gestor is
    Port ( switch: in STD_LOGIC_VECTOR (3 downto 0);
           value: in STD_LOGIC_VECTOR(6 downto 0);
           button: in STD_LOGIC;
           err_flag : out STD_LOGIC_VECTOR (1 downto 0));
    end component;

signal reset_sync: std_logic;
signal m_sync: std_logic;
signal p_sync: std_logic;
signal reset_edge: std_logic;
signal m_edge: std_logic;
signal p_edge: std_logic;
signal val: std_logic_vector(7 downto 0):= (others => '0');
signal flag: std_logic_vector (1 downto 0):= "00";

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
inst_saldo: saldo port map(
            CLK => CLK,
            SW => SW,
            RESET => reset_edge,
            BOTON => m_edge,
            ERR_FLAG => flag,
            SALIDA => val 
        );

inst_err: err_gestor port map(
            button => p_edge,
            value => val,
            switch => SW,
            err_flag => flag
        );
        
LED <= val;

end Behavioral;
