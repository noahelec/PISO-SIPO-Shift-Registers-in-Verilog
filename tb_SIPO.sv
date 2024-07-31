module tb_SIPO;

    // Inputs
    reg clk;
    reg reset;
    reg serial_in;
    reg shift;

    // Outputs
    wire [7:0] parallel_out;

    // Instantiate the SIPO module
    SIPO uut (
        .clk(clk),
        .reset(reset),
        .serial_in(serial_in),
        .shift(shift),
        .parallel_out(parallel_out)
    );

    // Clock generation
    always #5 clk = ~clk;  // Toggle clock every 5 time units

    initial begin
        // Initialize Inputs
        clk = 0;
        reset = 0;
        serial_in = 0;
        shift = 0;

        // Reset the SIPO register
        reset = 1;
        #10;
        reset = 0;
        #10;

        // Shift in the first byte: 10101010
        shift = 1;
        serial_in = 1;
        #10;
        serial_in = 0;
        #10;
        serial_in = 1;
        #10;
        serial_in = 0;
        #10;
        serial_in = 1;
        #10;
        serial_in = 0;
        #10;
        serial_in = 1;
        #10;
        serial_in = 0;
        #10;
        shift = 0;

        // Wait for a few clock cycles
        #50;

        // Display the parallel output
        $display("Parallel Output: %b", parallel_out);

        // End simulation
        $stop;
    end

endmodule
