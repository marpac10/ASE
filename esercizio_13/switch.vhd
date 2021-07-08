library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity switch is
    Port ( x1 : in  STD_LOGIC_VECTOR (1 downto 0);
           x2 : in  STD_LOGIC_VECTOR (1 downto 0);
           src : in  STD_LOGIC;
           dst : in  STD_LOGIC;
           y1 : out  STD_LOGIC_VECTOR (1 downto 0);
           y2 : out  STD_LOGIC_VECTOR (1 downto 0));
end switch;

architecture structural of switch is

component mux_2_1 
Port ( a : in  STD_LOGIC_VECTOR(1 downto 0);
				b : in STD_LOGIC_VECTOR(1 downto 0);
           s : in  STD_LOGIC;
           y : out  STD_LOGIC_VECTOR(1 downto 0));
end component;

component demux_1_2
 Port ( x : in  STD_LOGIC_VECTOR ( 1 downto 0);
           y1 : out  STD_LOGIC_VECTOR (1 downto 0);
			  y2 : out  STD_LOGIC_VECTOR (1 downto 0);
           s : in  STD_LOGIC);
end component;


signal temp : std_logic_vector (1 downto 0);

begin

m : mux_2_1
port map(
a => x1,
b => x2,
s => src,
y => temp
);

d: demux_1_2
port map (
x => temp,
y1 => y1,
y2 => y2,
s => dst
);

end structural;

