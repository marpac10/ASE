library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity shift_circular_register is
    Port ( clk : in  STD_LOGIC;
           button : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           init : in  STD_LOGIC_VECTOR (0 to 7);
           y : out  STD_LOGIC_VECTOR (0 to 7));
end shift_circular_register;

architecture structural of shift_circular_register is

signal u : std_logic_vector (0 to 7);
signal x : std_logic_vector (0 to 7) := (others => '0');
signal reset_n : std_logic;

component et_mazzeo 
 Port ( clk : in  STD_LOGIC;
           d : in  STD_LOGIC;
			  rst : in STD_LOGIC;
           q : out  STD_LOGIC;
			  not_q : out STD_LOGIC);
end component;

component control_unit 
Port ( clk : in  STD_LOGIC;
           button : in  STD_LOGIC;
			  rst_n : in STD_LOGIC;
           init : in  STD_LOGIC_VECTOR (0 to 7);
           Y : out  STD_LOGIC_VECTOR (0 to 7));
end component;

begin

reset_n <= not rst;

ff1: et_mazzeo PORT MAP (
clk => clk,
d => u(0),
rst => '0',
q => y(0),
not_q => x(0)
);

ff2: et_mazzeo PORT MAP (
clk => clk,
d => u(1),
rst => '0',
q => y(1),
not_q => x(1)
);

ff3: et_mazzeo PORT MAP (
clk => clk,
d => u(2),
rst => '0',
q => y(2),
not_q => x(2)
);

ff4: et_mazzeo PORT MAP (
clk => clk,
d => u(3),
rst => '0',
q => y(3),
not_q => x(3)
);

ff5: et_mazzeo PORT MAP (
clk => clk,
d => u(4),
rst => '0',
q => y(4),
not_q => x(4)
);

ff6: et_mazzeo PORT MAP (
clk => clk,
d => u(5),
rst => '0',
q => y(5),
not_q => x(5)
);

ff7: et_mazzeo PORT MAP (
clk => clk,
d => u(6),
rst => '0',
q => y(6),
not_q => x(6)
);

ff8: et_mazzeo PORT MAP (
clk => clk,
d => u(7),
rst => '0',
q => y(7),
not_q => x(7)
);

control : control_unit PORT MAP (
			clk => clk,
           button => button,
			  rst_n => reset_n,
           init => init,
           Y => u
			  );
			  
end structural;

