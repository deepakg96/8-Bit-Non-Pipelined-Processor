`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/25/2022 03:18:31 AM
// Design Name: 
// Module Name: mux_unit_1
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


module mux_unit_1(
    // Inputs are 7 bit values
    input [7:0] ReadData1,
    input [7:0] SignExtended,
    
    // Input control signal
    input ALUSrc,
    
    // Output of MUX, 7 bit field
    output reg [7:0] Mux1Output
    );
    
    // If ALUSrc control signal is set, then Mux output will be SignExtended.
    // Else, Mux output will be ReadData1.
    always @(*) 
    begin
        if (ALUSrc == 1'b1)
            begin
            Mux1Output <= SignExtended;
            end
        else
            Mux1Output <= ReadData1;
    end
endmodule