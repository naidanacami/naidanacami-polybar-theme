# from checktemp import checktemp
import sys, time, math, os

# Functions
# Up
def fadeup(curt, tart, interval, step):
    for n in range(int(abs(curt-tart)/step)+1):
        temp = curt-step*n
        os.system(f"redshift -P -O {temp}")
        print(temp)
        time.sleep(interval)


# Down
def fadedown(curt, tart, interval, step):
    for n in range(int(abs(curt-tart)/step)+1):
        temp = curt+step*n
        os.system(f"redshift -P -O {temp}")
        print(temp)
        time.sleep(interval)


# Code
current_temp = int(sys.argv[1])
target_temp = int(sys.argv[2])
interval = 0.2
step = 100

if current_temp-target_temp>0:
    fadeup(current_temp, target_temp, interval, step)
else:
    fadedown(current_temp, target_temp, interval, step)
