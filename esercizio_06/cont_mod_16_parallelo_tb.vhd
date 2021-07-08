LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY cont_mod_16_parallelo_tb IS
END cont_mod_16_parallelo_tb;
 
ARCHITECTURE behavior OF cont_mod_16_parallelo_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT cont_mod_16_parallelo
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         button : IN  std_logic;
         y : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal button : std_logic := '0';
	--signal u : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
--signal x : STD_LOGIC_VECTOR (2 downto 0) := (others => '0');
   
 	--Outputs
   signal y : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 0.5 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: cont_mod_16_parallelo PORT MAP (
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
	
	--x(0) <= u(0);
--x(1) <= u(0) and u(1);
--x(2) <= u(0) and u(1) and u(2);

      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 
		
		button <= '1';
			wait for 1 ns;
			
			button <= '0';
			wait for 4 ns;
			
			button <= '1';
			wait for 1 ns;
			
			button <= '0';
			wait for 4 ns;
			
			rst <= '1';
			
			button <= '1';
			wait for 1 ns;button <= '0';
			wait for 4 ns;
			
			button <= '1';
			wait for 1 ns;button <= '0';
			wait for 4 ns;

			button <= '1';
			wait for 1 ns;button <= '0';
			wait for 4 ns;
	
			button <= '1';
			wait for 1 ns;button <= '0';
			wait for 4 ns;
	
			button <= '1';
			wait for 1 ns;button <= '0';
			wait for 4 ns;
	
			button <= '1';
			wait for 1 ns;button <= '0';
			wait for 4 ns;
	
			button <= '1';
			wait for 1 ns;button <= '0';
			wait for 4 ns;
	
			button <= '1';
			wait for 1 ns;

      wait;
   end process;

END;
