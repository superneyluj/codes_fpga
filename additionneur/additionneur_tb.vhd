----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.10.2022 19:18:06
-- Design Name: 
-- Module Name: additionneur_tb - Behavioral
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

entity additionneur_tb is
end additionneur_tb;

architecture Behavioral of additionneur_tb is

signal A, B, Cin, Sout, Cout : std_logic;

component additionneur is
    port(   A,B : in std_logic;
            Cin : in std_logic;
            Sout : out std_logic;
            Cout : out std_logic);
end component;

begin

    uut: additionneur port map(
        A => A,
        B => B,
        Cin => Cin,
        Sout => Sout,
        Cout => Cout);
        
Cin_sti : process
begin
    Cin <= '0';
    wait for 30ns;
    Cin <= '1';
end process Cin_sti;

A_sti : process
begin
    A <= '0';
    wait for 5ns; 
    A <= '1'; 
    wait for 20ns;
    A <= '0';
end process A_sti;    

B_sti : process
begin
    B <= '0';
    wait for 5ns; 
    B <= '1';
    wait for 10ns;
    B <= '0';
    wait for 40ns;
    B <= '1';
    wait for 45ns; 
    B <='0';
end process;
end Behavioral;

