library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity demux_1_2 is
    Port ( x : in  STD_LOGIC_VECTOR ( 1 downto 0);
           y1 : out  STD_LOGIC_VECTOR (1 downto 0);
			  y2 : out  STD_LOGIC_VECTOR (1 downto 0);
           s : in  STD_LOGIC);
end demux_1_2;

architecture Behavioral of demux_1_2 is

begin

process (x,s)
begin

if s = '0' then y1 <= x;
else y2 <= x;
end if;
end process;


end Behavioral;

