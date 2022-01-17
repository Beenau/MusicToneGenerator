`timescale 1ns / 1ps



module Test_WaveForms(input CLK,
                      output reg A_high, E_high, B, G, D, A, E_low, B_low);
                      
      parameter A_HIGH_NOTE = 227_273; //440Hz frequency
      parameter E_HIGH_NOTE = 303_373; //330Hz
      parameter B_NOTE = 404_954; //246Hz
      parameter G_NOTE = 510_210; //196Hz
      parameter D_NOTE = 681_049; //147Hz
      parameter A_NOTE = 909_091; //110Hz
      parameter E_LOW_NOTE = 1_213_490; //82Hz
      parameter B_LOW_NOTE = 1_619_820;  //62Hz 
      
            
      reg [31:0] phaseAhigh = 0;
      reg [31:0] phaseEhigh = 0;
      reg [31:0] phaseB = 0;
      reg [31:0] phaseG = 0;
      reg [31:0] phaseD = 0;
      reg [31:0] phaseA = 0;
      reg [31:0] phaseElow = 0;
      reg [31:0] phaseBlow = 0;
            
      always@(posedge CLK) begin
        if(phaseAhigh < A_HIGH_NOTE) begin
            phaseAhigh <= phaseAhigh + 1;
            A_high <= phaseAhigh[17];
         end
        else
            phaseAhigh <= 0;
        
        if(phaseEhigh < E_HIGH_NOTE) begin
            phaseEhigh <= phaseEhigh + 1;
            E_high <= phaseEhigh[17];
         end
        else
            phaseEhigh <= 0;
                
        if(phaseB < B_NOTE) begin
            phaseB <= phaseB + 1;
            B <= phaseB[18];
         end
        else
            phaseB <= 0;
            
        if(phaseG < G_NOTE) begin
            phaseG <= phaseG + 1;
            G <= phaseG[18];
         end
        else
            phaseG <= 0;
        
        if(phaseD < D_NOTE) begin
            phaseD <= phaseD + 1;
            D <= phaseD[19];
         end
        else
            phaseD <= 0;
        
        if(phaseA < A_NOTE) begin
            phaseA <= phaseA + 1;
            A <= phaseA[19];
         end
        else
            phaseA <= 0;
        
        if(phaseElow < E_LOW_NOTE) begin
            phaseElow <= phaseElow + 1;
            E_low <= phaseElow[20];
         end
        else
            phaseElow <= 0;
        
        if(phaseBlow < B_LOW_NOTE) begin
            phaseBlow <= phaseBlow + 1;
            B_low <= phaseBlow[20];
         end
        else
            phaseBlow <= 0;
       
       end
        
        
endmodule
