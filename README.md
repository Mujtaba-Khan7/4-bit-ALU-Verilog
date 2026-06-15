# 4-bit ALU in Verilog

## What this project does
A 4-bit Arithmetic Logic Unit (ALU) that supports 7 operations
controlled by a 3-bit opcode, with zero, carry, and overflow flags.

## Opcode Table
Opcode  Operation 
000 - ADD (addition)
001 - SUB (subtraction)
010 - AND (bitwise AND)
011 - OR  (bitwise OR)
100 - XOR (bitwise XOR)
101 - SHL (left shift)
110 - SHR (right shift)

## Flag outputs
- Zero: high when result == 0
- Carry: high when unsigned overflow occurs

## Files
- half_adder.v / tb_half_adder.v
- full_adder.v / tb_full_adder.v
- ripple_carry_adder.v / tb_ripple_carry_adder.v
- alu_4bit.v / tb_alu_4bit.v

## Simulation
All modules simulated on EDA Playground using Icarus Verilog.
Waveforms captured using EPWave and attached in rep as a pdf



