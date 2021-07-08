LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY shift_circular_register_tb IS
END shift_circular_register_tb;
 
ARCHITECTURE behavior OF shift_circular_register_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT shift_circular_register
    PORT(
         clk : IN  std_logic;
         button : IN  std_logic;
         rst : IN  std_logic;
         init : IN  std_logic_vector(0 to 7);
         y : OUT  std_logic_vector(0 to 7)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal button : std_logic := '0';
   signal rst : std_logic := '0';
   signal init : std_logic_vector(0 to 7) := (others => '0');

 	--Outputs
   signal y : std_logic_vector(0 to 7);

   -- Clock period definitions
   constant clk_period : time := 1 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: shift_circular_register PORT MAP (
          clk => clk,
          button => button,
          rst => rst,
          init => init,
          y => y
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

			rst <= '1';
			init <= "00100010";
			
			wait for 5 ns;
			
			rst <= '0';
			button <= '1';
			
			wait for 1 ns;
			
			button <= '0';
			
			wait for 4 ns;
			button <= '1';
			
			wait for 1 ns;
			
			button <= '0';
			
			wait for 4 ns;
			button <= '1';
			
			wait for 1 ns;
			
			button <= '0';
			
			wait for 4 ns;
			
			
		
		

      wait;
   end process;

END;
