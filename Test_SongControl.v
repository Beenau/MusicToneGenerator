`timescale 1ns / 1ps


module Test_SongControl(input CLK,
                        input [2:0] song,
                        output reg [3:0] songOnes, songTens, songHund, songThou,
                        output reg audioSong
                        );
                        
      parameter QUARTER_NOTE = 25_000_000; //1 second
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
      reg [9:0] note_position = 0;
      reg [31:0] note_time = 0;
     
         
      always@(posedge CLK) begin     
      //songs
      if(song == 3'b001) begin
         if(note_time < QUARTER_NOTE - 1) begin
                note_time <= note_time + 1;       
            end
          else begin
                note_time <= 0;

                if(note_position == 0) begin
                    if(play_note > 0)
                        play_note <= play_note - 1;
                    else begin
                        play_note <= 7;
                        note_position <= 0;
                    end   
                end   
                if(note_position > 0)
                    note_position <= 0;            
            end //end if songOne
          end
         //song 2
         else if(song == 3'b010) begin
            if(note_time < QUARTER_NOTE*2 - 1) begin
                note_time <= note_time + 1;       
            end
            else begin 
                note_time <= 0;
                if(note_position == 0) begin
                    play_note <= 6;
                    note_position <= note_position + 1;
                end
                if(note_position == 1) begin
                    play_note <= 5;
                    note_position <= note_position + 1;                   
                end    
                if(note_position == 2) begin
                    play_note <= 6;
                    note_position <= note_position + 1;
                end
                if(note_position == 3) begin
                    play_note <= 5;
                    note_position <= note_position + 1;
                end   
                if(note_position == 4) begin
                    play_note <= 7;
                    note_position <= note_position + 1;
                end
                if(note_position == 5) begin
                    play_note <= 6;
                    note_position <= note_position + 1;
                end
                if(note_position == 6) begin
                    play_note <= 5;
                    note_position <= note_position + 1;
                end
                if(note_position == 7) begin
                    play_note <= 6;
                    note_position <= note_position + 1;
                end
                if(note_position == 8) begin
                    play_note <= 5;
                    note_position <= note_position + 1;
                end
                if(note_position == 9) begin
                    play_note <= 4;
                    note_position <= 0;
                end
         end ///end song two
         end
            
         //song 3
         else if(song == 3'b100) begin
             if(note_time < QUARTER_NOTE*4 - 1) begin
                    note_time <= note_time + 1;       
                end
              else begin
                    note_time <= 0;
                    if(note_position == 0) begin
                        if(play_note < 7)
                            play_note <= play_note + 1;
                        else begin
                            play_note <= 0;
                            note_position <= 0;
                        end   
                    end
            end //end song 3
         end
         
         else begin
            play_note <= 8;
            note_position <= 0;
         end
         
          case(play_note)
            4'h0: begin
                    if(phase < A_HIGH_NOTE-1) begin
                        phase <= phase + 1;
                        audioSong <= phase[17];
                        songOnes <= 8; //I
                        songTens <= 5; //H
                        songHund <= 7; //off
                        songThou <= 0; //A
                     end
                    else
                        phase <= 0; 
             end  
             4'h1: begin
                    if(phase < E_HIGH_NOTE-1) begin
                        phase <= phase + 1;
                        audioSong <= phase[17];
                        songOnes <= 8; //I
                        songTens <= 5; //H
                        songHund <= 7; //off
                        songThou <= 1; //E
                     end
                    else
                        phase <= 0; 
                end    
              4'h2: begin
                    if(phase < B_NOTE-1) begin
                        phase <= phase + 1;
                        audioSong <= phase[18];
                        songOnes <= 7; //off
                        songTens <= 7; //off
                        songHund <= 7; //off
                        songThou <= 2; //B
                     end
                    else
                        phase <= 0; 
                end   
              4'h3: begin 
                    if(phase < G_NOTE-1) begin
                        phase <= phase + 1;
                        audioSong <= phase[18];
                        songOnes <= 7; //off
                        songTens <= 7; //off
                        songHund <= 7; //off
                        songThou <= 3; //g
                     end
                    else
                        phase <= 0; 
                end  
              4'h4: begin
                    if(phase < D_NOTE-1) begin
                        phase <= phase + 1;
                        audioSong <= phase[19];
                        songOnes <= 7; //off
                        songTens <= 7; //off
                        songHund <= 7; //off
                        songThou <= 4; //d
                     end
                    else
                        phase <= 0; 
                end  
              4'h5: begin
                    if(phase < A_NOTE-1) begin
                        phase <= phase + 1;
                        audioSong <= phase[19];
                        songOnes <= 7; //off
                        songTens <= 7; //off
                        songHund <= 7; //off
                        songThou <= 0; //A
                     end
                    else
                        phase <= 0; 
                end  
              4'h6: begin
                    if(phase < E_LOW_NOTE-1) begin
                        phase <= phase + 1;
                        audioSong <= phase[20];
                        songOnes <= 9; //O
                        songTens <= 6; //L
                        songHund <= 7; //off
                        songThou <= 1; //E
                     end
                    else
                        phase <= 0; 
                end  
              4'h7: begin
                    if(phase < B_LOW_NOTE-1) begin
                        phase <= phase + 1;
                        audioSong <= phase[20];
                        songOnes <= 9; //O
                        songTens <= 6; //L
                        songHund <= 7; //off
                        songThou <= 2; //B
                     end
                    else
                        phase <= 0; 
                end  
              default: begin
                    phase <= 0;
                    audioSong <= 0;
                    songOnes <= 7; //off
                    songTens <= 7; //off
                    songHund <= 7; //off
                    songThou <= 7; //off
                end
          endcase //endcase play_note

     end
endmodule
