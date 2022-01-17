`timescale 1ns / 1ps



module Test_SegmentDecoder(input [3:0] noteKey,
                            output reg [6:0] seg);
                            
                            
       always@(noteKey) begin
       
            case(noteKey) 
                               //7'bGFEDCBA
                4'b0000  : seg = 7'b0001000; //A
                4'b0001  : seg = 7'b0000110; //E
                4'b0010  : seg = 7'b0000011; //b
                4'b0011  : seg = 7'b0010000; //g
                4'b0100  : seg = 7'b0100001; //d
                4'b0101  : seg = 7'b0001001; //H
                4'b0110  : seg = 7'b1000111; //L
                4'b0111  : seg = 7'b1111111; //all off
                4'b1000  : seg = 7'b1111001; //I
                4'b1001  : seg = 7'b1000000; //O

                default  : seg = 7'b1111111;
            endcase
       
       end
           
endmodule
