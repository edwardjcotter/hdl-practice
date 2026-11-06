`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Student
// Engineer: Edward Cotter
// 
// Create Date: 02.11.2026 16:37:11
// Design Name: 
// Module Name: seven_segment_configuration
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


module seven_segment_configuration(
input wire CLK100MHZ,
input wire [2:0] word_selection,
output reg CA,
output reg CB,
output reg CC,
output reg CD,
output reg CE,
output reg CF,
output reg CG,
output reg [7:0] AN
    );
    
    reg [11:0] characters;
    localparam c_blank = 3'b000;
    localparam c_A = 3'b001;
    localparam c_N = 3'b010;
    localparam c_D = 3'b011;
    localparam c_O = 3'b100;
    localparam c_R = 3'b101;
    localparam c_X = 3'b110;
    localparam sd_and = 3'b000;
    localparam sd_or = 3'b001;
    localparam sd_nand = 3'b010;
    localparam sd_nor = 3'b011;
    localparam sd_xor = 3'b100;
    localparam sd_xnor = 3'b101;
    localparam sd_NA = 3'b110;
    
    
    always @(*) begin
    case (word_selection)
        sd_and:  characters = {c_blank, c_A, c_N, c_D};
        sd_or:   characters = {c_blank, c_blank, c_O, c_R};
        sd_nand: characters = {c_N, c_A, c_N, c_D};
        sd_nor:  characters = {c_blank, c_N, c_O, c_R};
        sd_xor:  characters = {c_blank, c_X, c_O, c_R};
        sd_xnor: characters = {c_X, c_N, c_O, c_R};
        default: characters = {c_blank, c_blank, c_N, c_A};
    endcase
end

//display of letters
wire char0_CA;
wire char0_CB;
wire char0_CC;
wire char0_CD;
wire char0_CE;
wire char0_CF;
wire char0_CG;
char_decoder letter0 (
    .character(characters[2:0]),
    .CA(char0_CA),
    .CB(char0_CB),
    .CC(char0_CC),
    .CD(char0_CD),
    .CE(char0_CE),
    .CF(char0_CF),
    .CG(char0_CG)
    );
wire char1_CA;
wire char1_CB;
wire char1_CC;
wire char1_CD;
wire char1_CE;
wire char1_CF;
wire char1_CG;
char_decoder letter1 (
    .character(characters[5:3]),
    .CA(char1_CA),
    .CB(char1_CB),
    .CC(char1_CC),
    .CD(char1_CD),
    .CE(char1_CE),
    .CF(char1_CF),
    .CG(char1_CG)
    );

wire char2_CA;
wire char2_CB;
wire char2_CC;
wire char2_CD;
wire char2_CE;
wire char2_CF;
wire char2_CG;
char_decoder letter2 (
    .character(characters[8:6]),
    .CA(char2_CA),
    .CB(char2_CB),
    .CC(char2_CC),
    .CD(char2_CD),
    .CE(char2_CE),
    .CF(char2_CF),
    .CG(char2_CG)
    );

wire char3_CA;
wire char3_CB;
wire char3_CC;
wire char3_CD;
wire char3_CE;
wire char3_CF;
wire char3_CG;
char_decoder letter3 (
    .character(characters[11:9]),
    .CA(char3_CA),
    .CB(char3_CB),
    .CC(char3_CC),
    .CD(char3_CD),
    .CE(char3_CE),
    .CF(char3_CF),
    .CG(char3_CG)
    );

//counter for display
reg [19:0] refresh_counter = 0;
always @(posedge CLK100MHZ) begin
    refresh_counter <= refresh_counter + 1;
end
wire [1:0] digit_select = refresh_counter[19:18];
always @(*) begin
    case (digit_select)
        2'b00: AN = 8'b11111110;
        2'b01: AN = 8'b11111101;
        2'b10: AN = 8'b11111011;
        2'b11: AN = 8'b11110111;
        default: AN = 8'b11111111;
    endcase
end

always @(*) begin
    case(digit_select)
        2'b00: begin
            CA = char0_CA;
            CB = char0_CB;
            CC = char0_CC;
            CD = char0_CD;
            CE = char0_CE;
            CF = char0_CF;
            CG = char0_CG;
            end
        2'b01: begin
            CA = char1_CA;
            CB = char1_CB;
            CC = char1_CC;
            CD = char1_CD;
            CE = char1_CE;
            CF = char1_CF;
            CG = char1_CG;
            end
        2'b10: begin
            CA = char2_CA;
            CB = char2_CB;
            CC = char2_CC;
            CD = char2_CD;
            CE = char2_CE;
            CF = char2_CF;
            CG = char2_CG;
            end
        2'b11: begin
            CA = char3_CA;
            CB = char3_CB;
            CC = char3_CC;
            CD = char3_CD;
            CE = char3_CE;
            CF = char3_CF;
            CG = char3_CG;
            end
        default: begin
            CA = 1'b1;
            CB = 1'b1;
            CC = 1'b1;
            CD = 1'b1;
            CE = 1'b1;
            CF = 1'b1;
            CG = 1'b1;
        end
    endcase
end    
endmodule