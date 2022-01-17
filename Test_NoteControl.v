`timescale 1ns / 1ps


module Test_NoteControl(input CLK,
                        input [7:0] sw,
                        output reg [3:0] noteOnes, noteTens, noteHund, noteThou,
                        output reg audioNote
                        );
  
      parameter QUARTER_NOTE = 25_000_000; //1 secon3
      parameter A_HIGH_NOTE = 227_273; //440Hz frequency
      parameter E_HIGH_NOTE = 303_373; //330Hz
      parameter B_NOTE = 404_954; //246Hz
      parameter G_NOTE = 510_210; //196Hz
      parameter D_NOTE = 681_049; //147Hz
      parameter A_NOTE = 909_091; //110Hz
      parameter E_LOW_NOTE = 1_213_490; //82Hz
      parameter B_LOW_NOTE = 1_619_820;  //62Hz 
      
      reg [31:0] phase = 0;
      reg [3:0] play_note = 0;
      reg [31:0] note_position = 0;
      reg [31:0] note_time = 0;
     
      
      always@(posedge CLK) begin  
            
      case(sw)
      8'h01: begin
        if(phase < A_HIGH_NOTE-1) begin
            phase <= phase + 1;
            audioNote <= phase[17];
            noteOnes <= 8; //I
            noteTens <= 5; //H
            noteHund <= 7; //off
            noteThou <= 0; //A
         end
        else
            phase <= 0; 
        end  
      8'h02: begin
        if(phase < E_HIGH_NOTE-1) begin
            phase <= phase + 1;
            audioNote <= phase[17];
            noteOnes <= 8; //I
            noteTens <= 5; //H
            noteHund <= 7; //off
            noteThou <= 1; //E
         end
        else
            phase <= 0; 
        end    
      8'h04: begin
        if(phase < B_NOTE-1) begin
            phase <= phase + 1;
            audioNote <= phase[18];
            noteOnes <= 7; //off
            noteTens <= 7; //off
            noteHund <= 7; //off
            noteThou <= 2; //b
         end
        else
            phase <= 0; 
        end   
      8'h08: begin 
        if(phase < G_NOTE-1) begin
            phase <= phase + 1;
            audioNote <= phase[18];
            noteOnes <= 7; //off
            noteTens <= 7; //off
            noteHund <= 7; //off
            noteThou <= 3; //g
         end
        else
            phase <= 0; 
        end  
      8'h10: begin
        if(phase < D_NOTE-1) begin
            phase <= phase + 1;
            audioNote <= phase[19];
            noteOnes <= 7; //off
            noteTens <= 7; //off
            noteHund <= 7; //off
            noteThou <= 4; //d
         end
        else
            phase <= 0; 
        end  
      8'h20: begin
        if(phase < A_NOTE-1) begin
            phase <= phase + 1;
            audioNote <= phase[19];
            noteOnes <= 7; //off
            noteTens <= 7; //off
            noteHund <= 7; //off
            noteThou <= 0; //A
         end
        else
            phase <= 0; 
        end  
      8'h40: begin
        if(phase < E_LOW_NOTE-1) begin
            phase <= phase + 1;
            audioNote <= phase[20];
            noteOnes <= 9; //O
            noteTens <= 6; //L
            noteHund <= 7; //off
            noteThou <= 1; //E
         end
        else
            phase <= 0; 
        end  
      8'h80: begin
        if(phase < B_LOW_NOTE-1) begin
            phase <= phase + 1;
            audioNote <= phase[20];
            noteOnes <= 9; //O
            noteTens <= 6; //L
            noteHund <= 7; //off
            noteThou <= 2; //b
         end
        else
            phase <= 0; 
        end  
        
      default: begin
        phase <= 0;
        audioNote <= 0;
        noteOnes <= 7; //off
        noteTens <= 7; //off
        noteHund <= 7; //off
        noteThou <= 7; //off
        end
      endcase
     end    

endmodule
