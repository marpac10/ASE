library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity control_unit is
    Port ( clk : in  STD_LOGIC;
           button : in  STD_LOGIC;
			  rst_n : in STD_LOGIC;
           init : in  STD_LOGIC_VECTOR (0 to 7);
           Y : out  STD_LOGIC_VECTOR (0 to 7));
end control_unit;

architecture Behavioral of control_unit is

signal reset : std_logic;
--signal first : std_logic := '1';
signal y_temp : std_logic_vector (0 to 7);

begin

reset <= not rst_n;


main : process(clk)
begin

	y <= y_temp;
		--first <= '1';
		
		if clk'event and clk = '0' then
		
		if reset = '1' then
		y_temp <= init;
			--if first = '1' then
				--y_temp <= init;
				
				elsif (button'event and button = '0') then
				--first <= '0';
				y_temp(1) <= y_temp(0);
				y_temp(2) <= y_temp(1);
				y_temp(3) <= y_temp(2);
				y_temp(4) <= y_temp(3);
				y_temp(5) <= y_temp(4);
				y_temp(6) <= y_temp(5);
				y_temp(7) <= y_temp(6);
				y_temp(0) <= y_temp(7);
				end if;
				end if;
			
end process;
end Behavioral;

