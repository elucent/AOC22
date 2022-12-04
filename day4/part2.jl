score = 0

for line in readlines(ARGS[1])
    global score

    intervals = split(line, ',')
    first = [parse(Int, s) for s in split(intervals[1], '-')]
    second = [parse(Int, s) for s in split(intervals[2], '-')]
    
    if !(first[1] > second[2] || first[2] < second[1])
        score += 1
    end
end

println(score)