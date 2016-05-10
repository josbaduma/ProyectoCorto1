
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name Mouse_LED -dir "C:/Users/joseb/Documents/GitHub/Taller-Digital/Mouse_LED/planAhead_run_4" -part xc6slx16csg324-3
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "mouse_led.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {ps2_tx.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {ps2_rx.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {ps2_rxtx.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {mouse_unit.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {freq_conversor_mouse.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {mouse_led.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top mouse_led $srcset
add_files [list {mouse_led.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc6slx16csg324-3
