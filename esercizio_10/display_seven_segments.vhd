library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity display_seven_segments is
Generic( 
				clock_frequency_in : integer := 100000000; --parametri da customizzare, questo è il valore di default
				clock_frequency_out : integer := 50000
				);
	 Port ( clock : in  STD_LOGIC;
           reset_n : in  STD_LOGIC;
           value : in  STD_LOGIC_VECTOR (7 downto 0);
			  --enable : in STD_LOGIC_VECTOR (1 downto 0);
			  anodes : out  STD_LOGIC_VECTOR (7 downto 0);
           cathodes : out  STD_LOGIC_VECTOR (7 downto 0));
end display_seven_segments;

architecture Structural of display_seven_segments is


signal counter : std_logic;
signal clock_fx : std_logic := '0';


COMPONENT cathodes_manager
	Port ( 
	 counter : in STD_LOGIC;
	value : in  STD_LOGIC_VECTOR (7 downto 0);
           cathodes : out  STD_LOGIC_VECTOR (7 downto 0)
			  );
END COMPONENT;

COMPONENT anodes_manager
	 Port ( 
	 counter : in STD_LOGIC;
	 enable_digit : in  STD_LOGIC_VECTOR (1 downto 0);
           anodes : out  STD_LOGIC_VECTOR (7 downto 0)
			  );
END COMPONENT;

COMPONENT clock_filter
	GENERIC(
				clock_frequency_in : integer := 100000000;
				clock_frequency_out : integer := 50000
			);
	PORT(
	clock_in : IN std_logic; 
      reset_n : in  STD_LOGIC;		
		clock_out : OUT std_logic
		);
END COMPONENT;

COMPONENT counter_mod4
	PORT(
		clock : in  STD_LOGIC;
      reset_n : in  STD_LOGIC;
		enable : in STD_LOGIC;
      counter : out  STD_LOGIC
		);
END COMPONENT;

begin

clk_filter: clock_filter GENERIC MAP(
	clock_frequency_in => clock_frequency_in,
	clock_frequency_out => clock_frequency_out
	)
	PORT MAP(
		clock_in => clock,
		reset_n => reset_n,
		clock_out => clock_fx
	);
	
cathodes_instance: cathodes_manager port map(
	value => value,
	cathodes => cathodes,
	counter => counter
);
counter_instance: counter_mod4 port map(
	clock => clock,
	enable => clock_fx,
	reset_n => reset_n,
	counter => counter
);


anodes_instance: anodes_manager port map(
	enable_digit => (others => '1'),
	anodes => anodes,
	counter => counter
);

end Structural;