`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/24/2022 10:49:08 PM
// Design Name: 
// Module Name: main_module
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


module main_module(
    // Inputs.
    input clock, 
    
    // Outputs.
    // PC o/p
    output reg [7:0] mPCStart,
    
    // Instruction Memory o/p
    output wire [7:0] mInstruction,
    
    // Control Unit o/p
    output wire mMemRead,
    output wire mRegWrite,
    output wire mMemToReg,
    output wire mALUOp,
    output wire mALUSrc,
    output wire mMemWrite,
    
    // Register File o/p
    output wire [7:0] mReadData1,
    output wire [7:0] mReadData2,
    
    // Sign Extension o/p
    output wire[7:0] mSignExtended,
    
    // MUX 1 o/p
    output wire [7:0] mMux1Output,
    
    // ALU o/p
    output wire [7:0] mALUOutput,
    
    // Data Memory o/p
    output wire [7:0]mReadData,
    
    // MUX2 o/p
    output wire [7:0]mMux2Output
    );

// This is to advance the PC in the last step.
wire [7:0] mPCNext;

// Following is how the control flows in the processor.

// Beginning of the execution, setting the PC to 0.
// This phase only happens once because of the 'intial' keyword.
initial begin
  mPCStart <= 8'b00000000;
end

// Setting up Instruction Memory Unit
// IMU input = output of PC 
// IMU output = instruction
instruction_memory_unit imu(.PC(mPCStart),
                            .Instruction(mInstruction));

// Setting up Control Unit
// CU input = Opcode which is the pper 3 bits of Instruction, i.e  mInstruction[7:5]
// CU output = Control signals to other components.
//             i.e MemRead, MemWrite, ALUSrc, ALUOp, MemToReg, RegWrite           
control_unit cu(.opcode(mInstruction[7:5]),
                .MemRead(mMemRead),
                .RegWrite(mRegWrite),
                .ALUSrc(mALUSrc),
                .ALUOp(mALUOp),
                .MemWrite(mMemWrite),
                .MemToReg(mMemToReg));

// Setting up the Register File Unit
// RFU input = Clock, 
//             rt_rd (i.e, mInstruction[4]), rs[i.e, mInstruction[3]),
//             write_register (i.e rt_rd/rd which is mInstruction[4]),
//             RegWrite (control signal),
//             WriteData ( output from the MUX unit after DataMemory Stage)
// RFU output = ReadData 1, ReadData 2                                          
register_file_unit rfu(.clock(clock),
		               .ReadRegister1(mInstruction[4]),
		               .ReadRegister2(mInstruction[3]),
		               .WriteRegister(mInstruction[4]),
		               .RegWrite(mRegWrite),
		               .WriteData(mMux2Output),
		               .ReadData1(mReadData1),
		               .ReadData2(mReadData2)); 
		                     
// Setting up the Sign Extension Unit.
// SFU input = Immediate data which is the lower 3 bits of the instruction, i.e mInstruction[2:0]
// SFU output = SignExtended (Sign extended 8 bits of data)
sign_extension_unit seu(.SignExtend(mInstruction[2:0]),
                        .SignExtended(mSignExtended));

// Setting up the MUX Unit (which is before the ALU Unit)
// MU1 input = ReadData1 (one of the outputs of register file unit),
//             SignExtended (sign extended output of sign extension unit),
//             ALUSrc (control signal)
// MU1 output = Mux1Output (Toggled output)              
mux_unit_1 mu1(.ReadData1(mReadData1),
               .SignExtended(mSignExtended),
               .ALUSrc(mALUSrc),
               .Mux1Output(mMux1Output));
               
// Setting up the ALU unit
// ALU input = Mux1Output (output of the MUX unit before the ALU),
//             ReadData2 (one of the outputs of Register File unit),
//             ALUOp (control signal)
// ALU output = ALUOutput         
alu_unit alu(.Mux1Output(mMux1Output),
             .ReadData2(mReadData2),
             .ALUOp(mALUOp),
             .ALUOutput(mALUOutput));
              
// Setting up the Data Memory Unit
// DMU input = clock, ReadAddress/WriteAddress (Output of the AlU),
//             MemWrite, MemRead (both control signals),
//             WriteData (one of the outputs of Register File Unit
// DMU output = ReadData 
data_memory_unit dmu(.clock(clock),
                     .Address(mALUOutput),
                     .WriteData(mReadData1),
                     .MemWrite(mMemWrite),
                     .MemRead(mMemRead),
                     .ReadData(mReadData));

// Setting up the MUX Unit (which is after the Data Memory Unit) 
// MU2 input = ALUOutput (output of the ALU), 
//             ReadData (output of the Data Memory unit)
//             MemToReg (control signal)
// MU2 output = Mux2Output (Toggled output)
mux_unit_2 mu2(.ALUOutput(mALUOutput),
               .ReadData(mReadData),
               .MemToReg(mMemToReg),
               .Mux2Output(mMux2Output)); 
 
// Setting up the Program Counter Unit
// PCU input = clock, reset, PC 
// PCU output = PCNext                        
program_counter_unit pcu(.clock(clock),
                         .PC(mPCStart),
                         .PCNext(mPCNext));
                         
// Update the mPCStart for the next instruction.    
always@(*)
   begin
   mPCStart = mPCNext;
   end  
 
endmodule

