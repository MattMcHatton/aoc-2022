# rock = 1, paper = 2, scissors = 3
# win = 6, lose = 0, draw = 3
# part 1
points = 0
File.readlines("data.txt").each do |match|
    case match[0]
    when "A"
        case match[2] 
        when "X"
            points += 1
            points += 3
        when "Y" 
            points += 2
            points += 6
        when "Z"
            points += 3
            points += 0
        end
    when "B"
        case match[2]
        when "X"
            points += 1
            points += 0
        when "Y" 
            points += 2
            points += 3
        when "Z"
            points += 3
            points += 6
        end
    when "C"
        case match[2]
        when "X"
            points += 1
            points += 6
        when "Y" 
            points += 2
            points += 0
        when "Z"
            points += 3
            points += 3
        end
end
end

puts points

# part 2

points = 0
File.readlines("data.txt").each do |match|
    case match[2]
    when "X"
        points += 0
        case match[0] 
        when "A"
            points += 3
        when "B" 
            points += 1
        when "C"
            points += 2
        end
    when "Y"
        points += 3
        case match[0] 
        when "A"
            points += 1
        when "B" 
            points += 2
        when "C"
            points += 3
        end
    when "Z"
        points += 6
        case match[0] 
        when "A"
            points += 2
        when "B" 
            points += 3
        when "C"
            points += 1
        end
end
end

puts points