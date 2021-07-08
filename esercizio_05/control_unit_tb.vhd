--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:15:23 11/25/2019
-- Design Name:   
-- Module Name:   C:/Users/Windows/Desktop/Progetto/esercizio_05/esercizio_05/control_unit_tb.vhd
-- Project Name:  esercizio_05
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: control_unit
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY control_unit_tb IS
END control_unit_tb;
 
ARCHITECTURE behavior OF control_unit_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT control_unit
    PORT(
         clk : IN  std_logic;
         button : IN  std_logic;
         rst_n : IN  std_logic;
         init : IN  std_logic_vector(0 to 7);
         Y : OUT  std_logic_vector(0 to 7)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal button : std_logic := '0';
   signal rst_n : std_logic := '1';
   signal init : std_logic_vector(0 to 7) := (others => '0');

 	--Outputs
   signal Y : std_logic_vector(0 to 7);

   -- Clock period definitions
   constant clk_period : time := 1 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: control_unit PORT MAP (
          clk => clk,
          button => button,
          rst_n => rst_n,
          init => init,
          Y => Y
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
		
		init <= "00001110";
		
		rst_n <= '0';
		wait for 2 ns;
		rst_n <= '1';
		
		wait for 5 ns;
		
		button <= '1';
		wait for 1 ns;
		button <= '0';
		
		wait for 4 ns;
		button <= '1';
		wait for 1 ns;
		button <= '0';
		
		
		wait for 6 ns;
		button <= '1';
		wait for 1 ns;
		button <= '0';
		
		wait for 9 ns;
		button <= '1';
		wait for 1 ns;
		button <= '0';
		
		
		

      wait;
   end process;

END;
