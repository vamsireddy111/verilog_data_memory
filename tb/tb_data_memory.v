`timescale 1ns/1ps

module data_memory_tb;

reg clk;
reg we;
reg [3:0] addr;
reg [7:0] write_data;
wire [7:0] read_data;

data_memory uut (
    .clk(clk),
    .we(we),
    .addr(addr),
    .write_data(write_data),
    .read_data(read_data)
);

// Clock generation
always #5 clk = ~clk;

initial begin
    $dumpfile("dmem.vcd");
    $dumpvars(0, data_memory_tb);

    clk = 0;
    we = 0;
    addr = 0;
    write_data = 0;

    // Write values
    #10 we = 1; addr = 4; write_data = 8'hAA;
    #10 addr = 5; write_data = 8'h55;

    // Stop writing
    #10 we = 0;

    // Read values
    #10 addr = 4;
    #10 addr = 5;

    #20 $finish;
end

initial begin
  $monitor("Time=%0t | we=%b | addr=%d | write_data=%h | read_data=%h | clk=%b",
              $time, we, addr, write_data, read_data,clk);
end

endmodule
