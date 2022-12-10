require 'matrix'

input = File.readlines("data.txt", chomp: true).map { |l|
  dir, amt = l.split
  [dir, amt.to_i]
}

DIRS = {
  "U" => Vector[0, -1],
  "D" => Vector[0, 1],
  "R" => Vector[1, 0],
  "L" => Vector[-1, 0],
}

def simulate(steps, length=2)
  tail_positions = Hash.new

  knots = Array.new(length) { Vector[0, 0] }
  tail_positions[knots.last] = true

  steps.each { |dir, amt|
    mag.times {
      knots[0] += DIRS[dir]

      (1...knots.length).each { |i|
        prev = knots[i-1]
        knot = knots[i]

        diff = (prev - knot)

        if diff.magnitude >= 2
          norm = diff.map { |x| x == 0 ? 0 : x / x.abs }
          knots[i] += norm
        end
      }

      tail_positions[knots.last] = true
    }
  }

  return tail_positions.values.count(true)
end

p simulate(input)
p simulate(input, 10)
