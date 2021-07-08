library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity control_unit is
    Port ( 
			  clock : in  STD_LOGIC;
           reset_n : in  STD_LOGIC;
			  in_byte : in STD_LOGIC_VECTOR(3 downto 0);
           value : out  STD_LOGIC_VECTOR(3 downto 0)           
			  );
			  
end control_unit;

architecture Behavioral of control_unit is

signal reg_value : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');

signal reset : std_logic;

begin

reset <= not reset_n;

value <= reg_value;

main: process(clock, reset)

begin

	if reset = '1' then
		reg_value <= (others => '0');
	elsif clock'event and clock = '1' then
			reg_value <= in_byte(3 downto 0);
		end if;

end process;

end Behavioral;

