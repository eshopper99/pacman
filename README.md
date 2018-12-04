# pacman
VHDL Representation of original 1980 retro video game classic
Modication of VHDL code originally targetting a Spartan3 board
Changed to run on more recent low cost FPGA Board ARTY7A35T available from AVNET EBV oder Digilent
The design centers around a "T80" processor core from opencores.org - the T80 is an 8bit processor with generic parameters to run in 
either "Z80" Zilog compatible mode or in "8080" Intel mode.
Note that for license reasons the original ROM code is not provided here
The source coude does include ROM code which represents a public domain "Pong" game on the same hardware platform
Users will have to obtain the ROM code seperately an initialise the BRAM blocks in the design
