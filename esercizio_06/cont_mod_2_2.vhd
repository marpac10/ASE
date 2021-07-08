library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cont_mod_2_2 is
    Port ( 
	 rst : in  STD_LOGIC;
           t : in  STD_LOGIC;
           y : out  STD_LOGIC := '0');
end cont_mod_2_2;

architecture Behavioral of cont_mod_2_2 is

signal reset : std_logic;
signal y_temp : std_logic := '0';

begin

reset <= not rst;

counter_process: process(t, reset)
begin


if reset = '1' then
		y_temp <= '0';
	elsif t'event AND t = '0' then
		y_temp <= not y_temp;
		
	end if;
	
end process;

y <= y_temp;

end Behavioral;

