library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder is
    Port ( x : in  STD_LOGIC;
           y : in  STD_LOGIC;
           c_in : in  STD_LOGIC;
           s : out  STD_LOGIC;
           c_out : out  STD_LOGIC);
end full_adder;

architecture dataflow of full_adder is

begin

c_out <= (x and y) or (c_in and (x xor y));
s <= x xor y xor c_in;


end dataflow;

