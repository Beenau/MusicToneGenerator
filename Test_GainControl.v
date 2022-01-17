`timescale 1ns / 1ps



module Test_GainControl(input CLK, btnU, btnD,
                          output reg gain);
       
        

       parameter DEBOUNCE = 12_500_000;
       
       reg [31:0] count = 0;            
       always@(posedge CLK) begin
            if(count < DEBOUNCE - 1)
                count <= count + 1;
            else begin
                count <= 0;
                
                if(btnU)
                    gain <= 1;
                if(btnD)
                    gain <= 0;
             end

       end
       
endmodule
