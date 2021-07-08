
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name esercizio_09 -dir "C:/Users/Windows/Desktop/Progetto/esercizio_09/planAhead_run_2" -part xc7a100tcsg324-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/Windows/Desktop/Progetto/esercizio_09/display_on_board.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/Windows/Desktop/Progetto/esercizio_09} }
set_property target_constrs_file "Nexys4DDR-100T.ucf" [current_fileset -constrset]
add_files [list {Nexys4DDR-100T.ucf}] -fileset [get_property constrset [current_run]]
link_design
