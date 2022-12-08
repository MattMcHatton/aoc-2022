lines = File.readlines('data.txt', chomp: true)
count = 0

$tree_arr = []
lines.each do |line|
    $tree_arr.push(line.split("").map {|x| x.to_i })
end

$tree_arr_t = $tree_arr.transpose
def is_visible(i, j)
    tree = $tree_arr[i][j]
    #check left
    if j > 0
        if $tree_arr[i][0..j-1].all? {|z| z < tree }
            return true
        end
    else 
        return true
    end
    #check right
    if $tree_arr[i][j+1..$tree_arr.length].all? {|z| z < tree }
        return true
    end
    #check up
    if i > 0
        if $tree_arr_t[j][0..i-1].all? {|z| z < tree }
            return true
        end
    else 
        return true
    end
    #check down
    if $tree_arr_t[j][i+1..$tree_arr_t.length].all? {|z| z < tree }
        return true
    end
    return false
end

def find_score(tree, arr)
    score = 0
    if arr.empty?
        return 0
    end
    print arr
    puts ""
    arr.each do |neighbor|
        print "Neighbor: #{neighbor} , Tree: #{tree}\n"
        if neighbor < tree
            score += 1
            print "Continuing Score + 1: #{score}\n"
        else
            score += 1
            print "Terminating Score + 1: #{score}\n"
            break
        end
    end
    return score
end

def calc_score(i, j)
    tree = $tree_arr[i][j]
    scenic_score = 1
    #check left
    if j > 0
        scenic_score *= find_score(tree, $tree_arr[i][0..j-1].reverse)
    else
        scenic_score *= find_score(tree, [])
    end
    #check right
    if j < $tree_arr.length
        scenic_score *= find_score(tree, $tree_arr[i][j+1..$tree_arr.length])
    else
        scenic_score *= find_score(tree, [])
    end
    #check up
    if i > 0
        scenic_score *= find_score(tree, $tree_arr_t[j][0..i-1].reverse)
    else
        scenic_score *= find_score(tree, [])
    end
    #check down
    if i < $tree_arr_t.length
        scenic_score *= find_score(tree, $tree_arr_t[j][i+1..$tree_arr_t.length])
    else
        scenic_score *= find_score(tree, [])
    end
    
    return scenic_score
end

max_score = 0
for x in 0..$tree_arr_t.length-1
    for y in 0..$tree_arr.length-1
        print "============================\n"
        puts "Tree at [#{x}][#{y}] (#{$tree_arr[x][y]})-> #{is_visible(x,y) ? "Visible" : "Not Visible"}"
        if is_visible(x,y)
            count += 1
        end
        scenic_score = calc_score(x,y)
        if scenic_score > max_score
            max_score = scenic_score
        end
        puts "Score: -> #{scenic_score}"
        puts "Max Score: #{max_score}"
        print "============================\n"
    end
end

#part 1 (1662)
puts count

#part 2 (537600)
puts max_score

