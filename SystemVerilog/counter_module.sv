`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// File Name:		 counter_module.v
// Module Name:    counter_module 
// Project Name: 	 Counter
// Description:    Model of an N-bit Counter
//
// Author:			 Anes Benmerzoug
//						 Anes.Benmerzoug@gmail.com
//
// Revision:		 Version 1.0 18/10/17
//////////////////////////////////////////////////////////////////////////////////
module counter_module
	#(	parameter N = 17 )
	 (	output logic[N-1:0] Count_out,
		output logic Overflow_intr, Underflow_intr,
		input logic Clock, Reset, Count_en, Up_Down_Ctrl );
		
	logic[N-1:0] count, count_old;
	
	always_comb
	   begin
	       Count_out = count;
	       Overflow_intr = (count == '0 & count_old == '1);
	       Underflow_intr = (count == '1 & count_old == '0);
	   end
		
	always_ff @(posedge Clock)
		begin: Internals
			if(Reset)
                {count, count_old} <= {'0, '0};
			else
				if(Count_en == 1'b1)
					if(Up_Down_Ctrl == 1'b1)
					   {count_old, count} <= {count, count + 1};
					else
					   {count_old, count} <= {count, count - 1};
		end

endmodule
