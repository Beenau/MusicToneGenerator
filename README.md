# MusicToneGenerator
Implements a switch controlled tone generator on the Basys3 with Verilog.

# Block Diagram of System
![image](https://user-images.githubusercontent.com/73450165/149841784-b020c780-8ee4-4f37-b9ed-e1940bb26d20.png)

# Simulation Results

The following image displays the squarewaves which generate each of the notes.
![image](https://user-images.githubusercontent.com/73450165/149842231-07528e0c-09c0-4af7-8a5a-e2c431aa2c82.png)

# Top.v:
Connect all other modules together as well as handling the inputs and outputs from the devices.

# Test_NoteControl.v:
This is the synthesizer logic where each switch is assigned one note and can be played one at a time by the user.  All the note signals from the above waveform simulation are generated here.  The note generation logic is also used within the song control module. 

# Test_SongControl.v:
This is where my predetermined song is coded, this module uses a case statement to decide
what note is played and I decide in advance the order the notes will be played in by changing the case statements variable.  Just like in the NoteControl module I generate the waveforms for each note here, this means the same code appears in two places but eliminates the need for more modules which translate to more wire connections.

To move through the song logic I use a variable called note_position which increments when needed to play the next note.  In cases where I use loops to play an incrementing or decrementing range of notes the note position only updates at the end to move the song to the next note.

# Test_AudioSelMUX.v:
A simple MUX used to select which modules audio output to send to the audio pin of the Pmod Amp2.  The ‘audioSel’ is a switch which is controlled by the user.

# Test_BCD_MUX.v:
A simple MUX to determine which modules notes to display on the seven segment. The ‘audioSel’ is a switch which is controlled by the user.

# Test_BCDControl.v:
Using a case statement which updates at 200 times a second the BCD control will display different images on each of the seven segment displays anodes.  This logic is only slightly modified to use different variable names from the lab 6 digital clock assignment I submitted.

# Test_SegmentDecoder.v:
A case statement which is used to decode the 4-bit note value received into a 7-bit segment representation.

# Test_ShutdownControl.v:
A very simple check for the value of the shutdown switch to drive the Pmod Amp2 high or low.

# Test_GainControl.v:
Debounce of the buttons is handled inside this module rather than in a separate place because I only use the buttons here and it felt unnecessary to add another module just for this.  Two button input allows gain to be set to either 1 or 0.

# Hardware
This project is designed for use on basys3 hardware
![image](https://user-images.githubusercontent.com/73450165/149842713-76036381-a1c8-4a83-a4c9-5b4677305ea1.png)

The constraint file is provided by Digilent here:
https://github.com/Digilent/Basys3/blob/master/Resources/XDC/Basys3_Master.xdc

Purchase Link:
https://digilent.com/shop/basys-3-artix-7-fpga-trainer-board-recommended-for-introductory-users/
