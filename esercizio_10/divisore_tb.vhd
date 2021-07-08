LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY divisore_tb IS
END divisore_tb;
 
ARCHITECTURE behavior OF divisore_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT divisore
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         start : IN  std_logic;
         dvsr : IN  std_logic_vector(3 downto 0);
         dvnd : IN  std_logic_vector(3 downto 0);
         ready : OUT  std_logic;
         done_tick : OUT  std_logic;
         quo : OUT  std_logic_vector(3 downto 0);
         rmd : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal start : std_logic := '0';
   signal dvsr : std_logic_vector(3 downto 0) := (others => '0');
   signal dvnd : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal ready : std_logic;
   signal done_tick : std_logic;
   signal quo : std_logic_vector(3 downto 0);
   signal rmd : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 1 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: divisore PORT MAP (
          clk => clk,
          reset => reset,
          start => start,
          dvsr => dvsr,
          dvnd => dvnd,
          ready => ready,
          done_tick => done_tick,
          quo => quo,
          rmd => rmd
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
		
		dvnd <= "1101";
		dvsr <= "0101";
		start <= '1';
		
		


      wait;
   end process;

END;
