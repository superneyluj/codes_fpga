----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.10.2022 18:34:41
-- Design Name: 
-- Module Name: bascule_d - Behavioral
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

entity bascule_d is
  Port (D : in std_logic;
        clk : in std_logic;
        Q : out std_logic;
        Q_n : out std_logic );
end bascule_d;

architecture Behavioral of bascule_d is
begin

process(clk)
begin
    if clk' event and clk = '1' then
        Q <= D;
        Q_n <= not D;
    end if;
end process;

end Behavioral;
