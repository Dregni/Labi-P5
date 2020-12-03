import sys
import random

if len(sys.argv) < 2:
    print("Error : no filename argument.")
    exit(1)

def place(c):
    done = False
    while not done:
        pos = [random.randint(0, int(size[0]) - 1), random.randint(0, int(size[1]) - 1)]
        if map[pos[0]][pos[1]] == 'x':
            map[int(pos[0])][int(pos[1])] = c
            done = True

size = [20, 20]

if len(sys.argv) == 3:
    size = [sys.argv[2], sys.argv[2]]
elif len(sys.argv) == 4:
    size = [sys.argv[2], sys.argv[3]]

filename = sys.argv[1] + ".txt"
file = open(filename, "w+")
file.write('M' + str(size[0]) + ' ' + str(size[1]) + '\n')

map = [['x' for i in range(int(size[1]))] for j in range(int(size[0]))]

for i in range(int(int(size[0]) * int(size[1]) / 1.5)):
    place('-')
place('o')
place('f')

for line in map:
    for c in line:
        file.write(c)
    file.write('\n')