----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.11.2022 09:15:16
-- Design Name: 
-- Module Name: RS232 - Behavioral
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
use IEEE.STD_LOGIC_MISC.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RS232 is
  Port (    rst     : in std_logic;
            clk     : in std_logic;
            valid   : in std_logic;
            data    : in std_logic_vector(6 downto 0);
            txd     : out std_logic);
end RS232;

architecture Behavioral of RS232 is

--Définition des états de la machine à état
type  defState is (IDLE_STOP_STATE, START_STATE, DATA_STATE, PARITY_STATE);
signal state,state_next : defState;

signal buf,buf_next      : std_logic_vector(6 downto 0);
signal parity   : std_logic;
signal index,index_next    : natural range 0 to 6;

begin

    -- opérateur qui fait un xor sur tous les bits dans le vecteur
    parity <= xor_reduce(buf);

    -- FSM à 2 process 
    
    reg:process(clk,rst)
    begin
        if rst = '1' then
        -- init asynchrone
            state <= IDLE_STOP_STATE;
            index <= 0;
            buf <= (others => '0');
        elsif clk'event and clk = '1' then
        -- mem synchrone
            state <= state_next;
        end if;
    end process reg;
    
    -- Combinatoire 1 : calcul de l'état futur
    -- Combinatoire 2 : modification des sorties : txd
    comb1_2 : process(state,valid,data,index,buf)
    begin
        -- valeurs par défaut comb1
         state_next <= state;
         buf_next <= buf;
         index_next <= index;
         --valeurs par défaut comb2
         txd <= '1';
         
        case state is 
            when  IDLE_STOP_STATE =>
            txd <= '1';
                if valid = '1' then
                    state_next <= START_STATE;
                    index <= index_next;
                    buf <= buf_next;
                end if;
            
            when  START_STATE =>
                txd <= '0';
                index_next <= 0;
                buf_next <= data;
                state_next <= DATA_STATE;
                
            when  DATA_STATE =>
                index_next <= index + 1;
                txd <= buf(index);
                if index = 6 then
                    state_next <= PARITY_STATE;
                end if;            
            when  PARITY_STATE =>
                txd <= parity;
                state_next <= IDLE_STOP_STATE;        
        end case;
    end process comb1_2;

end Behavioral;
