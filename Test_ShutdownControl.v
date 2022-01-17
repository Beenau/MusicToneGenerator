`timescale 1ns / 1ps



module Test_ShutdownControl(input CLK, sound,
                            output reg shutdown);
                            
       always@(posedge CLK) begin 
           if(sound)
                shutdown <= 1'b1;
           else
                shutdown <= 1'b0;
       end
endmodule
