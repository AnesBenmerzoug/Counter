---------------------------------------------------------------------------------- 
-- Create Date:    12:01:47 10/05/2017 
-- Design Name: 
-- Module Name:    counter_module - Behavioral 
-- Project Name: 	 Counter
-- Description:  
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

entity counter_module is
    Port ( Clock : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Count_en : in  STD_LOGIC;
           Up_Down_Ctrl : in  STD_LOGIC;
           Count_out : out  STD_LOGIC_VECTOR (16 downto 0);
           Overflow_intr : out  STD_LOGIC;
           Underflow_intr : out  STD_LOGIC);
end counter_module;

architecture Behavioral of counter_module is

begin
	process(Clock)
	begin
		if Reset = '1' then
			Count_out <= (others => '0');
			Overflow_intr <= '0';
			Underflow_intr <= '0';
		end if;
	end process;
end Behavioral;

