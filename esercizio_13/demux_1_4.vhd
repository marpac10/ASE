library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity demux_1_4 is
    Port ( x : in  STD_LOGIC_VECTOR (1 downto 0);
           y1 : out  STD_LOGIC_VECTOR (1 downto 0);
			  y2 : out  STD_LOGIC_VECTOR (1 downto 0);
			  y3 : out  STD_LOGIC_VECTOR (1 downto 0);
			  y4 : out  STD_LOGIC_VECTOR (1 downto 0);
           s : in  STD_LOGIC_VECTOR (1 downto 0));
end demux_1_4;

architecture Behavioral of demux_1_4 is

begin

process (x,s)
begin

if s = "00" then y1 <= x;
elsif s = "01" then y2 <= x;
elsif s = "10" then y3 <= x;
else y4 <= x;
end if;
end process; 


end Behavioral;

