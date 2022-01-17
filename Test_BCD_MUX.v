`timescale 1ns / 1ps


module Test_BCD_MUX(input audioSel,
                    input [3:0] noteOnes, noteTens, noteHund, noteThou,
                    input[3:0] songOnes, songTens, songHund, songThou,
                    output reg [3:0] ones, tens, hund, thou
                    );
                    
       always@* begin
            if(!audioSel) begin
                ones <= songOnes;
                tens <= songTens;
                hund <= songHund;
                thou <= songThou;
            end
            else begin
                ones <= noteOnes;
                tens <= noteTens;
                hund <= noteHund;
                thou <= noteThou;
            end
       end
endmodule
