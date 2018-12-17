
################################################################
# This is a generated script based on design: design_1
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2018.2
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source design_1_script.tcl


# The design that will be created by this Tcl script contains the following 
# module references:
# PACMAN

# Please add the sources of those modules before sourcing this Tcl script.

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7a35ticsg324-1L
   set_property BOARD_PART digilentinc.com:arty:part0:1.1 [current_project]
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name design_1

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

  # Add USER_COMMENTS on $design_name
  set_property USER_COMMENTS.comment_0 "Blue Clk Heartbeat" [get_bd_designs $design_name]
  set_property USER_COMMENTS.comment_1 "Red VS Heartbeat" [get_bd_designs $design_name]
  set_property USER_COMMENTS.comment_2 "Green HS Heartbeat" [get_bd_designs $design_name]

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}

set bCheckIPsPassed 1
##################################################################
# CHECK IPs
##################################################################
set bCheckIPs 1
if { $bCheckIPs == 1 } {
   set list_check_ips "\ 
xilinx.com:ip:c_counter_binary:12.0\
xilinx.com:ip:xlslice:1.0\
"

   set list_ips_missing ""
   common::send_msg_id "BD_TCL-006" "INFO" "Checking if the following IPs exist in the project's IP catalog: $list_check_ips ."

   foreach ip_vlnv $list_check_ips {
      set ip_obj [get_ipdefs -all $ip_vlnv]
      if { $ip_obj eq "" } {
         lappend list_ips_missing $ip_vlnv
      }
   }

   if { $list_ips_missing ne "" } {
      catch {common::send_msg_id "BD_TCL-115" "ERROR" "The following IPs are not found in the IP Catalog:\n  $list_ips_missing\n\nResolution: Please add the repository containing the IP(s) to the project." }
      set bCheckIPsPassed 0
   }

}

##################################################################
# CHECK Modules
##################################################################
set bCheckModules 1
if { $bCheckModules == 1 } {
   set list_check_mods "\ 
PACMAN\
"

   set list_mods_missing ""
   common::send_msg_id "BD_TCL-006" "INFO" "Checking if the following modules exist in the project's sources: $list_check_mods ."

   foreach mod_vlnv $list_check_mods {
      if { [can_resolve_reference $mod_vlnv] == 0 } {
         lappend list_mods_missing $mod_vlnv
      }
   }

   if { $list_mods_missing ne "" } {
      catch {common::send_msg_id "BD_TCL-115" "ERROR" "The following module(s) are not found in the project: $list_mods_missing" }
      common::send_msg_id "BD_TCL-008" "INFO" "Please add source files for the missing module(s) above."
      set bCheckIPsPassed 0
   }
}

