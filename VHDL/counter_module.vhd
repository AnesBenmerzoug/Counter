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
use IEEE.NUMERIC_STD.ALL;

entity counter_module is
    Port ( Clock : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Count_en : in  STD_LOGIC;
           Up_Down_Ctrl : in  STD_LOGIC;
           Count_out : out  UNSIGNED(16 downto 0);
           Overflow_intr : out  STD_LOGIC;
           Underflow_intr : out  STD_LOGIC);
end counter_module;

architecture Behavioral of counter_module is

begin
	process(Clock)
	
	variable count_new, count_old: UNSIGNED(16 downto 0);
	variable overflow, underflow : STD_LOGIC;
	
	begin
		if Clock'event and Clock = '1' then
			if Reset = '1' then
				count_old := (others => '0');
				count_new := (others => '0');
				overflow := '0';
				underflow := '0';
			else
				if Count_en = '1' then
					if Up_Down_Ctrl = '1' then
						count_old := count_new;
						count_new := count_new + 1;
						if count_new = 0 and count_old = x"1FFFF" then
							overflow := '1';
						else
							overflow := '0';
						end if;
						underflow := '0';
					else
						count_old := count_new;
						count_new := count_new - 1;
						if count_new = x"1FFFF" and count_old = 0 then
							underflow := '1';
						else
							underflow := '0';
						end if;
						overflow := '0';
					end if;
				end if;
			end if;
		end if;
		
	Count_out <= count_new;
	Overflow_intr <= overflow;
	Underflow_intr <= underflow;
	
	end process;
	
end Behavioral;

