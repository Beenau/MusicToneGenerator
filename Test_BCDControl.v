`timescale 1ns / 1ps


module Test_BCDControl(input CLK,
                       input[3:0] ones, tens, hund, thou,
                       output reg [3:0] noteKey,
                       output reg [3:0] an);
                       
       localparam KEY1 = 0, KEY2 = 1, KEY3 = 2, KEY4 = 3;
       
       parameter BAUD_TICK = 500_000; //200Hz clock divider
       reg [31:0] div_clk;
       
       reg [1:0] state = 2'b00;
       
       always@(posedge CLK) begin
        if(div_clk <= BAUD_TICK - 1) begin
            div_clk <= div_clk + 1;
        end
        else begin
        div_clk <= 0;
            case(state)
                KEY1: begin
                        noteKey <= ones;
                        an <= 4'b1110;
                        state <= KEY2;
                        end
                KEY2: begin
                        noteKey <= tens;
                        an <= 4'b1101;
                        state <= KEY3;
                        end
                KEY3: begin
                        noteKey <= hund;
                        an <= 4'b1011;
                        state <= KEY4;
                        end
                KEY4: begin
                        noteKey <= thou;
                        an <= 4'b0111;
                        state <= KEY1;
                        end
                endcase
           end
       end
       
endmodule
