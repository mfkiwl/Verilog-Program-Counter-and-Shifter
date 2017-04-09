`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:50:15 04/03/2017 
// Design Name: 
// Module Name:    Shift16 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Crea ted
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////


module Shift16(
    input [15:0] num,
    input [5:0] count,
    input op_type, //11 logical  00 arithmatic 01 rotating(Barrel)
    output reg[15:0] o
    );
	 
	 reg[15:0] out = 16'h0000;	
	 reg[5:0] lim = 6'b0 ;
	 integer k;
	 
	 
	 always @ (*)
	 begin : a	 
		integer i;
		if(count[5]) //right shift	
			begin
			lim = ~count+ 6'b1 ;	
				if(op_type)  //logical					
						out = num>>lim ;						
				else   //arithmatic
						out = $signed(num)>>>lim;
			end							
		else   //left shift					
			begin			
				if(op_type) //logical				
						out = num<< count;			
				else   //arithmatic
						out = $signed(num) <<< count;				
			end				
		o = out ;
	end	
		
endmodule

