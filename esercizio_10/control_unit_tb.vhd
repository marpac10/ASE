LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY control_unit_tb IS
END control_unit_tb;
 
ARCHITECTURE behavior OF control_unit_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT control_unit
    PORT(
         clk : IN  std_logic;
         reset_n : IN  std_logic;
         a : OUT  std_logic_vector(6 downto 0);
         b : OUT  std_logic_vector(3 downto 0);
         in_byte : IN  std_logic_vector(6 downto 0);
         load_first : IN  std_logic;
         load_second : IN  std_logic;
         d : IN  std_logic;
         enable : OUT  std_logic;
         init : OUT  std_logic;
         s : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset_n : std_logic := '1';
   signal in_byte : std_logic_vector(6 downto 0) := (others => '0');
   signal load_first : std_logic := '0';
   signal load_second : std_logic := '0';
   signal d : std_logic := '0';

 	--Outputs
   signal a : std_logic_vector(6 downto 0);
   signal b : std_logic_vector(3 downto 0);
   signal enable : std_logic;
   signal init : std_logic;
   signal s : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: control_unit PORT MAP (
          clk => clk,
          reset_n => reset_n,
          a => a,
          b => b,
          in_byte => in_byte,
          load_first => load_first,
          load_second => load_second,
          d => d,
          enable => enable,
          init => init,
          s => s
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 
		
		in_byte <= "1001010";
		load_first <= '1';
		wait for 20 ns;
		load_first <= '0';
		wait for 15 ns;
		load_second <= '1';
		wait for 20 ns;
		load_second <= '0';
		wait for 5 ns;
		d <= '1';
		wait for 5 ns;
		d <= '0';
		wait for 5 ns;
		d <= '1';
		

      wait;
   end process;

END;
