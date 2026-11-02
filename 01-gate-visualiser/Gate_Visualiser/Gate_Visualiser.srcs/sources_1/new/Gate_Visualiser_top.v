`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Student
// Engineer: Edward Cotter
// 
// Create Date: 02.11.2026 15:26:55
// Design Name: 
// Module Name: Gate_Visualiser_top
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


module Gate_Visualiser_top(
//square brackets removed from names in Nexys-A7-100T-Master.xdc for ease of typing
input wire SW0,
input wire SW1,
input wire SW10,
input wire SW11,
input wire SW12,
input wire SW13,
input wire SW14,
input wire SW15,    //declare desired inputs, switches 0, 1 and 10 to 15 

output wire LED0,
output wire LED1,
output wire LED10,
output wire LED11,
output wire LED12,
output wire LED13,
output wire LED14,
output wire LED15  //declare desired outputs, LEDs 0, 1 and 10 to 15
    );
    
    //internal wires in order to recieve the gate outputs along with gate switching
    wire d_and;
    wire d_or;
    wire d_nand;
    wire d_nor;
    wire d_xor;
    wire d_xnor; // d_ denoting display
    
    //instantiate logic gates module
    logic_gates gates (
        .A(SW0),
        .B(SW1),
        .o_and(d_and),
        .o_or(d_or),
        .o_nand(d_nand),
        .o_nor(d_nor),
        .o_xor(d_xor),
        .o_xnor(d_xnor)
    );
    
    //input LED indication
    assign LED0 = SW0;
    assign LED1 = SW1;
    
    //gate output LED indication
    assign LED10 = SW10 & d_and;
    assign LED11 = SW11 & d_or;
    assign LED12 = SW12 & d_nand;
    assign LED13 = SW13 & d_nor;
    assign LED14 = SW14 & d_xor;
    assign LED15 = SW15 & d_xnor;
 
endmodule
