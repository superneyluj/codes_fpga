library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;


entity bouton_led_timer is 
	Port	(btn 	: in std_logic;
			 reset 	: in std_logic;
			 clock 	: in std_logic;
			 led 	: out std_logic
			 );
end bouton_led_timer;

architecture Behavioral of bouton_led_timer is

signal m1 		: std_logic := '1';
signal m2 		: std_logic:= '1';
signal int		: std_logic:= '1';
signal buffer_led	: std_logic := '1';
signal cptr	 	: std_logic_vector (27 downto 0) := (others => '0');

begin	

	process(clock,reset)
	begin
		if(reset = '0') then
			buffer_led	<= '1';
			m1 		<= '1';
			m2		<= '1';
			int		<= '1';
			cptr		<= (others => '0');
		elsif rising_edge(clock) then
		
			buffer_led <= '1';
			
			m1 	<= btn;
			m2	<= m1;
			int	<= m2;
			
			if( (int = '1') and (m2 = '0') ) then
				-- quand un front montant est détecté, on met le compteur à 0
				-- et un met le premier bit à un
				-- le code n'est pas séquentiel mais dans un if c'est la dernière ligne impactant un signal qui sera "executé"
				-- dans ce cas on met les 27 bits de poids fort à 0 et le bit de poids faible à 1
				-- un bit = signal
				cptr <= (others => '0');
				cptr(0) <= '1';
				buffer_led <= '0';
			end if;
			
			--tant que le compteur est différent de 0 on l'incrément à chaque coup d'horloge		
			if( unsigned(cptr) /= 0) then
				cptr <= std_logic_vector(unsigned(cptr)+1);
				buffer_led	<= '0';
			end if;

			-- horloge à 12 Mhz donc 24 000 000 de coups d'horloge
			-- quand cette valeur est atteinte on remet à zéro le compteur
			if( unsigned (cptr) = (24000000-1) )then
				cptr <= (others => '0');
			end if;
		end if;
	end process;
	
	led <= buffer_led;

end Behavioral;