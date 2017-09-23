`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:13:49 09/23/2017 
// Design Name: 
// Module Name:    Program_Counter 
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
module Program_Counter(
    input clock,
    input reset,
    input clear,
    input jump_enable,
	 input update_pc,
    input [13:0] jump_addr,
    output reg [13:0] PC
    );


always@(posedge clock or negedge reset)
begin
	
	if(reset==1'b0 || clear==1'b1)
		PC<=14'd0;
	
	else if(update_pc)
	begin
		if(jump_enable)
		PC<=jump_addr;
		else
		PC<=PC+1;
	end
	
	else
	PC<=PC;
	
end
	
endmodule
