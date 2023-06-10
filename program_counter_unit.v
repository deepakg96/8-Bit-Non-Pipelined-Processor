`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/20/2022 11:18:01 PM
// Design Name: 
// Module Name: program_counter_unit
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


module program_counter_unit(
    // Input
    input clock,
    input [7:0] PC,
    
    // Output
    output reg [7:0] PCNext
    );
    
// Update PC based on clock phase
always @(posedge clock) 
begin     
        // PC gets incremented by 1 
		PCNext <= PC + 8'b00000001;
end
endmodule
