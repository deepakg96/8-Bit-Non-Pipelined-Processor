`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/20/2022 01:16:53 PM
// Design Name: 
// Module Name: instruction_memory_unit
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


module instruction_memory_unit(
    // Input is PC.
    input[7:0] PC,
    
    // Output is next instruction to be executed pointed by PC.
    output[7:0] Instruction
);
// Create 8 bit registers arrays to hold the instructions.
// Since we have only 3 instructions, we have 3 items in InstructionMemory
reg [7:0] InstructionMemory[2:0];
initial
begin
    InstructionMemory[0] <= 8'b10001000; // sw $s0, 0($s1) --> $s1 = 5
    InstructionMemory[1] <= 8'b00111000; // lw $s1, 0($s1) --> $s1 = 5
    InstructionMemory[2] <= 8'b01011000; // add $s1, $s1, $s1 --> $s1 = 10
end
 
// Sending out the next instruction pointed by PC.
assign Instruction =  InstructionMemory[PC]; 

endmodule

