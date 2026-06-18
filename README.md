# Data Memory (Verilog)
# Overview

The Data Memory module is a fundamental part of a processor that stores and retrieves data during execution.
Unlike Instruction Memory (read-only), Data Memory supports both:

✍️ Write operations
📖 Read operations

This implementation uses a 16 × 8-bit memory (16 locations, each 8 bits wide).

# Features
 16 memory locations
 8-bit data width
 Synchronous write (on clock edge)
 Asynchronous read (instant output)
 Controlled by Write Enable (we)

 # Inputs & Outputs
Signal	      Type	                            Description
clk	          Input	                           Clock signal
we	          Input	                 Write Enable(1 = write, 0 = read)
addr	      Input [3:0]	                   Memory address (0–15)
write_data	Input [7:0]                   	Data to be written
read_data	  Output [7:0]	                Data read from memory

# Applications
 CPU Data Storage
 Load/Store Instructions
 Stack / Variables
 Buffers & Temporary Storage
