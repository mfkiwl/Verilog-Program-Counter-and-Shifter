`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:26:15 04/05/2017 
// Design Name: 
// Module Name:    freq_divider_60hz 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module freq_divider_60hz(
    input in_clk,
    output out_clk
    );
	 reg out = 0 ;
	 integer counter = 0 ;
	 
	 
	 
	 always @(posedge in_clk) 
	 begin
	 counter = counter + 1 ;
	 if(counter == 500000)
		begin
			counter = 0;
			out = ~out ; 
		end
	 else if(out === 1'bx )
		begin
		  out = 0 ;
		  counter = 0 ;
		end
	 end
	 
	 	 assign out_clk  = out;

	 

endmodule
