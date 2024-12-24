`timescale 1ns / 1ps



module inst_mem(
    input logic [31:0]address,
    output logic [31:0]instruction
    );
    
    logic [31:0]memory[0:255];
    
    
    initial $readmemb("/home/cenema/Desktop/Xilinx_Projects/CX-204/CX-204-lab6/CX204-LAB6/machine.bin",memory);
    
    assign instruction=memory[address[31:2]];
    
endmodule



