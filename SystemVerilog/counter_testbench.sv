`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// File Name:		 counter_testbench.v
// Module Name:    counter_testbench
// Project Name: 	 Counter
// Description:    Testbench for the Model of an N-bit Counter
//
// Author:			 Anes Benmerzoug
//						 Anes.Benmerzoug@gmail.com
//
// Revision:		 Version 1.0 18/10/17
////////////////////////////////////////////////////////////////////////////////

module counter_testbench;
	// Parameter
	parameter N = 17;

	// Inputs
	reg Clock;
	reg Reset;
	reg Count_en;
	reg Up_Down_Ctrl;

	// Outputs
	wire [N-1:0] Count_out;
	wire Overflow_intr;
	wire Underflow_intr;

	// Instantiate the Unit Under Test (UUT)
	counter_module #(N) uut (.*);
	

	initial 
	   begin: clock_block
            // Initialize Clock
            Clock = 1'b0;
            forever #5 Clock = ~Clock;
        end
        
    initial
        begin
            Reset = 1'b0;
            Count_en = 1'b0;
            Up_Down_Ctrl = 1'b0;
            #20 Reset = 1'b1;
            #20 Reset = 1'b0;
            Count_en = 1'b1;
            Up_Down_Ctrl = 1'b0;
            #30 Up_Down_Ctrl = 1'b1;
            #100 Reset = 1'b1; 
        end
      
endmodule

