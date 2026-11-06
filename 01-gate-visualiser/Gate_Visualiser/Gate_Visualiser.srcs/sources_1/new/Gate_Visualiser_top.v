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
input wire CLK100MHZ,
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
output wire LED15,  //declare desired outputs, LEDs 0, 1 and 10 to 15

//7 segment output declaration
output wire CA,
output wire CB,
output wire CC,
output wire CD,
output wire CE,
output wire CF,
output wire CG,
output wire [7:0] AN
    );
    
    //internal wires in order to recieve the gate outputs along with gate switching
    wire d_and;
    wire d_or;
    wire d_nand;
    wire d_nor;
    wire d_xor;
    wire d_xnor; // d_ denoting display
    reg [2:0] word_selection; //saves word selected by switch
    localparam sd_and = 3'b000; //setting up local parameters so each display has a specific code
    localparam sd_or = 3'b001;
    localparam sd_nand = 3'b010;
    localparam sd_nor = 3'b011;
    localparam sd_xor = 3'b100;
    localparam sd_xnor = 3'b101;
    localparam sd_NA = 3'b110; ///sd_ denoting segment display   

    //word selection based on switch input
    always @(*) begin
        case ({SW15, SW14, SW13, SW12, SW11, SW10})
            6'b000001: word_selection = sd_and;
            6'b000010: word_selection = sd_or;
            6'b000100: word_selection = sd_nand;
            6'b001000: word_selection = sd_nor;
            6'b010000: word_selection = sd_xor;
            6'b100000: word_selection = sd_xnor;
            default: word_selection = sd_NA;
        endcase
    end
    
    
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
    
    //7 segment display
    seven_segment_configuration display (
        .CLK100MHZ(CLK100MHZ),
        .word_selection(word_selection),
        .CA(CA),
        .CB(CB),
        .CC(CC),
        .CD(CD),
        .CE(CE),
        .CF(CF),
        .CG(CG),
        .AN(AN)
    );
endmodule
