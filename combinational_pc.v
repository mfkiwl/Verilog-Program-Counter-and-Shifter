`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:49:34 04/04/2017 
// Design Name: 
// Module Name:    combinational_pc 
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

module MUX2  ( 
  output reg [15:0] out,
  input  [15:0] in1,
  input [15:0] in0,
  input sel
  );
  
  always @(*)
		begin
		
		if(sel)
			out = in1 ;
		else
			out = in0 ;
		end
		
  
endmodule

module combinational_pc(
    input [15:0] Rdest,//dest
    input jump,
	 input reset,
	 input clk ,
	 input En ,
    input branch,
    input [7:0] disp,
    output [15:0] next_adress
    );
	 
	 localparam ZERO = 16'b0 , ONE = 16'b1;
	 wire [15:0] Jout , Rout , PCout  , BRout , padded ;
	 wire[15:0] prev;
	 
	 MUX2 m1(Jout,Rdest, prev , jump) ;
	 MUX2 m2(Rout,ZERO, Jout , reset) ;
 	 Reg_Cell PC(Rout , clk , En , PCout);
 	 adder16 Add(BRout , PCout , prev ,);
	 
	 assign padded = disp ;
  	 MUX2 m3(BRout, padded , ONE ,branch) ;
	 assign next_adress = prev ;


	
	
	 
	 
	 


endmodule
