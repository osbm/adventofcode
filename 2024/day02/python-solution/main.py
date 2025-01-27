
input_file = open("../input", "r").read().split("\n")

# print(input_file)

num_safe_reports_part_1 = 0
num_safe_reports_part_2 = 0
def is_safe(numbers):
    is_increasing = numbers[0] < numbers[-1]
    for i in range(len(numbers)-1):
        diff = numbers[i+1] - numbers[i]
        if not (0 < abs(diff) < 4):
            return False
        if is_increasing:
            if diff < 0:
                return False
        else:
            if diff > 0:
                return False
    return True

for line in input_file:
    line = line.split()
    # print(line)
    numbers = [int(x) for x in line]
    # print(numbers)
    if is_safe(numbers):
        # print(numbers)
        num_safe_reports_part_1 += 1
        num_safe_reports_part_2 += 1
    else:
        # check every subset when we remove one element
        for i in range(len(numbers)):
            if is_safe(numbers[:i] + numbers[i+1:]):
                # print(numbers)
                num_safe_reports_part_2 += 1
                break

print('Part 1 solution:', num_safe_reports_part_1)
print('Part 2 solution:', num_safe_reports_part_2)