# "GCLK"
set_property PACKAGE_PIN Y9 [get_ports I_CLK_REF]

create_clock -period 10.000 -name clk [get_ports I_CLK_REF]


set_property PACKAGE_PIN AA19 [get_ports O_HSYNC]
set_property PACKAGE_PIN Y19 [get_ports O_VSYNC]
set_property PACKAGE_PIN AB19 [get_ports {O_VIDEO_B[3]}]
set_property PACKAGE_PIN AB20 [get_ports {O_VIDEO_B[2]}]
set_property PACKAGE_PIN Y20 [get_ports {O_VIDEO_B[1]}]
set_property PACKAGE_PIN Y21 [get_ports {O_VIDEO_B[0]}]
set_property PACKAGE_PIN AB22 [get_ports {O_VIDEO_G[0]}]
set_property PACKAGE_PIN AA22 [get_ports {O_VIDEO_G[1]}]
set_property PACKAGE_PIN AB21 [get_ports {O_VIDEO_G[2]}]
set_property PACKAGE_PIN AA21 [get_ports {O_VIDEO_G[3]}]

set_property PACKAGE_PIN V20 [get_ports {O_VIDEO_R[0]}]
set_property PACKAGE_PIN U20 [get_ports {O_VIDEO_R[1]}]
set_property PACKAGE_PIN V19 [get_ports {O_VIDEO_R[2]}]
set_property PACKAGE_PIN V18 [get_ports {O_VIDEO_R[3]}]

# oben
set_property PACKAGE_PIN T18 [get_ports {I_BUTTON[0]}]

# unten
set_property PACKAGE_PIN R16 [get_ports {I_BUTTON[1]}]

# links
set_property PACKAGE_PIN N15 [get_ports {I_BUTTON[2]}]

# rechts
set_property PACKAGE_PIN R18 [get_ports {I_BUTTON[3]}]

# DAC Out to Line out - 3.3k +4.7nF Tiefpass erford.
set_property PACKAGE_PIN AA11 [get_ports O_AUDIO]
set_property DRIVE 16 [get_ports O_AUDIO]
set_property SLEW SLOW [get_ports O_AUDIO]

# Reset
set_property PACKAGE_PIN P16 [get_ports I_RESET]

# ----------------------------------------------------------------------------
# User LEDs - Bank 33  - 3.3V
# ----------------------------------------------------------------------------
set_property PACKAGE_PIN T22 [get_ports {O_LED[0]}]
set_property PACKAGE_PIN T21 [get_ports {O_LED[1]}]
set_property PACKAGE_PIN U22 [get_ports {O_LED[2]}]
set_property PACKAGE_PIN U21 [get_ports {O_LED[3]}]
#set_property PACKAGE_PIN V22 [get_ports {LD4}];  # "LD4"
#set_property PACKAGE_PIN W22 [get_ports {LD5}];  # "LD5"
#set_property PACKAGE_PIN U19 [get_ports {O_AUDIO}];  # "LD6"


# ----------------------------------------------------------------------------
# User DIP Switches - Bank 35
# ----------------------------------------------------------------------------
set_property PACKAGE_PIN F22 [get_ports {I_SW[0]}]
set_property PACKAGE_PIN G22 [get_ports {I_SW[1]}]
set_property PACKAGE_PIN H22 [get_ports {I_SW[2]}]
set_property PACKAGE_PIN F21 [get_ports {I_SW[3]}]

# Note that the bank voltage for IO Bank 33 is fixed to 3.3V on ZedBoard.
set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 33]]

# Set the bank voltage for IO Bank 34 to 1.8V by default.
# set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 34]];
# set_property IOSTANDARD LVCMOS25 [get_ports -of_objects [get_iobanks 34]];
set_property IOSTANDARD LVCMOS18 [get_ports -of_objects [get_iobanks 34]]

# Set the bank voltage for IO Bank 35 to 1.8V by default.
# set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 35]];
# set_property IOSTANDARD LVCMOS25 [get_ports -of_objects [get_iobanks 35]];
set_property IOSTANDARD LVCMOS18 [get_ports -of_objects [get_iobanks 35]]

# Note that the bank voltage for IO Bank 13 is fixed to 3.3V on ZedBoard.
set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 13]]






set_property CLKFBOUT_MULT_F 8 [get_cells u_clocks/dcma.dcm_inst]
