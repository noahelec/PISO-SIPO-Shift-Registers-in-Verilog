module PISO (
    input wire clk,              // Clock input
    input wire reset,            // Reset input
    input wire load,             // Load control input
    input wire [7:0] parallel_in, // Parallel input data
    input wire shift,            // Shift control input
    output reg serial_out        // Serial output data
);

    reg [7:0] shift_register;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            shift_register <= 8'b0;
            serial_out <= 1'b0;
        end else if (load) begin
            shift_register <= parallel_in;
        end else if (shift) begin
            serial_out <= shift_register[0];
            shift_register <= shift_register >> 1;
        end
    end
endmodule
