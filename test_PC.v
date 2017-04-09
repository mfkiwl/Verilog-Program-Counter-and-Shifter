`timescale 1s / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:04:37 04/08/2017
// Design Name:   combinational_pc
// Module Name:   D:/Dropbox/EE_/8th semester/EE 540 ADVANCED DIGITAL DESIGN/hw3/Alp_homework3/test_PC.v
// Project Name:  Homework3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: combinational_pc
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_PC;

	// Inputs
	reg [15:0] Rdest;
	reg jump;
	reg reset;
	reg clk;
	reg En;
	reg branch;
	reg [7:0] disp;

	// Outputs
	wire [15:0] next_adress;

	// Instantiate the Unit Under Test (UUT)
	combinational_pc uut (
		.Rdest(Rdest), 
		.jump(jump), 
		.reset(reset), 
		.clk(clk),  
		.En(En), 
		.branch(branch), 
		.disp(disp), 
		.next_adress(next_adress)
	);
	
	always begin
	clk = ~clk ;
	//#500000000;//1 sec period
	#0.5;//1 sec period
	if (clk == 0)
		$display("next_adress = %h ", next_adress);
	end
	
	initial begin
		// Initialize Inputs
		Rdest = 0;
		jump = 0;
		reset = 0;
		clk = 0;
		En = 1;
		branch = 0;
		disp = 0;

		// Wait 100 ns for global reset to finish		
		$display("Enable is always one" );
      $monitor(   "%g jump= %b reset= %b clk= %b Rdest = %h branch = %b disp = %h ",    $time, jump, reset,clk, Rdest , branch , disp );
		#1;
		reset = 1;
		$display("First reset" );  
		#1;
		reset = 0;
		Rdest = 16'hF02A;
		#10;
		$display("Try jump" );
		jump = 1;
		
		#1;
		jump = 0;		
		disp = 8'h05;
		
		#10;
		$display("Try branch" );
		branch = 1;
		
		#5;
		branch = 0;
		
		#10;
		$display("Try reset " );
		reset = 1;
		
		#1;
		reset = 0;
		Rdest = 16'hAAAA;
		
		#10;
		$display("Try jump again" );
		jump = 1;
		
		#1;
		jump = 0;		
		


	end
      
endmodule

