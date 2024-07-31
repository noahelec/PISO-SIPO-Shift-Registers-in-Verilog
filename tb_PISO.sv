module tb_PISO;

    // Inputs
    reg clk;
    reg reset;
    reg load;
    reg [7:0] parallel_in;
    reg shift;

    // Outputs
    wire serial_out;

    // Instantiate the PISO module
    PISO uut (
        .clk(clk),
        .reset(reset),
        .load(load),
        .parallel_in(parallel_in),
        .shift(shift),
        .serial_out(serial_out)
    );

    // Clock generation
    always #5 clk = ~clk;  // Toggle clock every 5 time units

    initial begin
        // Initialize Inputs
        clk = 0;
        reset = 0;
        load = 0;
        parallel_in = 8'b0;
        shift = 0;

        // Reset the PISO register
        reset = 1;
        #10;
        reset = 0;
        #10;

        // Load the parallel input data: 11001100
        load = 1;
        parallel_in = 8'b11001100;
        #10;
        load = 0;

        // Shift out the data serially
        shift = 1;
        #80;  // 8 clock cycles to shift out all bits

        // Wait for a few clock cycles
        shift = 0;
        #50;

        // End simulation
        $stop;
    end

    // Monitor signals
    initial begin
        $monitor("Time: %0t | serial_out: %b | parallel_in: %b | shift: %b | load: %b", $time, serial_out, parallel_in, shift, load);
    end

endmodule
