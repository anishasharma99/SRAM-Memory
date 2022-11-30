`timescale 1ns / 1ps
//B20030 Ques3.

module SRAM_32x8(
    input clk,
    input rst,
    input read,
    input write,
    input [7:0] wr_data,
    input [7:0] write_addr, read_addr,
    output reg [7:0] rd_data,
    output reg wr_done,rd_done
    );
parameter ADDR_WIDTH = 8;
parameter mem_size = 31;
parameter DATA_WIDTH = 7 ; // creates a array of size 16 X 4, means 16 locations each to store a 4-bit data
reg [DATA_WIDTH:0] temp_mem[0:mem_size];
always @(posedge clk)
    begin
        if(rst)
        begin
            wr_done<=0;
            rd_done<=0;
        end
        else
        begin
            if(write)
                begin
                    temp_mem[write_addr] <= wr_data;
                    wr_done <=1;
                end
            else
            begin
                wr_done<=0;
            end
            if(read)
                begin
                    rd_data <= temp_mem[read_addr];
                    rd_done <= 1;
                end
            else
                rd_done<=0;
        end
    end
endmodule