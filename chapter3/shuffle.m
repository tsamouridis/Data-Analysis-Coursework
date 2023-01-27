% returns a shuffled version of vector v
function v = shuffle(v)
    v = v(randperm(length(v)));
end