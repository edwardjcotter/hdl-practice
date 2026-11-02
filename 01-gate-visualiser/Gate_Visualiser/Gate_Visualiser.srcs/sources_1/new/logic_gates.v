`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Student
// Engineer: Edward Cotter
// 
// Create Date: 02.11.2026 15:28:32
// Design Name: 
// Module Name: logic_gates
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module logic_gates(
input wire A,       // set inputs as wires A and B
input wire B,
output wire o_and,  //declaring output wires for 6 logic dates
output wire o_or,   //o_ denoted as output
output wire o_nand,
output wire o_nor,
output wire o_xor,
output wire o_xnor
    );
    
    assign o_and = A & B;       //assigning gates
    assign o_or = A | B;
    assign o_nand = ~(A & B);
    assign o_nor = ~(A | B);
    assign o_xor = A ^ B;
    assign o_xnor = ~(A ^ B);
endmodule
