line = readlines(ARGS[1])[1]
bag = Dict()

for (i, ch) in enumerate(line)
    global bag
    if i > 14
        lastch = line[i - 14]
        bag[lastch] -= 1
        if bag[lastch] < 1
            delete!(bag, lastch)
        end
    end
    if haskey(bag, ch)
        bag[ch] += 1
    else
        merge!(bag, Dict(ch=>1))
    end
    if length(bag) == 14
        println(bag)
        println(i)
        break
    end
end