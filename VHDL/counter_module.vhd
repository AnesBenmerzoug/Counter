---------------------------------------------------------------------------------- 
-- Create Date:    12:01:47 10/05/2017 
-- Design Name: 
-- Module Name:    counter_module - Behavioral 
-- Project Name:   Counter
-- Description:    Model of an N-bit Counter
--
-- Author:		   Anes Benmerzoug
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity counter_module is
	 Generic ( N : INTEGER := 17 );
		 Port ( Clock : in  STD_LOGIC;
				  Reset : in  STD_LOGIC;
				  Count_en : in  STD_LOGIC;
				  Up_Down_Ctrl : in  STD_LOGIC;
				  Count_out : out  UNSIGNED(N-1 downto 0);
				  Overflow_intr : out  STD_LOGIC;
				  Underflow_intr : out  STD_LOGIC );
end counter_module;

architecture Behavioral of counter_module is

begin
	process(Clock)
		variable count_new, count_old: UNSIGNED(N-1 downto 0);
		constant count_max : UNSIGNED(N-1 downto 0) := (others => '1');
	begin
		if Clock'event and Clock = '1' then
			if Reset = '1' then
				count_old := (others => '0');
				count_new := (others => '0');
			else
				if Count_en = '1' then
					if Up_Down_Ctrl = '1' then
						count_old := count_new;
						count_new := count_new + 1;
					else
						count_old := count_new;
						count_new := count_new - 1;
					end if;
				end if;
			end if;
		end if;
		
	Count_out <= count_new;
	Overflow_intr <= '0';
    Underflow_intr <= '0'; 
	if count_new = 0 and count_old = count_max then
	   Overflow_intr <= '1';
	end if;
	if count_new = count_max and count_old = 0 then
       Underflow_intr <= '1';
	end if;
	
	end process;
	
end Behavioral;

