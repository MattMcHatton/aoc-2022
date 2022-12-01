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

#star 2
puts elf_cals_list.max(3).sum()
#also star 2
puts elf_cals_list.max(3).inject(:+)

