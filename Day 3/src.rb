lines = File.readlines("data.txt")

def split_line(line)
    return [line[0, (line.length-1)/2], line[(line.length-1)/2, line.length-1]]
end

def get_char_priority (char)
    letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    return letters.index(char.strip) + 1
end 

def get_priority(line)
    letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    lines = split_line(line)
    common_char = (lines[0].chars & lines[1].chars).join
    return get_char_priority(common_char)
end

#part 1
sum_priority = 0
lines.each do |line|
    sum_priority += get_priority(line)
end

puts sum_priority

#part 2
i = 0
group_size = 3
sum_priority = 0
while i < lines.length
    common_char = (lines[i].chars & lines[i+1].chars & lines[i+2].chars).join
    sum_priority += get_char_priority(common_char)
    i+=group_size
end

puts sum_priority


