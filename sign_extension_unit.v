`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/20/2022 03:11:17 PM
// Design Name: 
// Module Name: sign_extension_unit
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


module sign_extension_unit(
    // Input is 3 bit immediate data which needs to sign extended.
    input [2:0] SignExtend,
    
    //  Output is sign extended.
    output reg[7:0] SignExtended 
    );
  
always @(*)
    begin
    // As per the project requirement, we dont care about whats in the MSB.
    // We simply add 5 zero bits in the upper bits.
     SignExtended <= {{5{0}} , SignExtend};
    end
endmodule
