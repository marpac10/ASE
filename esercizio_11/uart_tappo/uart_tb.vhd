--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:12:55 12/11/2019
-- Design Name:   
-- Module Name:   C:/Users/Windows/Desktop/Progetto/esercizio_11/uart_tappo/uart_tb.vhd
-- Project Name:  uart_tappo
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: UARTcomponent
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
 
ENTITY uart_tb IS
END uart_tb;
 
ARCHITECTURE behavior OF uart_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT UARTcomponent
    PORT(
         TXD : OUT  std_logic;
         RXD : IN  std_logic;
         CLK : IN  std_logic;
         DBIN : IN  std_logic_vector(7 downto 0);
         DBOUT : OUT  std_logic_vector(7 downto 0);
         RDA : INOUT  std_logic;
         TBE : OUT  std_logic;
         RD : IN  std_logic;
         WR : IN  std_logic;
         PE : OUT  std_logic;
         FE : OUT  std_logic;
         OE : OUT  std_logic;
         RST : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal RXD : std_logic := '0';
   signal CLK : std_logic := '0';
   signal DBIN : std_logic_vector(7 downto 0) := (others => '0');
   signal RD : std_logic := '0';
   signal WR : std_logic := '0';
   signal RST : std_logic := '0';

	--BiDirs
   signal RDA : std_logic;

 	--Outputs
   signal TXD : std_logic;
   signal DBOUT : std_logic_vector(7 downto 0);
   signal TBE : std_logic;
   signal PE : std_logic;
   signal FE : std_logic;
   signal OE : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: UARTcomponent PORT MAP (
          TXD => TXD,
          RXD => RXD,
          CLK => CLK,
          DBIN => DBIN,
          DBOUT => DBOUT,
          RDA => RDA,
          TBE => TBE,
          RD => RD,
          WR => WR,
          PE => PE,
          FE => FE,
          OE => OE,
          RST => RST
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
