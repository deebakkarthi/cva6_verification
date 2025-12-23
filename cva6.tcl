# Clear previous run
clear -all

# Analyze RTL files
analyze -sv -f ./Flist.cva6
#-bbox_m aes

# Elaborate
elaborate -top cva6

# Initialization
# Clock specification
# clock pin is called "clk_i"
# duty cycle is 1:1 by default
clock clk_i

# Define reset condition
# reset pin is called rst_ni, active low
reset !rst_ni

get_design_info

# Start the verification
prove -all 

# Generate report
report -summary -results -file cva6.txt -force
