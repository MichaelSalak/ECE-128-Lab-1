`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/04/2025 01:41:35 PM
// Design Name: 
// Module Name: mux8x1_tb
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


module mux8x1_tb;
    reg [7:0] I;
    reg [2:0] S;
    wire Y;
    DFmux8x1 mux(I,S,Y);
    
    initial begin
        I = 8'b10011101; //test value
        S = 3'b000;
        #10 S = 3'b001;
        #10 S = 3'b010;
        #10 S = 3'b011;
        #10 S = 3'b100;
        #10 S = 3'b101;
        #10 S = 3'b110;
        #10 S = 3'b111;
        
        #10 $stop;
    end
endmodule
