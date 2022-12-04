score = 0

for line in readlines(ARGS[1])
    global score

    intervals = split(line, ',')
    first = [parse(Int, s) for s in split(intervals[1], '-')]
    second = [parse(Int, s) for s in split(intervals[2], '-')]
    
    function contains(a, b)
        return a[1] <= b[1] && a[2] >= b[2] 
    end
    if contains(first, second) || contains(second, first)
        score += 1
    end
end

println(score)