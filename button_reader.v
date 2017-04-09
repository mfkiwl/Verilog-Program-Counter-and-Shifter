`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:58:30 04/05/2017 
// Design Name: 
// Module Name:    button_reader 
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
module button_reader(
	input [4:0] b_in,
	input clk,	
	output  right, //[Right , Down ,Left , Up , Center ]
	output down,
	output left,
	output up,
	output center
    );

	Debouncer d1(clk,b_in[0],right);
	Debouncer d2(clk,b_in[1],down);
	Debouncer d3(clk,b_in[2],left);
	Debouncer d4(clk,b_in[3],up);
	Debouncer d5(clk,b_in[4],center);



endmodule
