library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity omega_network is
    Port ( src : in STD_LOGIC_VECTOR (1 downto 0);
				dst : in STD_LOGIC_VECTOR (1 downto 0);
				dati : in STD_LOGIC_VECTOR (7 downto 0);
           --reg_source : out  STD_LOGIC_VECTOR (7 downto 0);
           reg_destination : out  STD_LOGIC_VECTOR (7 downto 0));
end omega_network;

architecture structural of omega_network is

component control_unit
 Port ( a : in  STD_LOGIC_VECTOR (1 downto 0);
           b : in  STD_LOGIC_VECTOR (1 downto 0);
           c : in  STD_LOGIC_VECTOR (1 downto 0);
           d : in  STD_LOGIC_VECTOR (1 downto 0);
           enable : in  STD_LOGIC_VECTOR (3 downto 0);
           y1 : out  STD_LOGIC_VECTOR (1 downto 0);
           y2 : out  STD_LOGIC_VECTOR (1 downto 0);
           y3 : out  STD_LOGIC_VECTOR (1 downto 0);
           y4 : out  STD_LOGIC_VECTOR (1 downto 0));
end component;

component operative_unit
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
end component;

component decoder_2_4
Port ( x : in  STD_LOGIC_VECTOR (1 downto 0);
           y : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

signal en : std_logic_vector (3 downto 0);
signal temp1 : std_logic_vector (1 downto 0);
signal temp2 : std_logic_vector (1 downto 0);
signal temp3 : std_logic_vector (1 downto 0);
signal temp4 : std_logic_vector (1 downto 0);


begin

c : control_unit
port map (
a => dati(1 downto 0),
b => dati(3 downto 2),
c => dati(5 downto 4),
d => dati(7 downto 6),
enable => en,
y1 => temp1,
y2 => temp2,
y3 => temp3,
y4 => temp4
);


o : operative_unit
port map (
a => temp1,
b => temp2,
c => temp3,
d => temp4,
src => src,
dst => dst,
y1 => reg_destination(1 downto 0),
y2 => reg_destination(3 downto 2),
y3 => reg_destination(5 downto 4),
y4 => reg_destination(7 downto 6)
);


d: decoder_2_4 
port map (
x => src,
y => en
);

end structural;

