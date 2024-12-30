# Single-Port and Dual-Port RAM in Verilog
.*This repository contains Verilog implementations of Single-Port RAM and Dual-Port RAM with parameterizable memory depth and word width. Both modules support synchronous read and write operations controlled by a clock signal.*
 # 1. Single-Port RAM
## Features
Parameterizable Memory: Configurable depth and word width.
Synchronous Operations: Read/Write controlled by a clock signal.
Single-Port Access: Supports either read or write operation at a time.
## Sample Output (Single-Port RAM):
. *mathematica*
Copy code
--- Starting Write Operations ---
Write: Addr = 1, Data = A5
Write: Addr = 2, Data = 5A

--- Starting Read Operations ---
Read: Addr = 1, Data = A5
Read: Addr = 2, Data = 5A

--- Simulation Complete ---
# 2. Dual-Port RAM
 ## Features
Parameterizable Memory: Configurable depth and word width.
Dual-Port Access: Allows simultaneous read and write through two independent ports.
Synchronous Operations: Controlled by a shared clock signal.
## Sample Output (Dual-Port RAM):
. *Copy code*
--- Write Operations on Port A ---
Port A Write: Addr = 1, Data = A5
Port A Write: Addr = 2, Data = 5A

--- Simultaneous Write/Read Operations ---
Port B Write: Addr = 3, Data = 3C
Port B Read: Addr = 2, Data = 5A
Port A Read: Addr = 1, Data = A5

--- Final Reads ---
Port A Read: Addr = 2, Data = 5A
Port B Read: Addr = 3, Data = 3C

--- Simulation Complete ---
Customization Options
Change Word Width and Memory Depth:
## Author
. *[swati]([https://github.com/sw301])* 
(Trainee@Ramaiah Skill academy )



