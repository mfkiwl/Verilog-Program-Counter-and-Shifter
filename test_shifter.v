`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:14:36 04/06/2017
// Design Name:   Shift16
// Module Name:   D:/Dropbox/EE_/8th semester/EE 540 ADVANCED DIGITAL DESIGN/hw3/Alp_homework3/test_shifter.v
// Project Name:  Homework3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Shift16
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_shifter;

	// Inputs
	reg [15:0] num;
	reg [5:0] count;
	reg op_type;

	// Outputs
	wire [15:0] o;

	// Instantiate the Unit Under Test (UUT)
	Shift16 uut (
		.num(num), 
		.count(count), 
		.op_type(op_type), 
		.o(o)
	);

	initial begin
		// Initialize Inputs
		num = 0;
		count = 0;
		op_type = 0;

		// Wait 100 ns for global reset to finish
		#100;
		$monitor(   "%g num= %b count= %d o= %b optype =%d ",    $time, num, $signed(count),o , op_type);

      $display("Arithmatic Shifter" );
		#200; 
		num = 16'b1101001010110110;
		
		
		count =-16 ;
		
		#200; 
		count =-15 ;
		
		#200; 
		count= -14 ;
		
		#200; 
		count =-13 ;
		
		#200; 
		count =-12 ;
		
		#200; 
		count =-11 ;
				
		#200; 
		count= -10 ;	
				
		#200; 
		count= -9 ;
				
		#200; 
		count= -8 ;
				
		#200; 
		count= -7 ;
				
		#200; 
		count= -6 ;
				
		#200; 
		count= -5 ;
				
		#200; 
		count= -4 ;
				
		#200; 
		count= -3 ;
				
		#200; 
		count= -2 ;
				
		#200; 
		count= -1 ;
			
		#200; 
		count= 0;	

		#200; 
		count= 1;	

		#200; 
		count= 2;			
		
		#200; 
		count= 3 ;
		
		#200; 
		count= 4 ;
		
		#200; 
		count= 5 ;
				
		#200; 
		count= 6 ;
					
		#200; 
		count= 7 ;
		
		#200; 
		count= 8 ;
		
		#200; 
		count= 9 ;
		
		#200; 
		count= 10 ;

		#200; 
		count= 11 ;
		
		#200; 
		count= 12 ;
		
		#200; 
		count= 13 ;
		
		#200; 
		count= 14 ;
		
		#200; 
		count= 15 ;
		
		
		
		#200; 
		$display("Logical Shifter" );
		num = 16'b1101001010110110;
		op_type = 1'b1;	
		count =-16 ;
		
		#200; 
		count =-15 ;
		
		#200; 
		count= -14 ;
		
		#200; 
		count =-13 ;
		
		#200; 
		count =-12 ;
		
		#200; 
		count =-11 ;
				
		#200; 
		count= -10 ;	
				
		#200; 
		count= -9 ;
				
		#200; 
		count= -8 ;
				
		#200; 
		count= -7 ;
				
		#200; 
		count= -6 ;
				
		#200; 
		count= -5 ;
				
		#200; 
		count= -4 ;
				
		#200; 
		count= -3 ;
				
		#200; 
		count= -2 ;
				
		#200; 
		count= -1 ;
			
		#200; 
		count= 0;	

		#200; 
		count= 1;	

		#200; 
		count= 2;			
		
		#200; 
		count= 3 ;
		
		#200; 
		count= 4 ;
		
		#200; 
		count= 5 ;
				
		#200; 
		count= 6 ;
					
		#200; 
		count= 7 ;
		
		#200; 
		count= 8 ;
		
		#200; 
		count= 9 ;
		
		#200; 
		count= 10 ;

		#200; 
		count= 11 ;
		
		#200; 
		count= 12 ;
		
		#200; 
		count= 13 ;
		
		#200; 
		count= 14 ;
		
		#200; 
		count= 15 ;
		

	end
      
endmodule

