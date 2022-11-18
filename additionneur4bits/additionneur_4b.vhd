----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.10.2022 20:03:32
-- Design Name: 
-- Module Name: additionneur_4b - Behavioral
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

entity additionneur_4b is
    Port ( a : in STD_LOGIC_VECTOR (3 downto 0);
           b : in STD_LOGIC_VECTOR (3 downto 0);
           cin : in STD_LOGIC;
           s : out STD_LOGIC_VECTOR (3 downto 0);
           cout : out STD_LOGIC);
end additionneur_4b;

architecture Behavioral of additionneur_4b is
    signal cout0,cout1,cout2 : std_logic;
begin
    s(0) <= a(0) xor b(0) xor cin;
    cout0 <= (a(0) and b(0)) or (a(0) and cin) or (cin and b(0));
    
    s(1) <= a(1) xor b(1) xor cout0;
    cout1 <= (a(1) and b(1)) or (a(1) and cout0) or (cout0 and b(1));
    
    s(2) <= a(2) xor b(2) xor cout1;
    cout2 <= (a(2) and b(2)) or (a(2) and cout1) or (cout1 and b(2));
    
    s(3) <= a(3) xor b(3) xor cout2;
    cout <= (a(3) and b(3)) or (a(3) and cout2) or (cout2 and b(3));
    
    
end Behavioral;
