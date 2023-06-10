`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/18/2022 04:42:20 PM
// Design Name: 
// Module Name: alu_unit
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


module alu_unit(
    // Inputs are 8 bit fields.
    input [7:0] Mux1Output,
    input [7:0] ReadData2, 
    
    // Input control signal.
    input ALUOp,
    
    // Output is 8 bit field.
    output reg[7:0] ALUOutput
    ); 
    
// ALU only supports add functionality.
// AlUOp is set for all three instructions.
always @(*)
begin
    case(ALUOp)
        1'b1: begin
              ALUOutput = Mux1Output + ReadData2;
              end  
              
        // Even the default case add two inputs.
        default: begin
                 ALUOutput = Mux1Output + ReadData2;
                 end
    endcase
end
endmodule
