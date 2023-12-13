----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.12.2023 20:09:37
-- Design Name: 
-- Module Name: Saldo - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Saldo is
    Port ( CLK: in STD_LOGIC;
           ACT_FLAG: in STD_LOGIC;
           SW : in STD_LOGIC_VECTOR (3 downto 0);
           RESET : in STD_LOGIC;
           BOTON : in STD_LOGIC;
           ERR_FLAG: in STD_LOGIC_VECTOR (1 downto 0);
           ONE_EUR: out STD_LOGIC;
           SALIDA: out STD_LOGIC_VECTOR(7 downto 0)
          );
end Saldo;

architecture Behavioral of Saldo is
signal total: unsigned (SALIDA'range):= (others => '0');
begin
  process(CLK,SW,RESET,BOTON,ERR_FLAG, ACT_FLAG)
  begin
  if ACT_FLAG = '1' then
    if rising_edge(CLK) then
        --NO DEBE HABER FLAG DE ERROR
        if ( ERR_FLAG = "00" and BOTON ='1') then
            case SW is
              when "0001" => total <= total + 10;  
              when "0010" => total <= total + 20;
              when "0100" => total <= total + 50;
              when "1000" => total <= total + 100;
              when others => total <= total;
            end case;
        end if;
        --EN EL CASO DE SALDO>1EUR O PULSO BOTÓN RESET
        -- o QUERER REFRESCO CUANDO SALDO<1EUR
        --REINICIO DEL SALDO (DEVOLUCIÓN DE DINERO)
        if RESET = '0' or ERR_FLAG = "10" or ERR_FLAG = "11" then
           total <=(others => '0');
        end if;
     end if;
     if total=100 then
        ONE_EUR <= '1';
        --total <=(others => '0');
     else ONE_EUR <= '0';
     end if;
  end if;
  end process;
SALIDA <= std_logic_vector (total);
end Behavioral;
