library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity anodes_manager is
    Port ( 
	 counter : in STD_LOGIC;
	 enable_digit : in  STD_LOGIC_VECTOR (1 downto 0);
           anodes : out  STD_LOGIC_VECTOR (7 downto 0)
			  );
end anodes_manager;

architecture Behavioral of anodes_manager is

signal anodes_switching : std_logic_vector(1 downto 0) := (others => '0');

begin

anodes(1 downto 0) <= not enable_digit or not anodes_switching;
anodes ( 7 downto 2) <= (others => '1');

anodes_process: process(counter, enable_digit)
begin
	--a seconda del valore di caunter le cifre si illuminano una alla volta da destra a sinistra
	case counter is
		when '0' =>
			anodes_switching <= "01";
		when '1' =>
			anodes_switching <= "10";
		when others =>
			anodes_switching <= (others => '0');
	end case;

end process;

		
end Behavioral;

