# spacecraft-dynamics-proj
Course Project for AEM 4305 Spacecraft Attitude and Dynamics. End goal is to develop a complete numerical simulation of the orbital and attitude dynamics of a spacecraft, including an attitude determination and control system. 

# Structure
`deliverables/` contains the scripts used to generate the results requested for each part of the project.

`simulation/` contains the main simulation code:
- `output/` is where simulation `.mat` files are dumped
- `utils/` contains useful utility functions
    - `const_struct.m` contains common values used throughout the project
- `run_simulation.m` is the main entry point of the simulation

# Usage
Modify the initial conditions or other parameters in `run_simulation.m` and run. Additional changes to the constants in `utils/const_struct.m` will further tune the simulation.