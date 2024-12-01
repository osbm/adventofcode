file_contens = open("../input").read().strip()

lines = file_contens.split("\n")

numbers = [x.split('   ') for x in lines]

column_1 = [x[0] for x in numbers]
column_2 = [x[1] for x in numbers]

column_1 = [int(x) for x in column_1]
column_2 = [int(x) for x in column_2]

column_1.sort()
column_2.sort()

total = [abs(x - y) for x, y in zip(column_1, column_2)]
total = sum(total)

print('part1:',total)

# part 2
score = 0
for num in column_1:
    for num2 in column_2:
        if num == num2:
            score += num

print('part2:',score)