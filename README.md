# PISO and SIPO Shift Registers in Verilog

This repository contains the Verilog code and testbenches for Parallel-In Serial-Out (PISO) and Serial-In Parallel-Out (SIPO) shift registers.

## Files

1. **PISO.v**: Verilog module for the PISO shift register.
2. **SIPO.v**: Verilog module for the SIPO shift register.
3. **tb_PISO.v**: Testbench for the PISO shift register.
4. **tb_SIPO.v**: Testbench for the SIPO shift register.

## PISO Shift Register

### Module: PISO.v
The PISO (Parallel-In Serial-Out) shift register takes parallel input data and shifts it out serially. The module includes:
- Clock (`clk`) and reset (`reset`) inputs to control the timing and initialization.
- A load (`load`) control input to load the parallel data into the shift register.
- An 8-bit parallel input data bus (`parallel_in`).
- A shift control input (`shift`) to enable serial shifting of the data.
- A serial output (`serial_out`) to output the data bit by bit.

### Testbench: tb_PISO.v
The testbench for the PISO module initializes the inputs, applies a reset, loads a parallel data value, and then shifts the data out serially. It includes:
- Clock generation logic to toggle the clock signal.
- Initialization and reset sequences.
- Load operation to input parallel data into the register.
- Shift operation to output the data serially.
- Signal monitoring to display the outputs during simulation.

## SIPO Shift Register

### Module: SIPO.v
The SIPO (Serial-In Parallel-Out) shift register takes serial input data and converts it to parallel output. The module includes:
- Clock (`clk`) and reset (`reset`) inputs to control the timing and initialization.
- A serial input data line (`serial_in`).
- A shift control input (`shift`) to enable shifting of the data.
- An 8-bit parallel output data bus (`parallel_out`) to output the data in parallel.

### Testbench: tb_SIPO.v
The testbench for the SIPO module initializes the inputs, applies a reset, and shifts in a series of serial data bits. It then outputs the data in parallel. It includes:
- Clock generation logic to toggle the clock signal.
- Initialization and reset sequences.
- Shift operation to input serial data into the register.
- Signal monitoring to display the outputs during simulation.

## How to Run the Testbenches

1. **Install a Verilog simulator**: You can use tools like ModelSim, XSIM, or any other Verilog simulator.
2. **Compile the modules and testbenches**:
   - For ModelSim: `vlog PISO.v tb_PISO.v` and `vlog SIPO.v tb_SIPO.v`
   - For XSIM: `xvlog PISO.v tb_PISO.v` and `xvlog SIPO.v tb_SIPO.v`
3. **Run the simulation**:
   - For ModelSim: `vsim tb_PISO` and `vsim tb_SIPO`
   - For XSIM: `xelab tb_PISO` and `xelab tb_SIPO`
4. **View the simulation results**: Use the waveform viewer in your simulator to inspect the signals and verify the functionality of the shift registers.

