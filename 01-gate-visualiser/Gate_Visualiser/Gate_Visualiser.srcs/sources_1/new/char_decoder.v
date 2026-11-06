`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Student
// Engineer: Edward Cotter
// 
// Create Date: 06.11.2026 19:27:18
// Design Name: 
// Module Name: char_decoder
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


module char_decoder(
    input wire [2:0] character,
    output reg CA,
    output reg CB,
    output reg CC,
    output reg CD,
    output reg CE,
    output reg CF,
    output reg CG
    );
    localparam c_blank = 3'b000;
    localparam c_A = 3'b001;
    localparam c_N = 3'b010;
    localparam c_D = 3'b011;
    localparam c_O = 3'b100;
    localparam c_R = 3'b101;
    localparam c_X = 3'b110;
    
    always @(*) begin
        case(character)
            c_blank: begin
                CA = 1'b1;
                CB = 1'b1;
                CC = 1'b1;
                CD = 1'b1;
                CE = 1'b1;
                CF = 1'b1;
                CG = 1'b1;
            end
            c_A: begin
                CA = 1'b0;
                CB = 1'b0;
                CC = 1'b0;
                CD = 1'b1;
                CE = 1'b0;
                CF = 1'b0;
                CG = 1'b0;
            end
            c_N: begin
                CA = 1'b1;
                CB = 1'b1;
                CC = 1'b0;
                CD = 1'b1;
                CE = 1'b0;
                CF = 1'b1;
                CG = 1'b0;
            end
            c_D: begin
                CA = 1'b1;
                CB = 1'b0;
                CC = 1'b0;
                CD = 1'b0;
                CE = 1'b0;
                CF = 1'b1;
                CG = 1'b0;
            end
            c_O: begin
                CA = 1'b0;
                CB = 1'b0;
                CC = 1'b0;
                CD = 1'b0;
                CE = 1'b0;
                CF = 1'b0;
                CG = 1'b1;
            end
            c_R: begin
                CA = 1'b1;
                CB = 1'b1;
                CC = 1'b1;
                CD = 1'b1;
                CE = 1'b0;
                CF = 1'b1;
                CG = 1'b0;
            end
            c_X: begin
                CA = 1'b1;
                CB = 1'b0;
                CC = 1'b0;
                CD = 1'b1;
                CE = 1'b0;
                CF = 1'b0;
                CG = 1'b0;
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
