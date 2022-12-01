nums = Int[]
acc = 0

for line in readlines(ARGS[1])
    global nums
    global acc
    if line == ""
        push!(nums, acc)
        acc = 0
    else
        acc += parse(Int, line)
    end
end
if acc > 0
    push!(nums, acc)
end

function swap!(nums, i, j)
    t = nums[i]
    nums[i] = nums[j]
    nums[j] = t
end

function bubble!(nums)
    for i in 1:length(nums)-1
        if nums[i] > nums[i + 1]
            swap!(nums, i, i + 1)
        end
    end
end

for i in 1:3
    bubble!(nums)
end

for i in nums[length(nums) - 2:length(nums)]
    println(i)
end
