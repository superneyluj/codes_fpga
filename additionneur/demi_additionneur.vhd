----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.10.2022 19:01:38
-- Design Name: 
-- Module Name: demi_additionneur - flow
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

entity demi_additionneur is
    generic(Tp : time := 2.5ns);
    port(   A,B : in std_logic;
            Cout : out std_logic;
            Sout : out std_logic);
end demi_additionneur;

architecture flow of demi_additionneur is

begin
    Sout <= A xor B after Tp;
    Cout <= A and B after Tp;
end flow;
