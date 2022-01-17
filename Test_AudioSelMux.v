`timescale 1ns / 1ps


module Test_AudioSelMux(input CLK,
                        input audioNote, 
                        input audioSong,
                        input audioSel,
                        output reg audio
                        );
                        
       always@(posedge CLK) begin
            if(audioSel) audio <= audioNote;
            else audio <= audio <= audioSong;
      end
endmodule
