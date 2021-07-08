LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY shift_register_tb IS
END shift_register_tb;
 
ARCHITECTURE behavior OF shift_register_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT shift_register
    PORT(
         clk : IN  std_logic;
         enable : IN  std_logic;
         init : IN  std_logic;
         d : IN  std_logic;
         reg : IN  std_logic_vector(3 downto 0);
         x : IN  std_logic_vector(7 downto 0);
         y : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal enable : std_logic := '0';
   signal init : std_logic := '0';
   signal d : std_logic := '0';
   signal reg : std_logic_vector(3 downto 0) := (others => '0');
   signal x : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal y : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: shift_register PORT MAP (
          clk => clk,
          enable => enable,
          init => init,
          d => d,
          reg => reg,
          x => x,
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
		
		x <= "00100110";
		init <= '1';
		
		wait for 20 ns;
		init <= '0';
		
		d <= '1';
		reg <= "1111";
		
		wait for 20 ns;
		
		enable <= '1';
		wait for 9 ns;
		enable <= '0';
		
		

      wait;
   end process;

END;
