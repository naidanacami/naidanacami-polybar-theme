import subprocess

def checktemp():
    subprocess.call("redshift -p > tmp", shell=True)
    f = open("tmp", "r")
    comp_temp = ""
    for line in f:
        found = int(line.find("Color temperature"))
        comp_temp = line*(found+1)+comp_temp
        # print(found)

    comp_temp_list = comp_temp.split()
    temp = comp_temp_list[2].strip("K")
    print(temp)
    return(temp)

if __name__ == "__main__":
    checktemp()