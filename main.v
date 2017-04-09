`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:05:24 04/05/2017 
// Design Name: 
// Module Name:    main 
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
module main(
	input board_clk,
	input [4:0] BTN,
	input [7:0] SW,
	output [7:0] SSEG_CA,
	output [3:0] SSEG_AN
    );
	//    up      , down , left , right  ,center
	wire count,stop , up_par_load , down_par_load , reset  ;
	wire clk_1Hz,jump  ;
	localparam branch = 1'b0 ;
	//localparam En = 1'b1 ;
	localparam disp = 8'b0;
	reg active = 1'b0;
	reg r = 1'b1;
	//reg add = 1'b0 ;
	//reg val = 1'b1 ;
	wire [15:0] n_add;
	wire [15:0] next_adress;
	reg [15:0] Rdest = 16'b0;
	wire En;
	
	button_reader q(BTN,board_clk,down_par_load,stop,up_par_load,count,reset) ;
	
	freq_divider_1Hz f(board_clk, clk_1Hz);
	 assign En = (active & r)| jump | reset ; 
	combinational_pc cmb( Rdest, jump, reset, clk_1Hz , En , branch, disp, next_adress ) ;
	assign n_add = next_adress - 16'b1 ;
   Nexys3_sseg_writer  n(board_clk,n_add[3:0] ,n_add[7 :4],n_add[11 : 8],n_add[15:12],SSEG_CA,SSEG_AN   );
	
   //n_add[3:0] {1'b0 , active ,1'b0 , count} n_add[15:12] {1'b0 ,1'b0 ,1'b0 , En}
	//assign active = ~count  & ~stop; //stop all action when button is pressed
		
		
	/*always@(  stop)
	begin
			add = stop;		
	end*/
	//wire p = count | board_clk ;
	
	wire change = count | reset ;
	always @(posedge count or negedge stop ) begin
		if (count)
			active <= 1'b1;
		else
			active <= 1'b0;
	 end
	 
	 always @(posedge count or  negedge reset  ) begin
		if (count)
			r <= 1'b1;
		else
			r <= 1'b0;
	 end
	
	
	
		
   assign jump = down_par_load |  up_par_load;
	
	always@( down_par_load , up_par_load)
	begin
			if(down_par_load)
			begin
		  	Rdest = {n_add[15:8], SW[7:0]} ;
			end
			else if(up_par_load)
			begin
			Rdest = { SW[7:0], n_add[7:0]} ;
			end
		
	end
	
	
	
	

endmodule
