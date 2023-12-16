----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.12.2023 16:25:58
-- Design Name: 
-- Module Name: Maq_exp_tb - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Maq_exp_tb is
--  Port ( );
end Maq_exp_tb;

architecture Behavioral of Maq_exp_tb is
component maq_exp is
    Port ( clk: in STD_LOGIC;
           button_mon: in STD_LOGIC;
           button_prod: in STD_LOGIC;
           EUR_flag: in STD_LOGIC;
           err_flag : in STD_LOGIC_VECTOR (1 downto 0);
           act_saldo: out STD_LOGIC;--S2
           refresco: out STD_LOGIC;--);--S3
           LED: out STD_LOGIC_VECTOR (3 downto 0));
end component;
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

signal r_sync: std_logic:= '0';
signal m_sync: std_logic:= '0';
signal p_sync: std_logic:= '0';

signal r_edge: std_logic:= '0';
signal m_edge: std_logic:= '0';
signal p_edge: std_logic:= '0';

signal clock: std_logic := '0';
constant period: time := 10 ns;
signal b_mon: std_logic:= '0';
signal b_prod: std_logic:= '0';
signal un_euro: std_logic := '0';
signal E_flag: std_logic_vector (1 downto 0):= "00";
signal saldo_on: std_logic := '0';
signal drink_out: std_logic := '0';
signal state: std_logic_vector (3 downto 0) := (others => '0');
signal A: integer range 0 to 1;

begin
inst_maq: maq_exp port map (
           clk => clock,
           button_mon => m_edge,
           button_prod => p_edge,
           EUR_flag => un_euro,
           err_flag => E_flag,
           act_saldo => saldo_on,
           refresco => drink_out,
           LED => state
           );
inst_sync: synchrnzr port map(
           CLK => clock,
           RESET => '0',
           ASYNC_IN_1 => b_mon,
           ASYNC_IN_2 => b_prod,
           SYNC_OUT_1 => m_sync,
           SYNC_OUT_2 => p_sync,
           RST_OUT => r_sync
        );
inst_edge: edgedctr port map(
           CLK => clock,
           RST => r_sync,
           SYNC_IN_1 => m_sync,
           SYNC_IN_2 => p_sync,
           EDGE_MON => m_edge,
           EDGE_PROD => p_edge,
           RST_EDGE => r_edge
        );
--CLOCK GENERATION
clock <= not clock after period/2;

--SIGNAL GENERATION
b_prod <= '1' after period*10, '0' after period*10 + 30ns;

--b_mon <= '1' after 6sec, '0' after 6sec+50ns;


process
begin
    b_mon <= '1' after period*20, '0' after period*20 + 30ns;
    wait for 250ns;
end process;

process(m_edge)
begin
    if rising_edge(m_edge) then
        A <= A+1;
        if A=1 then
            un_euro <= '1', '0' after period*2;
        end if;
    end if;
end process;

end Behavioral;
