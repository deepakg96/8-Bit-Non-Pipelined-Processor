`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/24/2022 12:18:56 AM
// Design Name: 
// Module Name: testbench
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


module testbench;
/*
// AlU unit testing
// Input
reg [7:0] alu_input_1;
reg [7:0] alu_input_2;
reg alu_input_signal_aluop;

// Output
wire [7:0] alu_output;

// Module instantiation
alu_unit uut(.Mux1Output(alu_input_1),
             .ReadData2(alu_input_2),
             .ALUOp(alu_input_signal_aluop),
             .ALUOutput(alu_output));

initial begin
alu_input_1 = 8'b00000010;
alu_input_2 = 8'b00000110;
alu_input_signal_aluop = 1'b0;
end
*/

/*
// Control Unit unit testing
// Input
reg [3:0] cu_input_opcode;
// Outputs
wire cu_output_signal_alusrc;
wire cu_output_signal_regwrite;
wire cu_output_signal_memread;
wire cu_output_signal_memwrite;
wire cu_output_signal_memtoreg;
wire cu_output_signal_aluop;

// Module instantiation
control_unit uut(.opcode(cu_input_opcode),
                .ALUOp(cu_output_signal_aluop),
                .RegWrite(cu_output_signal_regwrite),
                .ALUSrc(cu_output_signal_alusrc),
                .MemWrite(cu_output_signal_memwrite),
                .MemRead(cu_output_signal_memread),
                .MemToReg(cu_output_signal_memtoreg));
                
initial begin
cu_input_opcode = 3'b001;
#50;
cu_input_opcode = 3'b100;
#50
cu_input_opcode = 3'b010;
end
*/

/*
// PC unit testing 
// Inputs
reg clock;
reg reset;
reg [7:0] pcu_input_pc;
// Output
wire [7:0] pcu_output_pc;

// Module instantiation 
program_counter_unit uut(.clock(clock),
                         .reset(reset),
                         .PC(pcu_input_pc),
                         .PCNext(pcu_output_pc));
                         
initial begin
// Testcase 1 
clock = 1;
reset = 0;
pcu_input_pc = 8'b00000100;

#50;

//Testcase 2
//clock = 0;
//reset = 1;
//pcu_input_pc = 8'b00000000;
end
*/


/*
// Instruction Memory unit testing
// Input
reg [7:0] imu_input_pc;
// Output
wire [7:0] imu_output_instruction;

// Module instantiation
instruction_memory_unit uut(.PC(imu_input_pc),
                            .Instruction(imu_output_instruction));

initial begin
imu_input_pc = 8'b00000000;
#50;
imu_input_pc = 8'b00000001;
#50
imu_input_pc = 8'b00000010;
end
*/

/*
// Register File unit testing
// Inputs
reg clock;
reg reset;
reg ru_input_read_reg_1;
reg ru_input_read_reg_2;
reg ru_input_write_reg;
reg [7:0] ru_input_write_data;
reg ru_input_signal_regwrite;

// Output
wire [7:0] ru_output_read_data_1;
wire [7:0] ru_output_read_data_2;

// Module instantiation
register_file_unit uut(.clock(clock),
                       .reset(reset),
                       .ReadRegister1(ru_input_read_reg_1),
                       .ReadRegister2(ru_input_read_reg_2),
                       .WriteData(ru_input_write_data),
                       .WriteRegister(ru_input_write_reg),
                       .RegWrite(ru_input_signal_regwrite),
                       .ReadData1(ru_output_read_data_1),
                       .ReadData2(ru_output_read_data_2));

initial begin
clock = 1;
ru_input_read_reg_1 = 1'b1;
ru_input_read_reg_2 = 1'b0;
ru_input_write_reg = 1'b0;
ru_input_signal_regwrite = 1'b1;
ru_input_write_data = 8'b01010101;
end
*/

/*
// Sign Extension unit testing
// Input
reg [2:0] seu_input;
// Output
wire [7:0] seu_output;   

// Module instantiation
sign_extension_unit uut(.SignExtend(seu_input),
                        .SignExtended(seu_output));

initial begin
seu_input = 3'b001;
end
*/


/*
// MUX unit testing
// Input
reg [7:0] mux_input_1;
reg [7:0] mux_input_2;
reg mux_input_signal;
// Output
wire [7:0] mux_output;

// Module instantiation
mux_unit_1 uut(.ReadData1(mux_input_1),
             .SignExtended(mux_input_2),
             .ALUSrc(mux_input_signal),
             .Mux1Output(mux_output));

initial begin
mux_input_1 = 8'b00010001;
mux_input_2 = 8'b11111111;
mux_input_signal = 1'b0;
end
*/


/*
// Data Memory unit testing
// Input
reg clock;
reg reset;
reg [7:0] dmu_input_read_address;
reg [7:0] dmu_input_write_address;
reg [7:0] dmu_input_write_data;
reg dmu_input_signal_memread;
reg dmu_input_signal_memwrite;

// Output
wire [7:0] dmu_output_read_data;

// Instruction Memory unit testing
// Input
reg [7:0] imu_input_pc;
// Output
wire [7:0] imu_output_instruction;

// Module instantiation
instruction_memory_unit uut(.PC(imu_input_pc),
                            .Instruction(imu_output_instruction));

initial begin
imu_input_pc = 8'b00000000;
#50;
imu_input_pc = 8'b00000001;
#50
imu_input_pc = 8'b00000010;
end
// Module instantitaion 
data_memory_unit uut(.clock(clock),
                     .reset(reset),
                     .ReadAddress(dmu_input_read_address),
                     .WriteAddress(dmu_input_write_address),
                     .WriteData(dmu_input_write_data),
                     .MemRead(dmu_input_signal_memread),
                     .MemWrite(dmu_input_signal_memwrite),
                     .ReadData(dmu_output_read_data));

initial begin
clock = 1;
reset = 0;
dmu_input_read_address = 8'b00000111;
dmu_input_write_address = 8'b00000111;
dmu_input_write_data = 8'b01010101;
dmu_input_signal_memread = 1'b1;
dmu_input_signal_memwrite = 1'b0;
end
*/


/*
// MUX unit testing
// Input
reg [7:0] mux_input_1;
reg [7:0] mux_input_2;
reg mux_input_signal;
// Output
wire [7:0] mux_output;

// Module instantiation
mux_unit_2 uut(.ALUOutput(mux_input_1),
             .ReadData(mux_input_2),
             .MemToReg(mux_input_signal),
             .Mux2Output(mux_output));

initial begin
mux_input_1 = 8'b00001000;
mux_input_2 = 8'b00010000;
mux_input_signal = 1'b0;
end
*/


// Testing the Main Module                     
// Inputs.
reg clock;

// Output of PC
wire [7:0] mPCStart;

// Output of Instruction Memory Unit
wire [0:7]mInstruction;

// Output of Control Unit    
wire mMemRead;
wire mRegWrite;
wire mMemToReg;
wire mALUOp;
wire mALUSrc;
wire mMemWrite;

// Output of Register File Unit  
wire [7:0]mReadData1;
wire [7:0]mReadData2;

// Output of Sign Extension Unit
wire [7:0] mSignExtended;

// Output of MUX1 
wire [7:0] mMux1Output;

// Output of ALU    
wire [7:0] mALUOutput;

// Output of Data Memory Unit   
wire [7:0]mReadData;

// Output of MUX2
wire [7:0]mMux2Output;


// Instantiating the Main Module
main_module uut(.clock(clock),
                .mPCStart(mPCStart),
                .mInstruction(mInstruction),
                .mALUOp(mALUOp),
                .mALUSrc(mALUSrc),
                .mMemRead(mMemRead),
                .mMemWrite(mMemWrite),
                .mMemToReg(mMemToReg),
                .mRegWrite(mRegWrite),
                .mReadData1(mReadData1),
                .mReadData2(mReadData2),
                .mSignExtended(mSignExtended),
                .mMux1Output(mMux1Output),
                .mALUOutput(mALUOutput),
                .mReadData(mReadData),
                .mMux2Output(mMux2Output));

// Begin test    
initial begin
    clock = 1;
    #200;
end
    
// Toggle clock
always begin
    #200;
    clock = ~clock;
end

endmodule
