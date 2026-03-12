`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/03/11 11:32:25
// Design Name: 
// Module Name: PipelineSA
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module SAMV(
    input clk,                                        
    input rst,
    input EN,                                           
    input[31:0] A, B,
    output[31:0] res
    );

// [Topic 1] Please finish the code of systolic array for matrix-vector multiplication that requires 3 cycles for execution.
// You may use the Mac module in common/Mac.v to implement the multiplication and add process.
// The pipeline SA is OK. And you can also find different ways to implenment it.

// You may add some code here...

assign res = // Complete the signal here.

endmodule
