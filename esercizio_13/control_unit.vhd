----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity control_unit is
    Port ( a : in  STD_LOGIC_VECTOR (1 downto 0);
           b : in  STD_LOGIC_VECTOR (1 downto 0);
           c : in  STD_LOGIC_VECTOR (1 downto 0);
           d : in  STD_LOGIC_VECTOR (1 downto 0);
           enable : in  STD_LOGIC_VECTOR (3 downto 0);
           y1 : out  STD_LOGIC_VECTOR (1 downto 0);
           y2 : out  STD_LOGIC_VECTOR (1 downto 0);
           y3 : out  STD_LOGIC_VECTOR (1 downto 0);
           y4 : out  STD_LOGIC_VECTOR (1 downto 0));
end control_unit;

architecture structural of control_unit is

signal temp : STD_LOGIC_VECTOR(1 downto 0);
signal en : STD_LOGIC_VECTOR (1 downto 0);

component mux_4_1 
Port ( a : in  STD_LOGIC_VECTOR(1 downto 0);
				b : in STD_LOGIC_VECTOR(1 downto 0);
				c : in  STD_LOGIC_VECTOR(1 downto 0);
				d : in STD_LOGIC_VECTOR(1 downto 0);
           s : in  STD_LOGIC_VECTOR(1 downto 0);
           y : out  STD_LOGIC_VECTOR(1 downto 0));
end component;

component demux_1_4
 Port ( x : in  STD_LOGIC_VECTOR (1 downto 0);
           y1 : out  STD_LOGIC_VECTOR (1 downto 0);
			  y2 : out  STD_LOGIC_VECTOR (1 downto 0);
			  y3 : out  STD_LOGIC_VECTOR (1 downto 0);
			  y4 : out  STD_LOGIC_VECTOR (1 downto 0);
           s : in  STD_LOGIC_VECTOR (1 downto 0));
end component;

component logic_arbiter 
Port ( enable : in  STD_LOGIC_VECTOR (3 downto 0);
           y : out  STD_LOGIC_VECTOR (1 downto 0));
end component;

begin

m : mux_4_1
port map (
a => a,
b => b,
c => c,
d => d,
s => en,
y => temp
);

dem: demux_1_4
port map (
x => temp,
y1 => y1,
y2 => y2,
y3 => y3,
y4 => y4,
s => en
);

l: logic_arbiter
port map (
enable => enable,
y => en
);


end structural;

