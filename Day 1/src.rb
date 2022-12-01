elf_cals_list = []
current_cals = 0

File.readlines("data.txt").each do |line|
    if line == "\n"
        elf_cals_list.push(current_cals)
        current_cals = 0
    else
        current_cals += line.to_i
    end
end

# star 1
puts elf_cals_list.max

current_cals = 0
elf_cals_list.max(3).each do |cals|
    current_cals += cals
end

#star 2
puts current_cals

