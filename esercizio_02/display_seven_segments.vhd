library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity display_seven_segments is
	 Port ( clock : in  STD_LOGIC;
           value : in  STD_LOGIC_VECTOR (3 downto 0);
           anodes : out  STD_LOGIC_VECTOR (7 downto 0);
           cathodes : out  STD_LOGIC_VECTOR (7 downto 0));
end display_seven_segments;

architecture Structural of display_seven_segments is

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


begin

cathodes_instance: cathodes_manager port map(
	value => value,
	cathodes => cathodes
);

anodes_instance: anodes_manager port map(
	enable_digit => '1',
	anodes => anodes
);

end Structural;