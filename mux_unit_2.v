`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/25/2022 03:30:15 AM
// Design Name: 
// Module Name: mux_unit_2
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


module mux_unit_2(
    // Input are 8 bit fields
    input [7:0] ALUOutput,
    input [7:0] ReadData,
    
    // Input control signal
    input MemToReg,
    
    // Output 
    output reg [7:0] Mux2Output
    ); 
    
    // This MUX is used to switch between input data after DataMemory stage.
    always @(*)
    begin
        if(MemToReg == 1'b1)
            begin
            Mux2Output = ReadData;
            end
        else
            begin
            Mux2Output = ALUOutput;
            end
    end
endmodule
