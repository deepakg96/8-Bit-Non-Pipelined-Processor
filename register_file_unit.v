`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/20/2022 08:14:16 PM
// Design Name: 
// Module Name: register_file_unit
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


module register_file_unit(
    // Inputs.
    input clock,
    input ReadRegister1,
    input ReadRegister2,
    input WriteRegister,
    input [7:0] WriteData,

    // Input signal
    input RegWrite,
    
    // Outputs.
    output [7:0] ReadData1,
    output [7:0] ReadData2
 );
 
// Creating a 8 bit registers array. Since we only have 2 registers.
reg [7:0] registers [1:0];
initial begin
    // Default values of registers as per the requirement.
	registers[0] = 8'b00000101;  // s0 to 5
	registers[1] = 8'b00000001;  // s1 to 1
 end

// This specifies when to do a write operation. i.e high phase of the clock.
always @ (posedge clock )
begin
    if(RegWrite == 1'b1) 
        begin
        registers[WriteRegister] <= WriteData;
        end
end
 
// Finally, assign the values to outputs.
assign ReadData1 = registers[ReadRegister1];
assign ReadData2 = registers[ReadRegister2];

endmodule
