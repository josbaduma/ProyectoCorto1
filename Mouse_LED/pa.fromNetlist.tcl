
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name Mouse_LED -dir "C:/Users/joseb/Documents/GitHub/Taller-Digital/Mouse_LED/planAhead_run_2" -part xc6slx16csg324-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/joseb/Documents/GitHub/Taller-Digital/Mouse_LED/mouse_led.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/joseb/Documents/GitHub/Taller-Digital/Mouse_LED} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "mouse_led.ucf" [current_fileset -constrset]
add_files [list {mouse_led.ucf}] -fileset [get_property constrset [current_run]]
link_design
