function priority(ch)
    if ch >= 'a'
        return 1 + ch - 'a'
    else
        return 27 + ch - 'A'
    end
end

score = 0

for line in readlines(ARGS[1])
    global score
    
    halfway :: Int64 = length(line) // 2
    firsthalf = line[1:halfway]
    secondhalf = line[halfway + 1:length(line)]
    buckets = fill(false, 64)
    for ch in firsthalf
        buckets[ch - 'A'] = true
    end
    for ch in secondhalf
        if buckets[ch - 'A']
            score += priority(ch)
            break
        end
    end
end

println(score)