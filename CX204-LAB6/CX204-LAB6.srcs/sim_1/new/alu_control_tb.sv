`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/30/2024 02:49:14 AM
// Design Name: 
// Module Name: alu_control_tb
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
/*
module alu_control(
    input logic [31:0]instruction,
    input logic [1:0]alu_op,
    output logic [3:0]alu_ctrl 
    );
    
    */

module alu_control_tb;

    logic [31:0]instruction;
    logic [1:0]alu_op;
    logic [3:0]alu_ctrl;
    
    
    alu_control alc1(
        .instruction(instruction),
        .alu_op(alu_op),
        .alu_ctrl(alu_ctrl)
    );
    
    
    
    
    initial begin
        instruction=32'b00000000000000000000000000000000;
        alu_op=2'b00;
        #10
        instruction=32'b00000000000000000000000000000000;
        alu_op=2'b10;
        #10
        instruction=32'b00000000000000000111000000000000;
        alu_op=2'b10;
        #10
        instruction=32'b00000000000000000101000000000000;
        alu_op=2'b10;
        #10
        instruction=32'b00000000000000000100000000000000;
        alu_op=2'b10;
        #10
        instruction=32'b00000000000000000001000000000000;
        alu_op=2'b10;
        #10
        instruction=32'b00000000000000000101000000000000;
        alu_op=2'b01;
        #10
        instruction=32'b00000000000000000101000000000000;
        alu_op=2'b00;
        #10
        instruction=32'b11111111111111111111111111111111;
        alu_op=2'b00;
        #10;
        $finish;
    end
endmodule
