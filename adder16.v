`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:20:41 03/15/2017 
// Design Name: 
// Module Name:    ALU16 
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
/*
primitive MUX2  ( out,in1,in0, sel);
  output out;
  input  in1,in0, sel;  
  table
    ?00 : 0;
	 ?10 : 1;
    0?1 : 0;
	 1?1 : 1; 	 	    
  endtable
endprimitive

primitive MUX4 ( out,in3,in2,in1,in0, sel1,sel0);
  output out;
  input  in3,in2,in1,in0, sel1,sel0;  
  table
    ???000 : 0;
	 ???100 : 1;
    ??0?01 : 0;
	 ??1?01 : 1; 
	 ?0??10 : 0;
	 ?1??10 : 1;
    0???11 : 0; 
	 1???11 : 1; 	    
  endtable
endprimitive

*/
module adder16(
    input [15:0] A,
    input [15:0] B,
    output [15:0] out,
	 output Co
    );  
	 wire [15:0]  Cout ; 	
	 localparam s = 1'b0;

	
					
	Full_Adder f(A[0],B[0],s,out[0],Cout[0]);		
			
	 generate
		  genvar i;
		  for (i=1; i < 16; i=i+1) begin: r
									
				Full_Adder f(A[i],B[i],Cout[i-1],out[i],Cout[i]);		

		  end		  
	endgenerate
										
	assign Co = Cout[15];
	



endmodule
