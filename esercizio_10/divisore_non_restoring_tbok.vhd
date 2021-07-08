LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY divisore_non_restoring_tbok IS
END divisore_non_restoring_tbok;
 
ARCHITECTURE behavior OF divisore_non_restoring_tbok IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT divisore_non_restoring
    PORT(
         clk : IN  std_logic;
         rst_n : IN  std_logic;
         load_first : IN  std_logic;
         load_second : IN  std_logic;
         in_byte : IN  std_logic_vector(3 downto 0);
         reg : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst_n : std_logic := '1';
   signal load_first : std_logic := '0';
   signal load_second : std_logic := '0';
   signal in_byte : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal reg : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: divisore_non_restoring PORT MAP (
          clk => clk,
          rst_n => rst_n,
          load_first => load_first,
          load_second => load_second,
          in_byte => in_byte,
          reg => reg
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
		
		in_byte <= "1100";
		load_first <= '1';
		
		wait for 5 ns;
		
		load_first <= '0';
		
		in_byte <= "0011";
		load_second <= '1';
		
		wait for 5 ns;
		
		load_second <= '0';
		
		

      wait;
   end process;

END;
