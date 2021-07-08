LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY cont_mod_2_tb IS
END cont_mod_2_tb;
 
ARCHITECTURE behavior OF cont_mod_2_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT cont_mod_2
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
			 button : in STD_LOGIC;
         y : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
	signal button : std_logic := '0';
   

 	--Outputs
   signal y : std_logic;

   -- Clock period definitions
   constant clk_period : time := 1 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: cont_mod_2 PORT MAP (
          clk => clk,
          rst => rst,
			 button => button,
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
	button <= '1';
			wait for 10 ns;
			
			button <= '0';
			wait for 5 ns;
			
			button <= '1';
			wait for 5 ns;
			
			button <= '0';
			wait for 5 ns;
			
			rst <= '1';
			
			button <= '1';
			wait for 5 ns;button <= '0';
			wait for 5 ns;
			
			button <= '1';
			wait for 5 ns;button <= '0';
			wait for 5 ns;
			
			button <= '1';
			wait for 5 ns;button <= '0';
			wait for 5 ns;
	
			button <= '1';
			wait for 5 ns;

      wait;
   end process;

END;