if { $bCheckIPsPassed != 1 } {
  common::send_msg_id "BD_TCL-1003" "WARNING" "Will not continue with creation of design due to the error(s) above."
  return 3
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports

  # Create ports
  set HB_CLK [ create_bd_port -dir O -from 0 -to 0 HB_CLK ]
  set HB_HSync [ create_bd_port -dir O -from 0 -to 0 HB_HSync ]
  set HB_Vsync [ create_bd_port -dir O -from 0 -to 0 HB_Vsync ]
  set I_BUTTON_0 [ create_bd_port -dir I -from 3 -to 0 I_BUTTON_0 ]
  set I_CLK_REF_0 [ create_bd_port -dir I I_CLK_REF_0 ]
  set I_RESET_0 [ create_bd_port -dir I -type rst I_RESET_0 ]
  set I_SW_0 [ create_bd_port -dir I -from 3 -to 0 I_SW_0 ]
  set O_AUDIO_0 [ create_bd_port -dir O O_AUDIO_0 ]
  set O_HSYNC [ create_bd_port -dir O O_HSYNC ]
  set O_LED_0 [ create_bd_port -dir O -from 3 -to 0 O_LED_0 ]
  set O_VIDEO_B_0 [ create_bd_port -dir O -from 3 -to 0 O_VIDEO_B_0 ]
  set O_VIDEO_G_0 [ create_bd_port -dir O -from 3 -to 0 O_VIDEO_G_0 ]
  set O_VIDEO_R_0 [ create_bd_port -dir O -from 3 -to 0 O_VIDEO_R_0 ]
  set O_VSYNC [ create_bd_port -dir O O_VSYNC ]

  # Create instance: HB_CLK25, and set properties
  set HB_CLK25 [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_counter_binary:12.0 HB_CLK25 ]
  set_property -dict [ list \
   CONFIG.Implementation {DSP48} \
   CONFIG.Output_Width {23} \
 ] $HB_CLK25

  # Create instance: HB_Hsync, and set properties
  set HB_Hsync [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_counter_binary:12.0 HB_Hsync ]
  set_property -dict [ list \
   CONFIG.Implementation {DSP48} \
   CONFIG.Output_Width {14} \
 ] $HB_Hsync

  # Create instance: HB_Vsync, and set properties
  set HB_Vsync [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_counter_binary:12.0 HB_Vsync ]
  set_property -dict [ list \
   CONFIG.Implementation {Fabric} \
   CONFIG.Output_Width {5} \
 ] $HB_Vsync

  # Create instance: PACMAN_0, and set properties
  set block_name PACMAN
  set block_cell_name PACMAN_0
  if { [catch {set PACMAN_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $PACMAN_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: xlslice_0, and set properties
  set xlslice_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_0 ]
  set_property -dict [ list \
   CONFIG.DIN_FROM {13} \
   CONFIG.DIN_TO {13} \
   CONFIG.DIN_WIDTH {14} \
   CONFIG.DOUT_WIDTH {1} \
 ] $xlslice_0

  # Create instance: xlslice_1, and set properties
  set xlslice_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_1 ]
  set_property -dict [ list \
   CONFIG.DIN_FROM {4} \
   CONFIG.DIN_TO {4} \
   CONFIG.DIN_WIDTH {5} \
   CONFIG.DOUT_WIDTH {1} \
 ] $xlslice_1

  # Create instance: xlslice_2, and set properties
  set xlslice_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_2 ]
  set_property -dict [ list \
   CONFIG.DIN_FROM {22} \
   CONFIG.DIN_TO {22} \
   CONFIG.DIN_WIDTH {23} \
   CONFIG.DOUT_WIDTH {1} \
 ] $xlslice_2

  # Create port connections
  connect_bd_net -net HB_CLK25_Q [get_bd_pins HB_CLK25/Q] [get_bd_pins xlslice_2/Din]
  connect_bd_net -net HB_Hsync_Q [get_bd_pins HB_Hsync/Q] [get_bd_pins xlslice_0/Din]
  connect_bd_net -net HB_Vsync_Q [get_bd_pins HB_Vsync/Q] [get_bd_pins xlslice_1/Din]
  connect_bd_net -net I_BUTTON_0_1 [get_bd_ports I_BUTTON_0] [get_bd_pins PACMAN_0/I_BUTTON]
  connect_bd_net -net I_CLK_REF_0_1 [get_bd_ports I_CLK_REF_0] [get_bd_pins PACMAN_0/I_CLK_REF]
  connect_bd_net -net I_RESET_0_1 [get_bd_ports I_RESET_0] [get_bd_pins PACMAN_0/I_RESET]
  connect_bd_net -net I_SW_0_1 [get_bd_ports I_SW_0] [get_bd_pins PACMAN_0/I_SW]
  connect_bd_net -net PACMAN_0_O_AUDIO [get_bd_ports O_AUDIO_0] [get_bd_pins PACMAN_0/O_AUDIO]
  connect_bd_net -net PACMAN_0_O_CLK_25 [get_bd_pins HB_CLK25/CLK] [get_bd_pins PACMAN_0/O_CLK_25]
  connect_bd_net -net PACMAN_0_O_HSYNC [get_bd_ports O_HSYNC] [get_bd_pins HB_Hsync/CLK] [get_bd_pins PACMAN_0/O_HSYNC]
  connect_bd_net -net PACMAN_0_O_LED [get_bd_ports O_LED_0] [get_bd_pins PACMAN_0/O_LED]
  connect_bd_net -net PACMAN_0_O_VIDEO_B [get_bd_ports O_VIDEO_B_0] [get_bd_pins PACMAN_0/O_VIDEO_B]
  connect_bd_net -net PACMAN_0_O_VIDEO_G [get_bd_ports O_VIDEO_G_0] [get_bd_pins PACMAN_0/O_VIDEO_G]
  connect_bd_net -net PACMAN_0_O_VIDEO_R [get_bd_ports O_VIDEO_R_0] [get_bd_pins PACMAN_0/O_VIDEO_R]
  connect_bd_net -net PACMAN_0_O_VSYNC [get_bd_ports O_VSYNC] [get_bd_pins HB_Vsync/CLK] [get_bd_pins PACMAN_0/O_VSYNC]
  connect_bd_net -net xlslice_0_Dout [get_bd_ports HB_HSync] [get_bd_pins xlslice_0/Dout]
  connect_bd_net -net xlslice_1_Dout [get_bd_ports HB_Vsync] [get_bd_pins xlslice_1/Dout]
  connect_bd_net -net xlslice_2_Dout [get_bd_ports HB_CLK] [get_bd_pins xlslice_2/Dout]

  # Create address segments


  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


