monkey_hash = {}
monkey = 0
to_monkeys = []

File.readlines("data.txt", chomp: true).each do |line|
    if line.include? "Monkey"
        to_monkeys = []
        split_line = line.split(" ")
        monkey = split_line[1].tr(":","").to_i
        monkey_hash[monkey] = []
    end

    if line.include? "Starting items"
        split_line = line.split(":")
        items = split_line[1].split(", ").map { |x| x.tr(" ", "").to_i }
        monkey_hash[monkey].push(items)
    end

    if line.include? "Operation"
        split_line = line.split(":")
        operation = split_line[1].lstrip()
        monkey_hash[monkey].push(operation)
    end

    if line.include? "Test"
        split_line = line.split(" ")
        test_amt = split_line[-1].to_i
        monkey_hash[monkey].push(test_amt)
    end

    if line.include? "If true:"
        split_line = line.split(" ")
        true_monkey = split_line[-1].to_i
        monkey_hash[monkey].push([true_monkey])
    end

    if line.include? "If false:"
        split_line = line.split(" ")
        false_monkey = split_line[-1].to_i
        monkey_hash[monkey][3].push(false_monkey)
    end

end

monkey_hash.each do |key, val|
    monkey_hash[key][4] = 0 
end

#part 1
def calc_worry(worry, method)
    method_arr = method.split(" ")
    case method_arr[3]
    when "*"
        if method_arr[4] == "old"
            worry *= worry
        else
            worry *= method_arr[4].to_i
        end
    when "+"
        if method_arr[4] == "old"
            worry += worry
        else
            worry += method_arr[4].to_i
        end
    end

    return (worry / 3).floor
end

#part 2
#find common denominator for monkeys
supermodulo = 1
monkey_hash.each do |key, val|
    supermodulo *= monkey_hash[key][2]
end

def calc_worry_2(worry, method, modulo)

    method_arr = method.split(" ")
    case method_arr[3]
    when "*"
        if method_arr[4] == "old"
            worry = (worry * worry)
        else
            worry = (worry * method_arr[4].to_i)
        end
    when "+"
        if method_arr[4] == "old"
            worry = 2 * worry
        else
            worry = worry + method_arr[4].to_i
        end
    end

    return worry % modulo
end

def run_test(worry, worry_test)
    return worry % worry_test == 0
end

round_limit = 10000
round = 0
#Part 1
while round < round_limit
    monkey_hash.each do |key, val|
        puts("Monkey #{key} has items of worry: #{monkey_hash[key][0]}")
        while monkey_hash[key][0].length > 0
            monkey_hash[key][4] += 1
            new_worry = 0
            new_worry = calc_worry_2(monkey_hash[key][0][0], monkey_hash[key][1], supermodulo)
            if run_test(new_worry,monkey_hash[key][2]) 
                puts("Monkey #{key} throwing #{new_worry} to Monkey #{monkey_hash[key][3][0]}")
                monkey_hash[monkey_hash[key][3][0]][0].push(new_worry) 
            else 
                puts("Monkey #{key} throwing #{new_worry} to Monkey #{monkey_hash[key][3][1]}")
                monkey_hash[monkey_hash[key][3][1]][0].push(new_worry) 
            end
            monkey_hash[key][0].shift()
            puts("Monkey #{key} now has items of worry: #{monkey_hash[key][0]}")
        end
    end
round +=1
end

monkey_business_arr = []
monkey_hash.each do |key, val|
    monkey_business_arr.push(monkey_hash[key][4])
end

print(monkey_business_arr)
puts("")
print(monkey_business_arr.max(2).inject(:*))