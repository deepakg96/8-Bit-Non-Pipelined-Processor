`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/18/2022 05:34:06 PM
// Design Name: 
// Module Name: control_unit
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


module control_unit(
    // Input is a 3 bit opcode.
    input [2:0] opcode,
    
    // Output are control signals to other components.
    output reg ALUOp,
    output reg RegWrite,
    output reg MemRead,
    output reg MemWrite,
    output reg ALUSrc,
    output reg MemToReg
    
 );
 // Switch case based on the 2 bit opcode and set the signals accordingly.
 always @(*)
 begin
    case(opcode)
        // I type load(lw) instruction : opcode - 001
        3'b001: begin
                RegWrite = 1'b1;
                MemRead = 1'b1;
                MemToReg = 1'b1;
                ALUSrc = 1'b1;
                ALUOp = 1'b1;
                MemWrite = 1'b0;
                end
    
        // I type store(sw) instrcution : opcode - 100
        3'b100: begin
                ALUOp = 1'b1;
                MemWrite = 1'b1;
                ALUSrc = 1'b1;
                MemRead = 1'b0;
                MemToReg = 1'b0;
                RegWrite = 1'b0;
                end
            
        // R type add(add) instrcution : opcode - 010
        3'b010: begin
                RegWrite = 1'b1;
                ALUOp = 1'b1;
                ALUSrc = 1'b0;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                MemToReg = 1'b0;
                end  
                
        // If none of the opcode matches, set all signals to 0.      
        default: begin
                RegWrite = 1'b0;
                ALUOp = 1'b0;
                ALUSrc = 1'b0;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                MemToReg = 1'b0;
                end  
    endcase       
  end
endmodule
