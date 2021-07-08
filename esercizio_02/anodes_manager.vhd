library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity anodes_manager is
    Port ( enable_digit : in  STD_LOGIC;
           anodes : out  STD_LOGIC_VECTOR (7 downto 0)
			  );
end anodes_manager;

architecture Behavioral of anodes_manager is

begin

anodes(0) <= not enable_digit;
anodes ( 7 downto 1) <= (others => '1');
		
end Behavioral;

