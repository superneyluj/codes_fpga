----------------------------------------------------------------------------------
-- Company: Personnel
-- Engineer: Sicot Julien
-- 
-- Create Date: 03.10.2022 18:57:05
-- Design Name: additionneur
-- Module Name: additionneur
-- Project Name: 
-- Target Devices: zync-7000
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

entity additionneur is
    -- generic(Tps,Tpc : time:= 0ns);
    port(   A,B : in std_logic;
            Cin : in std_logic;
            Sout : out std_logic;
            Cout : out std_logic);           
end additionneur;

--architecture flow of additionneur is

--begin

--    Sout <= A xor B xor Cin; -- after Tps;
--    Cout <= (A and B) or (Cin and (A xor B)); -- after Tpc;

--end flow;



--architecture structural of additionneur is
--component demi_additionneur
    -- generic(Tp : time := 10ns);
--    port(   A,B : in std_logic;
--            Cout : out std_logic;
--            Sout : out std_logic);
--end component;

--signal S0,S1,S2 : std_logic;

--begin
--    inst1 : demi_additionneur
--                -- generic map (Tp => 0 ns)
--                port map (A, B, S0, S1);
--    inst3 : demi_additionneur
--                port map(   A => S1,
--                            B => Cin,
--                            Cout => S2,
--                            Sout => Sout);
--                            
--    inst2: Cout <= S0 or S2;
--end structural;


architecture behavior of additionneur is
begin
        p1: process
            variable N : integer range 0 to 3;
            constant sumvecteur : std_logic_vector(0 to 3) := "0101";
            constant coutvecteur : std_logic_vector(0 to 3):= "0011";
         begin
            N := 0;
            if A='1' then
                N := N + 1;
            end if;
            if B = '1' then
                N := N + 1;
            end if;
            if Cin='1' then
                N := N + 1;
            end if;
            Sout <= sumvecteur(N); -- after Tps;
            Cout <= coutvecteur(N);-- after Tpc;
            wait on A,B,Cin;
         end process p1;
end behavior;

