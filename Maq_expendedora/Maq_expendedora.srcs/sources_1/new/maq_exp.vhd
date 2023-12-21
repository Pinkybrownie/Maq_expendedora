----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Andrea Marron Rosado
-- 
-- Create Date: 04.12.2023 19:04:33
-- Design Name: 
-- Module Name: maq_exp - Behavioral
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

entity maq_exp is
    Port ( clk: in STD_LOGIC;
           RESET: in STD_LOGIC;
           button_mon: in STD_LOGIC;
           button_prod: in STD_LOGIC;
           SW: in STD_LOGIC_VECTOR (3 downto 0);
           EUR_flag: in STD_LOGIC;
           err_flag : in STD_LOGIC_VECTOR (1 downto 0);
           act_saldo: out STD_LOGIC;--S2
           refresco: out STD_LOGIC;--);--S3
           LED: out STD_LOGIC_VECTOR (2 downto 0));
end maq_exp;

architecture Behavioral of maq_exp is
type states is (S0, S1, S2);
signal current: states := S0;
signal next_state: states; 

begin

state_register: process(clk)
 begin
  if rising_edge(CLK) then
   current <= next_state;
  end if;
 end process;
 
 next_state_mode: process(button_mon,button_prod, SW,current,err_flag, EUR_FLAG)
 begin
  next_state <= current;
  if RESET= '1' then
    next_state <= S0;
  end if;
  if err_flag="00" then
    case current is
    when S0 =>
     if button_prod = '1' and not(SW="0000") then --SELECCION DE BEBIDA
        next_state <= S1;
     end if;
     
    when S1 =>
     if button_mon = '1' then --INTRODUCCION DE MONEDAS
        next_state <= s1;
     end if;
     if EUR_FLAG = '1' and button_prod = '1' then --saldo 1EUR (quitado boton de producto)
        next_state <= S2;
     end if;

    when S2 =>
     if button_prod = '1' then --PULSAR BOTON DE PROD
        next_state <= S0;
     end if;
  end case;
  elsif err_flag= "11" then --saldo >1EUR
     next_state <= S0;
  elsif err_flag="10" then --comprar bebida cuando saldo<1EUR 
     next_state <= s1;
  end if;
  
 end process;
 
--VISUALIZAR EL ESTADO Y ACTIVACIÓN DE BANDERAS
output_decod: process (current)
 begin
  LED <= (OTHERS => '0');
  case current is
   when s0 =>
    LED(0) <= '1';
    refresco <= '0';--desactivacion modo refresco del decoder
    act_saldo <= '0';--desactivacion de la entidad saldo
   when s1 =>
    LED(1) <= '1';
    act_saldo <= '1';--activacion de la entidad saldo
   when s2 =>
    LED(2) <= '1';
    act_saldo <= '0';--desactivacion de la entidad saldo
    refresco <= '1'; --activacion modo refresco decoder
   when others =>
    LED <= (OTHERS => '0');
  end case;
 end process;

end Behavioral;
