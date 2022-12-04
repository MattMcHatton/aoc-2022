
def get_range_arr(range)
    x,y = range.split("-")
    return [*x.to_i..y.to_i]
end

def check_full_overlap(arr_1, arr_2)
    arr_1.map(&:to_i)
    arr_2.map(&:to_i)
    return (arr_1 - arr_2).empty? || (arr_2 - arr_1).empty?
end

def check_any_overlap(arr_1, arr_2)
    arr_1.map(&:to_i)
    arr_2.map(&:to_i)
    return (arr_1 - arr_2).length < arr_1.length || (arr_2 - arr_1).length < arr_2.length
end

full_overlap_count = 0
any_overlap_count = 0
File.readlines("data.txt").each do |line|
    range_arr = []
    assignments = line.split(",")
    assignments.each do |elf_range|
        range_arr.push(get_range_arr(elf_range))
    end
    if check_full_overlap(range_arr[0], range_arr[1])
        full_overlap_count += 1
    end
    if check_any_overlap(range_arr[0], range_arr[1])
        any_overlap_count += 1
    end
end

#part 1
puts full_overlap_count

#part2
puts any_overlap_count