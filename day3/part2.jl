function priority(ch)
    if ch >= 'a'
        return 1 + ch - 'a'
    else
        return 27 + ch - 'A'
    end
end

score = 0
triple_mask = BitSet()

for (i, line) in enumerate(readlines(ARGS[1]))
    global score
    global triple_mask

    mask = BitSet([codepoint(c) for c in line])
    if i % 3 == 1
        if i > 1
            score += priority(Char(first(triple_mask)))
        end
        triple_mask = mask
    else
        intersect!(triple_mask, mask)
    end
end
score += priority(Char(first(triple_mask)))

println(score)