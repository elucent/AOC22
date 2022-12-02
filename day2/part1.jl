score = 0

for line in readlines(ARGS[1])
    global score
    should = line[3] - 'X'
    score += 1 + should + mod(should - (line[1] - 'A') + 1, 3) * 3;
end

println(score)
