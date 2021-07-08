LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY uart_2_tb IS
END uart_2_tb;
 
ARCHITECTURE behavior OF uart_2_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT uart_2
    PORT(
         clk : IN  std_logic;
         --data : IN  std_logic_vector(7 downto 0);
         output : OUT  std_logic_vector(7 downto 0);
         load : IN  std_logic;
         in_byte : IN  std_logic_vector(7 downto 0);
         reset : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   --signal data : std_logic_vector(7 downto 0) := (others => '0');
   signal load : std_logic := '0';
   signal in_byte : std_logic_vector(7 downto 0) := (others => '0');
   signal reset : std_logic := '0';

 	--Outputs
   signal output : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: uart_2 PORT MAP (
          clk => clk,
     --     data => data,
          output => output,
          load => load,
          in_byte => in_byte,
          reset => reset
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
		
		in_byte <= "01001100";
		wait for 10 ns;
		load <= '1';
		wait for 50 ns;
		load <= '0';

      -- insert stimulus here 

      wait;
   end process;

END;
