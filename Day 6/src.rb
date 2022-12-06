line = File.readlines("data.txt")[0].chomp()
test_line = "zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw"

def is_marker(signal)
    signal.chars.each do |char|
        check_signal = signal.tr(char, "")
        if check_signal.length < 13
            return false
        end
    end
    return true
end

i = 0 
until is_marker(line[i..i+13]) do
    i += 1
end

# +1 because index +3 because 4 letters
print i + 14