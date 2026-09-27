L1 Cache Simulator - Run Instructions

Prerequisite:
- GCC must be installed and available in PATH.

Project structure:
- Source files: src\
- Header files: includes\
- Input traces: inputs\tests\
- Executable output: app\cache_sim.exe
- Output log file: outputs\output_traces.txt

How to run:
1. Open PowerShell or Command Prompt in the project folder.
2. Run the batch file:

   run.bat

This will:
- compile the project
- create app\cache_sim.exe
- run the default trace file

Default settings in run.bat:
- Trace file: inputs\tests\scenario_s2_rw_snoop_stepdump.txt
- Mode: 0

Run with a different mode:

   run.bat 1

Mode values:
- 0 = summary + cache dump output
- 1 = mode 0 + L2 communication logs

Run with a different mode and trace file:

   run.bat 1 inputs\tests\t01_data_read_miss_hit.txt

Useful examples:
- run.bat 0 inputs\tests\t10_full_opcode_smoke.txt
- run.bat 1 inputs\tests\scenario_s1_fill_set_stepdump.txt

Debug build:
- To enable debug compile mode, edit run.bat and set:

   set DEBUG=1

What gets generated:
- Executable: app\cache_sim.exe
- Logs appended to: outputs\output_traces.txt

