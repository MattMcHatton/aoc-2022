dir_tree = {}
pwd = []

File.readlines("data.txt").each do |line|
    line = line.split(" ")
    if line[0] == "$" #handle commands
        if line[1] == "cd"
            if line[2] == ".." #handle move up
                pwd.pop()
            else
                pwd.push(line[2])
                pwd.join('/')
                dir_tree[pwd.join('/').to_s] = 0
            end
        end
    else if line[0] == "dir"
        next
    else
        fileSize = line[0].to_i
        temp = []
        pwd.each do |d|
            temp.push(d)
            temp2 = temp.join("/")
            dir_tree[temp2] += fileSize
        end
    end
end
end
 
def sum_sizes_limit(tree, limit)
    sum = 0
    tree.each do |k, v|
        if tree[k] < limit
            sum += tree[k]
        end
    end
    return sum
end

def sum_sizes(tree)
    sum = 0
    tree.each do |k, v|
        sum += tree[k]
    end
    return sum
end

def delete_dir(tree, total_space, unused_space_needed)
    answer = 0
    free_space = total_space - tree["/"]
    goal_space = unused_space_needed - free_space
    sorted_tree = tree.sort_by { |k , v| v }
    sorted_tree.each do |k, v|
        if v > goal_space
            answer += v
            break
        end
    end
    return answer
end


#Part 1:  1749646
puts sum_sizes_limit(dir_tree, 100000)

#Part 2:  1498966
puts delete_dir(dir_tree, 70000000, 30000000)