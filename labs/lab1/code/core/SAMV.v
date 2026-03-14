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

wire[3:0] a = A[7:4];
wire[3:0] b = A[3:0];
wire[3:0] p = B[15:12];
wire[3:0] r = B[7:4];
wire[3:0] q = B[11:8];
wire[3:0] s = B[3:0];

// For simplicity, assign all the signals we need

reg[8:0] REG1_res;
reg[3:0] REG1_a;
reg[3:0] REG1_b;
reg[3:0] REG1_p;
reg[3:0] REG1_r;
reg[3:0] REG1_q;
reg[3:0] REG1_s;

reg[8:0] REG2_res_1;
reg[8:0] REG2_res_2;
reg[3:0] REG2_a;
reg[3:0] REG2_b;
reg[3:0] REG2_p;
reg[3:0] REG2_r;
reg[3:0] REG2_q;
reg[3:0] REG2_s;

wire[8:0] mac1_res;
wire[8:0] mac2_res;
wire[8:0] mac3_res;
wire[8:0] mac4_res;

wire[15:0] higher_res;
wire[15:0] lower_res;

Mac mac1(
    .clk(clk),
    .rst(rst),
    .EN(1),
    .A(a),
    .B(p),
    .C(8'b0),
    .res(mac1_res)
);

Mac mac2(
    .clk(clk),
    .rst(rst),
    .EN(1),
    .A(REG1_b),
    .B(REG1_r),
    .C(REG1_res[7:0]),
    .res(mac2_res)
);

Mac mac3(
    .clk(clk),
    .rst(rst),
    .EN(1),
    .A(REG1_a),
    .B(REG1_q),
    .C(8'b0),
    .res(mac3_res)
);

Mac mac4(
    .clk(clk),
    .rst(rst),
    .EN(1),
    .A(REG2_b),
    .B(REG2_s),
    .C(REG2_res_2[7:0]),
    .res(mac4_res)
);

always @(posedge clk) begin
    // Register 1 Part
    REG1_res <= mac1_res;
    REG1_a <= a;
    REG1_b <= b;
    REG1_p <= p;
    REG1_r <= r;
    REG1_q <= q;
    REG1_s <= s;

    // Register 2 Part
    REG2_res_1 <= mac2_res;
    REG2_res_2 <= mac3_res;
    REG2_a <= REG1_a;
    REG2_b <= REG1_b;
    REG2_p <= REG1_p;
    REG2_r <= REG1_r;
    REG2_q <= REG1_q;
    REG2_s <= REG1_s;
end

assign higher_res = {7'b0, REG2_res_1};
assign lower_res = {7'b0, mac4_res};

assign res = {higher_res, lower_res};// Complete the signal here.

endmodule
