--------------------------------------------------------------------------------
-- Create Date:   12:02:39 10/05/2017
-- Design Name:   
-- Module Name:   /home/koutetsu/Counter/VHDL/counter_testbench.vhd
-- Project Name:  Counter
-- 
-- VHDL Test Bench for module: counter_module
-- 
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY counter_testbench IS
END counter_testbench;
 
ARCHITECTURE behavior OF counter_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT counter_module
	 GENERIC ( 
			N : integer := 17 
			);
    PORT(
         Clock : IN  std_logic;
         Reset : IN  std_logic;
         Count_en : IN  std_logic;
         Up_Down_Ctrl : IN  std_logic;
         Count_out : OUT  unsigned(N-1 downto 0);
         Overflow_intr : OUT  std_logic;
         Underflow_intr : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Clock : std_logic := '0';
   signal Reset : std_logic := '0';
   signal Count_en : std_logic := '0';
   signal Up_Down_Ctrl : std_logic := '0';

 	--Outputs
   signal Count_out : unsigned(16 downto 0) := (others => '0');
   signal Overflow_intr : std_logic := '0';
   signal Underflow_intr : std_logic := '0';

   -- Clock period definitions
   constant Clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: counter_module 
	GENERIC MAP (
			 N => 17
			)
	PORT MAP (
          Clock => Clock,
          Reset => Reset,
          Count_en => Count_en,
          Up_Down_Ctrl => Up_Down_Ctrl,
          Count_out => Count_out,
          Overflow_intr => Overflow_intr,
          Underflow_intr => Underflow_intr
        );

   -- Clock process definitions
   Clock_process :process
   begin
		Clock <= '0';
		wait for Clock_period/2;
		Clock <= '1';
		wait for Clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      Reset <= '1';
		Count_en <= '0';
		Up_Down_Ctrl <= '0';
      wait for Clock_period*10;
		
		Reset <= '0';
		Count_en <= '1';
		Up_Down_Ctrl <= '0';
		wait for Clock_period*10;
		
		Up_Down_Ctrl <= '1';
      wait for Clock_period*50;
		
		Reset <= '1';
		wait for Clock_period*5;
		
		Reset <= '0';
		wait for Clock_period*50;
		wait;
   end process;

END;
