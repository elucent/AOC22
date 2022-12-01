max = acc = 0

for line in readlines(ARGS[1])
    global max
    global acc
    if line == ""
        if acc > max 
            max = acc 
        end
        acc = 0
    else
        acc += parse(Int, line)
    end
end

if acc > max
    max = acc
end

println(max)
