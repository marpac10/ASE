library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity operative_unit is
 Port ( a : in  STD_LOGIC_VECTOR (1 downto 0);
           b : in  STD_LOGIC_VECTOR (1 downto 0);
           c : in  STD_LOGIC_VECTOR (1 downto 0);
           d : in  STD_LOGIC_VECTOR (1 downto 0);
           src : in STD_LOGIC_VECTOR (1 downto 0);
			  dst : in STD_LOGIC_VECTOR (1 downto 0);
           y1 : out  STD_LOGIC_VECTOR (1 downto 0);
           y2 : out  STD_LOGIC_VECTOR (1 downto 0);
           y3 : out  STD_LOGIC_VECTOR (1 downto 0);
           y4 : out  STD_LOGIC_VECTOR (1 downto 0));
end operative_unit;

architecture structural of operative_unit is

component switch
 Port ( x1 : in  STD_LOGIC_VECTOR (1 downto 0);
           x2 : in  STD_LOGIC_VECTOR (1 downto 0);
           src : in  STD_LOGIC;
           dst : in  STD_LOGIC;
           y1 : out  STD_LOGIC_VECTOR (1 downto 0);
           y2 : out  STD_LOGIC_VECTOR (1 downto 0));
end component;

signal temp1 : std_logic_vector (1 downto 0);
signal temp2 : std_logic_vector (1 downto 0);
signal temp3 : std_logic_vector (1 downto 0);
signal temp4 : std_logic_vector (1 downto 0);

begin

s1 : switch
port map (
x1 => a,
x2 => b,
src => src(0),
dst => dst(1),
y1 => temp1,
y2 => temp2
);

s2 : switch
port map (
x1 => c,
x2 => d, 
src => src(0),
dst => dst(1),
y1 => temp3,
y2 => temp4
);

s3 : switch
port map (
x1 => temp1,
x2 => temp3,
src => src(1),
dst => dst(0),
y1 => y1,
y2 => y2
);

s4 : switch
port map (
x1 => temp2,
x2 => temp4,
src => src(1),
dst => dst(0),
y1 => y3,
y2 => y4
);

end structural;

