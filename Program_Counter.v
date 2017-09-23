`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 		3ST Technologies
// Engineer: 		Kartik Agarwal
// Create Date:    	19:13:49 09/23/2017 
// Module Name:    	Program_Counter 
// Project Name:   	RISC_8-bit
// Target Devices: 	Xilinx Spartan XC3S100e-5cp132
// Tool versions:  	Xilinx ISE Design suite 14.7 Webpack version
// Description: 	Program counter contain the next instruction address to be executed. 
//			This address will be input the program RAM to access a specific line of instructions. 
//			Normally, PC would be increased after every instruction executed to 
//			point to the next address except if flow control instructions is executed which modify the bits contain in the PC.

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
