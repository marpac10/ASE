library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity display_seven_segments is
--Generic( 
	--			clock_frequency_in : integer := 100000000; --parametri da customizzare, questo è il valore di default
		--		clock_frequency_out : integer := 50000
		--		);
	 Port ( clock : in  STD_LOGIC;
           reset_n : in  STD_LOGIC;
           value : in  STD_LOGIC_VECTOR (3 downto 0);
           anodes : out  STD_LOGIC_VECTOR (7 downto 0);
           cathodes : out  STD_LOGIC_VECTOR (7 downto 0));
end display_seven_segments;

architecture Structural of display_seven_segments is

--signal clock_fx : std_logic := '0';

COMPONENT cathodes_manager
	PORT(
		value : IN std_logic_vector(3 downto 0);       
		cathodes : OUT std_logic_vector(7 downto 0)
		);
END COMPONENT;

COMPONENT anodes_manager
	PORT(
		enable_digit : IN std_logic;          
		anodes : OUT std_logic_vector(7 downto 0)
		);
END COMPONENT;

--COMPONENT clock_filter
	--GENERIC(
		--		clock_frequency_in : integer := 100000000;
			--	clock_frequency_out : integer := 50000
				--);
	--PORT(
	--clock_in : IN std_logic; 
     -- reset_n : in  STD_LOGIC;		
		--clock_out : OUT std_logic
		--);
--END COMPONENT;
begin

--clk_filter: clock_filter GENERIC MAP(
	--clock_frequency_in => clock_frequency_in,
	--clock_frequency_out => clock_frequency_out
	--)
--	PORT MAP(
	--	clock_in => clock,
		--reset_n => reset_n,
		--clock_out => clock_fx
	--);
	
cathodes_instance: cathodes_manager port map(
	value => value,
	cathodes => cathodes
);

anodes_instance: anodes_manager port map(
	enable_digit => '1',
	anodes => anodes
);

end Structural;