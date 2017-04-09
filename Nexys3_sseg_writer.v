`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:22:49 04/05/2017 
// Design Name: 
// Module Name:    Nexys3_sseg_writer 
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
module digit_to_led(
    input [3:0 ] DIGIT,
	 output [7:0]   LED	 
	 );
	 reg  [7:0 ] sseg_temp ;
	 
	 always @ (*)
 begin
  case(DIGIT)
   4'd0 : sseg_temp = 8'b11000000; //to display 0
   4'd1 : sseg_temp = 8'b11111001; //to display 1
   4'd2 : sseg_temp = 8'b10100100; //to display 2
   4'd3 : sseg_temp = 8'b10110000; //to display 3
   4'd4 : sseg_temp = 8'b10011001; //to display 4
   4'd5 : sseg_temp = 8'b10010010; //to display 5
   4'd6 : sseg_temp = 8'b10000010; //to display 6
   4'd7 : sseg_temp = 8'b11111000; //to display 7
   4'd8 : sseg_temp = 8'b10000000; //to display 8
   4'd9 : sseg_temp = 8'b10010000; //to display 9
   4'd10 : sseg_temp = 8'b10001000; //to display A
   4'd11 : sseg_temp = 8'b10000011; //to display b
   4'd12 : sseg_temp = 8'b11000110; //to display C
   4'd13 : sseg_temp = 8'b10100001; //to display d
   4'd14 : sseg_temp = 8'b10000110; //to display E
   4'd15 : sseg_temp = 8'b10001110; //to display F
   default : sseg_temp = 8'b11111111; //dash
  endcase
 end
 
 assign LED = sseg_temp ;
	 
endmodule




module Nexys3_sseg_writer(
	input clk,
	input [3:0] digit0,
	input [3:0] digit1,
	input [3:0] digit2,
	input [3:0] digit3,
	output reg [7:0] SSEG_CA,
	output reg [3:0] SSEG_AN
	
    );
	 
	 
	 
	wire [7 : 0] led0 , led1 , led2, led3 ;	
	wire clk_16m;	
	integer count = 0;
	
	freq_divider_60hz f(clk,clk_16m) ;
	(*KEEP = "TRUE"*)digit_to_led d0(digit0, led0 ) ;
	(*KEEP = "TRUE"*)digit_to_led d1(digit1, led1 ) ;
	(*KEEP = "TRUE"*)digit_to_led d2(digit2, led2 ) ;
	(*KEEP = "TRUE"*)digit_to_led d3(digit3, led3 ) ;
	
	
always @ (posedge clk_16m)
 begin
	if (count < 4)
		begin   
		count = count + 1;
		end
	else
		begin count = 0 ; end 
 end


always @ (*)
 begin
  case(count)
   4'd0 : SSEG_AN = 4'b0111; //to display 0
   4'd1 : SSEG_AN = 4'b1011; //to display 1
   4'd2 : SSEG_AN = 4'b1101; //to display 2
   4'd3 : SSEG_AN = 4'b1110; //to display 3
	default: SSEG_AN = 4'b1111;
  endcase
  
 end
 
 
always @ (*)
 begin
  case(count)
   4'd0 : SSEG_CA = led0; //to display 0
   4'd1 : SSEG_CA = led1; //to display 1
   4'd2 : SSEG_CA = led2; //to display 2
   4'd3 : SSEG_CA = led3; //to display 3
  endcase
 end



 
endmodule

