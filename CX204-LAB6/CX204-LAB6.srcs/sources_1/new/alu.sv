`timescale 1ns / 1ps

module alu(
    input logic [31:0]op1,
    input logic [31:0]op2,
    input logic [3:0]alu_ctrl,
    output logic [31:0]alu_result,
    output logic zero
    );
    
    logic [31:0]uop1; 
    logic [31:0]uop2; 
    
    assign uop1 = $unsigned(op1);
    assign uop2 = $unsigned(op2);
    always@(*)begin
        case (alu_ctrl)
            0   :   alu_result<=op1+op2;
            8   :   alu_result<=op1-op2;
            4   :   alu_result<=op1^op2;
            6   :   alu_result<=op1|op2;
            7   :   alu_result<=op1&op2;
            1   :   alu_result<=op1<<op2[4:0];
            5   :   alu_result<=op1>>op2[4:0];
            13  :   alu_result<=$signed(op1) >>> op2[4:0];
            2   :   alu_result<= (op1<op2)      ? 32'h0001 : 32'h0000;
            3   :   alu_result<= (uop1<uop2)    ? 32'h0001 : 32'h0000;
            default: alu_result<=0;
        endcase
        
        zero <= op2==32'h0000;
    end 
                
endmodule
