puts ""
print("========================================\n")
print("=================PART1==================\n")
print("========================================\n")
puts ""

cycle = 0
register = 1
cycle_vals = {}

lines = File.readlines("data.txt",chomp: true)
lines.each do |line|
    # print("=======================\n")
    if line.split(" ").length > 1
        cmd = line.split(" ")[0]
        amt = line.split(" ")[1].to_i
    else
        cmd = line
        amt = 0
    end
    # print("Command: #{cmd}\n")
    # print ("Amount: #{amt}\n")
    case cmd
    when "noop"
        # print("Cycle: #{cycle}\n")
        # print("Register: #{register}\n")
        cycle += 1
        strength = register * cycle
        cycle_vals[cycle] = [register,strength]
    when "addx"
        for i in 1..2
            # print("Cycle: #{cycle}\n")
            # print("Register: #{register}\n")
            cycle += 1
            strength = register * cycle
            if i > 1
                register += amt
            end
            cycle_vals[cycle] = [register,strength]
        end
    end
    # print("End of cycle #{cycle}. Register is #{register}\n")
    # print("=======================\n")
end

#part 1
print("#{cycle_vals[20][1]} + #{cycle_vals[60][1]} + #{cycle_vals[100][1]} + #{cycle_vals[140][1]} + #{cycle_vals[180][1]} + #{cycle_vals[220][1]} = #{cycle_vals[20][1] + cycle_vals[60][1] + cycle_vals[100][1] + cycle_vals[140][1] + cycle_vals[180][1] + cycle_vals[220][1]}\n" )
puts ""
print("========================================\n")
print("=================PART2==================\n")
print("========================================\n")
puts ""
#part 2

cycle = 1
sprite_pos = 0
lines = File.readlines("data.txt",chomp: true)
lines.each do |line|
    if line.split(" ").length > 1
        cmd = line.split(" ")[0]
        amt = line.split(" ")[1].to_i
    else
        cmd = line
        amt = 0
    end
    case cmd
    when "noop"
        #print("Start cycle #{cycle}: begin executing #{cmd}\n") #begin executing noop
        symbol = (cycle%40-1 < sprite_pos || cycle%40-1 >= sprite_pos + 3) ? "." : "#"
        #print("During cycle #{cycle}: CRT draws pixel in position #{cycle-1} (#{symbol})\n") #Begins drawing in position sprite pos
        #print("Action: #{cmd}, Amount: #{amt}, Cycle: #{cycle}, Sprite Position: #{sprite_pos}, Symbol: #{symbol}\n")
        print(symbol)
        if cycle%40 == 0
            print "\n"
        end
        cycle += 1
        #print("Finish executing noop\n") #finish executing noop

    when "addx"
        #print("Sprite position: #{sprite_pos}\n")
        #print("Start cycle #{cycle}: begin executing #{cmd} #{amt}\n") #begin executing noop
        for i in 1..2
            #Begins drawing in position sprite pos
            symbol = (cycle%40-1 < sprite_pos || cycle%40-1 >= sprite_pos + 3) ? "." : "#"
            #print("During cycle #{cycle}: CRT draws pixel in position #{cycle-1} (#{symbol})\n")
            print(symbol)
            #print("Action: #{cmd}, Amount: #{amt}, Cycle: #{cycle}, Sprite Position: #{sprite_pos}, Symbol: #{symbol}\n")
            if i > 1
                #finishes executing addx sprite position now updated
                sprite_pos += amt
                #print("End of cycle #{cycle}: finish executing #{cmd} #{amt} (Register is now #{sprite_pos})\n")
            end 
            if cycle%40 == 0
                print "\n"
            end 
            cycle += 1          
        end          
    end
end

print("\n")