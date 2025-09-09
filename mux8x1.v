`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/03/2025 09:31:35 AM
// Design Name: 
// Module Name: mux8x1
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

//structural modelling
module Smux8x1(I,S,Y);
    input [7:0] I;
    input [2:0] S;
    output Y;
    
    wire [7:0] O;
    wire [2:0] Sn;
    not(Sn[0], S[0]);
    not(Sn[1], S[1]);
    not(Sn[2], S[2]);
    and(O[0], I[0], Sn[2], Sn[1], Sn[0]);
    and(O[1], I[1], Sn[2], Sn[1], S[0]);
    and(O[2], I[2], Sn[2], S[1], Sn[0]);
    and(O[3], I[3], Sn[2], S[1], S[0]);
    and(O[4], I[4], S[2], Sn[1], Sn[0]);
    and(O[5], I[5], S[2], Sn[1], S[0]);
    and(O[6], I[6], S[2], S[1], Sn[0]);
    and(O[7], I[7], S[2], S[1], S[0]);
    or(Y, O[0], O[1], O[2], O[3], O[4], O[5], O[6], O[7]);

endmodule


//behavioral modelling
module Bmux8x1(I,S,Y);
    input [7:0] I;
    input [2:0] S;
    output reg Y;
    
    always @(I or S) begin
        case(S)
            3'b000 : Y = I[0];
            3'b001 : Y = I[1];
            3'b010 : Y = I[2];
            3'b011 : Y = I[3];
            3'b100 : Y = I[4];
            3'b101 : Y = I[5];
            3'b110 : Y = I[6];
            3'b111 : Y = I[7];
            default : Y = 1'bx;
        endcase
    end
    
endmodule


//dataflow modelling
module DFmux8x1(I,S,Y);
    input [7:0] I;
    input [2:0] S;
    output Y;
    
    assign Y = (I[0] & ~S[2] & ~S[1] & ~S[0]) | 
               (I[1] & ~S[2] & ~S[1] & S[0]) | 
               (I[2] & ~S[2] & S[1] & ~S[0]) | 
               (I[3] & ~S[2] & S[1] & S[0]) | 
               (I[4] & S[2] & ~S[1] & ~S[0]) | 
               (I[5] & S[2] & ~S[1] & S[0]) | 
               (I[6] & S[2] & S[1] & ~S[0]) | 
               (I[7] & S[2] & S[1] & S[0]);

endmodule
