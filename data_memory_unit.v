`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/20/2022 10:59:09 PM
// Design Name: 
// Module Name: data_memory_unit
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


module data_memory_unit(
    // Inputs
    input clock,
    input [7:0] Address,
    input [7:0] WriteData,
    
    // Input control signals
    input MemWrite,
    input MemRead,
    
    // Output
    output reg [7:0] ReadData
    );
 
// Create 256 memory locations to store the register values 
integer i;  
reg [7:0] memory[0:255];

// One time init of memory
initial begin
for(i = 0; i < 255; i = i + 1)
// Initialising all memory locations to 0.
    memory[i] <= 8'b00000000;
end

always@ (posedge clock) 
begin
	// Deciding when to write into memory. i.e High phase of the clock.
	if(MemWrite == 1'b1)
	   begin
	   if (Address < 256)
	       begin
	       memory[Address] <= WriteData;
	       end
	   else
	       // If the address goes beyond available mem locations. Overwrite data.
	       begin
	       memory[Address%256] <= WriteData;
	       end
	   end 
end

// Decciding when to read from memory.
always@(*)
begin
    if(MemRead == 1'b1)
        begin
        if (Address < 256)
            begin
            ReadData <= memory[Address];
            end
        else
            // If the address goes beyond available mem locations. Overwrite data.
            begin
            ReadData <= memory[Address%256];
            end
	    end
end
	
endmodule