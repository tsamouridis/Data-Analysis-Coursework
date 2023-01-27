% finds the rank of the statistical in the vector x
function rank = find_rank(x, statistical)
    x = [statistical x];
    x = sort(x);
    indices = find(x == statistical);

    if length(indices) == 1
        rank = indices;
    else
        indices_index = randperm(length(indices), 1);
        rank = indices(indices_index);
    end
end