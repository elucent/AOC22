score = 0
crates = []
flipped = false

for line in readlines(ARGS[1])
    global score
    global flipped
    if startswith(line, '[') || startswith(line, ' ')   # crates
        for (i, ch) in enumerate(line)
            if ch == '[' || ch == ']' || ch == ' '
                #
            elseif isdigit(ch)
                break
            else
                idx = i ÷ 4 + 1
                while length(crates) < idx
                    push!(crates, Char[])
                end
                push!(crates[idx], ch)
            end
        end
    elseif startswith(line, "move")
        if !flipped
            flipped = true
            for i in 1:length(crates)
                reverse!(crates[i])
            end
        end

        cmds = [s for s in split(line, r"[A-Za-z ]+")]
        cmd = [parse(Int, s) for s in cmds[2:length(cmds)]]
        from = crates[cmd[2]]
        to = crates[cmd[3]]
        slice = from[1+length(from)-cmd[1]:length(from)]
        for i in slice
            pop!(from)
            push!(to, i)
        end
    end
end

for crate in crates
    print(last(crate))
end