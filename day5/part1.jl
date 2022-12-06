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
            for crate in crates
                reverse!(crate)
            end
        end

        cmds = [s for s in split(line, r"[A-Za-z ]+")]
        cmd = [parse(Int, s) for s in cmds[2:length(cmds)]]
        for i in 1:cmd[1]
            elt = pop!(crates[cmd[2]])
            push!(crates[cmd[3]], elt)
        end
    end
end

for crate in crates
    print(last(crate))
end

