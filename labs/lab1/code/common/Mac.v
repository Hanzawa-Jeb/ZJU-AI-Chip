`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/03/11 11:11:34
// Design Name: 
// Module Name: Mac
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


module Mac(
    input clk,                                        
    input rst,
    input EN,                                           
    input[3:0] A, B,
    input[7:0] C,
    output[8:0] res
    );
    wire [7:0] mult;
    wire [31:0] add_32_res;
    Mult4 mult4(
        .clk(clk),
        .rst(rst),
        .EN(EN),
        .A(A),
        .B(B),
        .res(mult)
    );

    add_32 add_32(
        .a({24'b0, mult}),
        .b({24'b0, C}),
        .c(add_32_res)
    );
    // Make sure the bitwidth is enough for 9-bit

    // Please finish the instance here.
    assign res = add_32_res[8:0];// You can design MAC based on your need.
    // Pure combinational Logic, no sequential needed
    
endmodule
