def make_arrays(box_arr, dir_arr,input)
    text_arr = input.split("\n")
    text_arr.each do |arr|
        if arr.include? "move"
            dir_arr.push(arr)
        else
            box_arr.push(arr.split("[]"))
            #box_arr.push(arr.tr("[","").tr("]","").squeeze("  ").split(""))
        end
    end
end

def clean_boxes(box_arr)
    str_arr = []
    box_arr.each do |row|
        str_arr.push(row[0].tr("[","").tr("]","").gsub(/\s\s\s\s/," X ").tr(" ", ""))
    end
    return str_arr
end

def find_stack_size(arr)
    return arr.pop()[0].tr(" ","").split("").map { |num| num.to_i }.max()
end

def stack_boxes(arr)
    new_arr = Array.new($stack_size, '')
    arr.each do |str|
        i = 0
        while i < str.length
            new_arr[i] = new_arr[i] + str[i]
            i += 1
        end
    end
    return new_arr.map { |stack| stack.tr("X", "")}
end

def get_directions(arr)
    #move X boxes from Y to Z
    #[[X1,Y1,Z1],[X2,Y2,Z2],[X3,Y3,Z3]]
    new_arr = []
    arr.each do |line|
        new_arr.push(line.scan(/\d+/).map { |i| i.to_i })
    end
    return new_arr
end

def move_boxes_9000(stacks, directions)
    directions.each do |line|
        i = 0
        while i < line[0]
            stacks[line[2]-1] = stacks[line[1]-1][0] + stacks[line[2]-1]
            stacks[line[1]-1].slice!(0)
            i += 1
        end
    end
end

def move_boxes_9001(stacks, directions)
    directions.each do |line|
        stacks[line[2]-1] = stacks[line[1]-1][0..line[0]-1] + stacks[line[2]-1]
        stacks[line[1]-1].slice!(0..line[0]-1)
    end
end

def get_top_boxes(arr)
    return arr.map { |str| str[0]}
end

boxes_str = []
boxes = []
directions = []
File.readlines("data.txt").each do |line|
    make_arrays(boxes, directions, line)
end

$stack_size = find_stack_size(boxes)
clean_box_strings = clean_boxes(boxes)
clean_stacks = stack_boxes(clean_box_strings)
clean_directions = get_directions(directions)

#part 1
#move_boxes_9000(clean_stacks, clean_directions)
#print get_top_boxes(clean_stacks).inject(:+)

#part 2
move_boxes_9001(clean_stacks, clean_directions)
print get_top_boxes(clean_stacks).inject(:+)