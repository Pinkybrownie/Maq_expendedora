library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity Saldo is
    Port ( SW : in STD_LOGIC_VECTOR (3 downto 0);
           RESET : in STD_LOGIC;
           BOTON : in STD_LOGIC;
           ERR_FLAG: in STD_LOGIC_VECTOR (1 downto 0);
           SALIDA: out STD_LOGIC_VECTOR(4 downto 0) --10c equivaldrían a 00001, 20c a 00010...
          );
end Saldo;

architecture Behavioral of Saldo is
signal total: unsigned (SALIDA'range):= (others => '0');
begin
    process(SW,RESET,BOTON,ERR_FLAG)
    begin
        --NO DEBE HABER FLAG DE ERROR
        if ( ERR_FLAG = "00" and BOTON ='1') then
            case SW is
              when "0001" => total <= total + 10;   -- +1€
              when "0010" => total <= total + 5;    -- +50c
              when "0100" => total <= total + 2;    -- +20c
              when "1000" => total <= total + 1;    -- +10c
              when others => total <= total;
            end case;
        end if;
        --EN EL CASO DE SALDO > 1€ O PULSO BOTÓN RESET
        -- o QUERER REFRESCO CUANDO SALDO < 1€
        --REINICIO DEL SALDO (DEVOLUCIÓN DE DINERO)
        if RESET = '0' or ERR_FLAG = "10" or ERR_FLAG = "11" then
            total <=(others => '0');
        end if;
        SALIDA <= std_logic_vector (total);        
    end process;

end Behavioral;
