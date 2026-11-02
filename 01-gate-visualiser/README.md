# Gate Visualiser

## Overview
A first beginner FPGA project developed on a Digilent Nexys A7 board.

The purpose of this project is to visualise six different logic gates using physical switches, LEDs and a seven-segment display.

## Inputs
- SW0: Input B
- SW1: Input A
- SW10: AND gate selection
- SW11: OR gate selection
- SW12: NAND gate selection
- SW13: NOR gate selection
- SW14: XOR gate selection
- SW15: XNOR gate selection

## Outputs
- LED0 and LED1: Reflect the input switches.
- LED10 to LED15: Display the selected gate's Boolean output.
- Seven-segment display: Displays the currently selected gate, or NA if zero or multiple gates are selected.

## Hardware
- Digilent Nexys A7 FPGA development board.

## Development
- Language: Verilog
- IDE: Xilinx Vivado

The Nexys A7 Master XDC constraints file is sourced from Digilent's digilent-xdc repository