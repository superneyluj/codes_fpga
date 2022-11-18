----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.10.2022 19:46:29
-- Design Name: 
-- Module Name: test_tb - Behavioral
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

entity bascule_d_tb is
--  Port ( );
end bascule_d_tb;

architecture Behavioral of bascule_d_tb is

    component bascule_d is
      Port (    D : in std_logic;
                clk : in std_logic;
                Q : out std_logic;
                Q_n : out std_logic);
    end component;
    
    signal D : std_logic;
    signal clk : std_logic;
    signal Q : std_logic;
    signal Q_n : std_logic;

begin

    uut: bascule_d
        port map(   D => D,
                    clk => clk,
                    Q => Q,
                    Q_n => Q_n);
                    
    clk_sti : process
    begin
           clk <= '0'; 
	       wait for 83.33 ns;
	       clk <= '1'; 
	       wait for 83.33 ns;
    end process clk_sti;
    
    D_sti : process
    begin
        D <= '0';
        wait for 100ns;
        D <= '1';
        wait for 150 ns;
        D <= '0';
        wait; 
     end process;
                      
end Behavioral;
