score = 0

for line in readlines(ARGS[1])
    global score
    outcome = line[3] - 'X'
    score += 1 + mod(line[1] - 'A' + outcome - 1, 3) + outcome * 3;
end

println(score)
