% Creates B bootstrap samples based on vector x.
% x_star contains the B samples stored column-wise.
function x_star = create_bootstrap_samples(x, B)
    if isvector(x) && isscalar(B) && B>0 && B<inf && floor(B) == ceil(B)
        n = length(x);
        x_star = zeros([n, B]);
        for j = 1:B
            for i = 1:n
                index = randi([1, n]);
                x_star(i, j) = x(index);
            end
        end
    else
        error('x must be a vector. B must be a positive integer.')
    end