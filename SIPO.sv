module SIPO (
    input wire clk,              // Clock input
    input wire reset,            // Reset input
    input wire serial_in,        // Serial input data
    input wire shift,            // Shift control input
    output reg [7:0] parallel_out // Parallel output data
);

    reg [7:0] shift_register;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            shift_register <= 8'b0;
            parallel_out <= 8'b0;
        end else if (shift) begin
            shift_register <= {shift_register[6:0], serial_in};
            parallel_out <= shift_register;
        end
    end
endmodule
