`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:52:52 04/05/2017 
// Design Name: 
// Module Name:    Debouncer 
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
module Beh_DF (
	input clk,
	input button,
	output reg out
	);
	
	always @(posedge clk )
	begin
	out = button ;
	end
endmodule

module Debouncer(
    input clk,
    input button,
    output out
    );
	wire [18:0] w;
	
	Beh_DF df(clk,button,w[0]);
	generate
		  genvar i;
		  for (i=1; i < 19; i=i+1) begin: d
				Beh_DF df(clk,w[i-1],w[i]);
		  end		  
	endgenerate
	
	assign out = &w ;

endmodule
