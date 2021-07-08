library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity control_unit is
    Port ( 
			  clock : in  STD_LOGIC;
           reset_n : in  STD_LOGIC;
			  load : in  STD_LOGIC;
			  in_byte : in STD_LOGIC_VECTOR(7 downto 0);
           data : out  STD_LOGIC_VECTOR(7 downto 0)
           
			  );
end control_unit;

architecture Behavioral of control_unit is

signal reg_first : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
signal reset : std_logic;

begin

reset <= not reset_n;

data <= reg_first;


main: process(clock, reset)
begin

	if reset = '1' then
		reg_first <= (others => '0');
	elsif clock'event and clock = '1' then
		if load = '1' then
			reg_first(7 downto 0) <= in_byte;
		end if;
	end if;

end process;


end Behavioral;


