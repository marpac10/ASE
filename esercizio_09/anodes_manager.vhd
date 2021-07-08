library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity anodes_manager is
    Port ( counter : in  STD_LOGIC_VECTOR (1 downto 0);
           enable_digit : in  STD_LOGIC_VECTOR (3 downto 0);
           anodes : out  STD_LOGIC_VECTOR (7 downto 0)
			  );
end anodes_manager;

architecture Behavioral of anodes_manager is

signal anodes_switching : std_logic_vector(3 downto 0) := (others => '0');

begin

anodes(3 downto 0) <= not anodes_switching OR not enable_digit;
anodes(7 downto 4) <= (others => '1');

anodes_process: process(counter, enable_digit)
begin
	--a seconda del valore di caunter le cifre si illuminano una alla volta da destra a sinistra
	case counter is
		when "00" =>
			anodes_switching <= x"1";
		when "01" =>
			anodes_switching <= x"2";
		when "10" =>
			anodes_switching <= x"4";
		when "11" =>
			anodes_switching <= x"8";
		when others =>
			anodes_switching <= (others => '0');
	end case;

end process;


end Behavioral;

