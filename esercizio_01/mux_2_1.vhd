library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity mux_2_1 is
    Port ( a2 : in  STD_LOGIC_VECTOR(0 to 1);
           s2 : in  STD_LOGIC;
           y2 : out  STD_LOGIC);
end mux_2_1;

architecture dataflow of mux_2_1 is

begin

y2 <= ((a2(0) AND (NOT s2)) OR (a2(1) AND s2));

end dataflow;

