----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shift_register is
port (
		clk : in STD_LOGIC;
		enable : in STD_LOGIC;
		init : in STD_LOGIC;
		d : in STD_LOGIC;
		reg : in STD_LOGIC_VECTOR (3 downto 0);
		x : in STD_LOGIC_VECTOR (7 downto 0);
		y : buffer STD_LOGIC_VECTOR (7 downto 0)
		);
		
end shift_register;

architecture Behavioral of shift_register is

--signal first : std_logic := '1';
signal y_temp : std_logic_vector (7 downto 0);

begin




main : process(clk)
begin

	
		
		
		if clk'event and clk = '0' then
		
		if init = '1' then
		y_temp <= x;
			
				
				elsif (enable = '1') then
				y_temp(1) <= y_temp(0);
				y_temp(2) <= y_temp(1);
				y_temp(3) <= y_temp(2);
				y_temp(4) <= y_temp(3);
				y_temp(5) <= reg(0);
				y_temp(6) <= reg(1);
				y_temp(7) <= reg(2);
				y_temp(0) <= d;
				end if;
				end if;
			
end process;

y <= y_temp;

end Behavioral;


