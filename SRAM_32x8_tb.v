`timescale 1ns / 1ps
//B20030 Ques3.
module SRAM_32x8_tb;

reg clk;
reg rst;
reg read;
reg write;
reg [7:0] wr_data;
reg [7:0] write_addr;
reg [7:0] read_addr;

wire [7:0] rd_data;
wire rd_done;
wire wr_done;

SRAM_32x8 m1(
.clk(clk),
.rst(rst),
.read(read),
.write(write),
.wr_data(wr_data),
.write_addr(write_addr),
.read_addr(read_addr),
.rd_data(rd_data),
.wr_done(wr_done),
.rd_done(rd_done)
);


initial begin
// Initialize Inputs
clk = 0;
rst = 1;
read = 0;
write = 0;
wr_data = 100;
write_addr = 0;
read_addr = 0;

#50;
rst = 0;
write = 1;
write_addr = 0;
wr_data = wr_data + 150;

#60;
write = 0;
read = 1;
read_addr = 0;

#100;
read = 0;
rst = 1;

#100;
rst = 0;
write = 1;
write_addr = write_addr + 7;
wr_data = wr_data + 100;

#100;
write = 0;
read = 1;
read_addr = read_addr + 7;

#100;
rst = 1;
read = 0;
write = 0;


    #100;
    $finish;
end
always #10 clk=~clk;

endmodule
