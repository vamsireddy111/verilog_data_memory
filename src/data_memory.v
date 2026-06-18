module data_memory (
    input clk,
    input we,                 // Write Enable
    input [3:0] addr,
    input [7:0] write_data,
    output reg [7:0] read_data
);

reg [7:0] memory [0:15];     // 16 x 8-bit memory

// Initialize memory (optional)
integer i;
initial begin
    for (i = 0; i < 16; i = i + 1)
        memory[i] = 8'b0;
end

// Write operation (synchronous)
always @(posedge clk) begin
    if (we)
        memory[addr] <= write_data;
end

// Read operation (combinational)
always @(*) begin
    read_data = memory[addr];
end

endmodule
