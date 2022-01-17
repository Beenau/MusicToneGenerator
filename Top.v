`timescale 1ns / 1ps



module Top(input CLK,
           input sound, audioSel, btnU, btnD,
           input [2:0] song,
           input [7:0] sw,
           output audio, shutdown, gain,
           output [3:0] an,
           output [6:0] seg
           );
        
        wire audioNote, audioSong;
        wire [3:0] ones, tens, hund, thou;
        wire [3:0] noteOnes, noteTens, noteHund, noteThou;
        wire [3:0] songOnes, songTens, songHund, songThou;
        wire [3:0] noteKey;
        
        Test_ShutdownControl DUT0 (.CLK(CLK), .sound(sound), .shutdown(shutdown));
        Test_NoteControl DUT1 (.CLK(CLK), .sw(sw), .noteOnes(noteOnes), .noteTens(noteTens), .noteHund(noteHund), 
                                .noteThou(noteThou), .audioNote(audioNote));
        Test_SongControl DUT2 (.CLK(CLK), .song(song), .songOnes(songOnes), .songTens(songTens), .songHund(songHund), 
                                .songThou(songThou), .audioSong(audioSong));
        Test_AudioSelMux DUT3 (.CLK(CLK), .audioNote(audioNote), .audioSong(audioSong), .audioSel(audioSel), .audio(audio));
        Test_BCDControl DUT4 (.CLK(CLK), .ones(ones), .tens(tens), .hund(hund), .thou(thou), .noteKey(noteKey), .an(an));
        Test_SegmentDecoder DUT5 (.noteKey(noteKey), .seg(seg));
        Test_BCD_MUX DUT6 (.audioSel(audioSel),.noteOnes(noteOnes), .noteTens(noteTens), .noteHund(noteHund), 
                                .noteThou(noteThou), .songOnes(songOnes), .songTens(songTens), .songHund(songHund),
                                 .songThou(songThou), .ones(ones), .tens(tens), .hund(hund), .thou(thou));
        Test_GainControl DUT7 (.CLK(CLK), .btnU(btnU), .btnD(btnD), .gain(gain));

endmodule







