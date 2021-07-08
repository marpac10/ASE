library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


use IEEE.NUMERIC_STD.ALL;

entity cont_mod_2_parallelo is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
			  button : in STD_LOGIC;
			  x : in STD_LOGIC;
           y : out  STD_LOGIC);
end cont_mod_2_parallelo;

architecture Behavioral of cont_mod_2_parallelo is

signal reset : std_logic;
signal y_temp : std_logic := '0';
begin

reset <= not rst;


counter_process: process(clk,reset)
begin

y <= y_temp;


if reset = '1' then
		y_temp <= '0';
	elsif clk'event AND clk = '0' then
	if (button'event AND button= '0' AND x='1') then
		y_temp <= not y_temp;
	end if;
	end if;
end process;

end Behavioral;

