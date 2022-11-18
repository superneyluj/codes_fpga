library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity bouton_led_timer_tb is
end bouton_led_timer_tb;

architecture Behavioral of bouton_led_timer_tb is

	component bouton_led_timer is
		port( 	btn 	: in STD_LOGIC;
			reset 	: in STD_LOGIC;
			clock 	: in STD_LOGIC;
			led 	: out STD_LOGIC);
	end component;

	signal btn : STD_LOGIC := '1' ;
	signal led : STD_LOGIC;
	signal reset : STD_LOGIC := '1';
	signal clock : STD_LOGIC := '0';

begin
	uut: bouton_led_timer
		port map(
		btn => btn,
		led => led,
		clock => clock,
		reset => reset);
	
btn_sti : process
begin
	btn <= '1'; 
	wait for 20 us;
	btn <= '0'; 
	wait for 2 us;
	btn <= '1'; 
	wait;
end process btn_sti;

rst_sti : process
begin
	reset <= '1'; 
	wait for 1 us;
	reset <= '0'; 
	wait for 1 us;
	reset <= '1'; 
	wait;
end process rst_sti;


clock_sti : process
begin
	clock <= '0'; 
	wait for 83.33 ns;
	clock <= '1'; 
	wait for 83.33 ns;
end process clock_sti;
	
end Behavioral;