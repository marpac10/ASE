library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity adder_subtracter is
    Port ( a : in  STD_LOGIC_VECTOR (4 downto 0);
           b : in  STD_LOGIC_VECTOR (4 downto 0);
           s : in  STD_LOGIC;
           y : out  STD_LOGIC_VECTOR (4 downto 0));
           --segno : out  STD_LOGIC);
end adder_subtracter;

architecture structural of adder_subtracter is

signal x : std_logic_vector (4 downto 0);
signal c : std_logic_vector (3 downto 0);

component full_adder 
Port ( x : in  STD_LOGIC;
           y : in  STD_LOGIC;
           c_in : in  STD_LOGIC;
           s : out  STD_LOGIC;
           c_out : out  STD_LOGIC);
end component;

begin

x(0) <= s xor b(0);
x(1) <= s xor b(1);
x(2) <= s xor b(2);
x(3) <= s xor b(3);
x(4) <= s xor b(4);
fa1 : full_adder
port map (
x => a(0),
y => x(0),
c_in => s,
s => y(0),
c_out => c(0)
);

fa2 : full_adder
port map (
x => a(1),
y => x(1),
c_in => c(0),
s => y(1),
c_out => c(1)
);

fa3 : full_adder
port map (
x => a(2),
y => x(2),
c_in => c(1),
s => y(2),
c_out => c(2)
);

fa4 : full_adder
port map (
x => a(3),
y => x(3),
c_in => c(2),
s => y(3),
c_out => c(3)
);

fa5 : full_adder
port map (
x => a(4),
y => x(4),
c_in => c(3),
s => y(4)
--c_out => segno
);
end structural;

