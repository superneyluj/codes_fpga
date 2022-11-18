----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.10.2022 13:39:41
-- Design Name: 
-- Module Name: multiplexeur4_1 - Behavioral
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

entity multiplexeur4_1 is
  Port (    sel     : in std_logic_vector(1 downto 0);
            A,B,C,D : in std_logic;
            S       : out std_logic );
end multiplexeur4_1;

architecture Behavioral_case of multiplexeur4_1 is
begin
    mux: process(A,B,C,D,sel)
    begin
    case sel is
        when "00" => 
            S <= A;
        when "01" => 
            S <= B;
        when "10" => 
            S <= C;
        when "11" => 
            S <= D;
      end case;
      end process;
end Behavioral_case;

architecture Behavioral_if of multiplexeur4_1 is
begin
    mux: process (A,B,C,D,sel)
    begin
    if sel = "00" then
        S <= A;
    elsif sel = "01" then
        S <= B;
    elsif sel = "10" then
        S <= C;
    else 
        S <= D;
    end if;
    end process;
end Behavioral_if;


 
