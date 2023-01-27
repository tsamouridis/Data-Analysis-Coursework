% Creates B permutation samples based on vector x.
% x_star contains the B samples stored column-wise.
function x_star = create_permutation_samples(x, B)
    if isvector(x) && isscalar(B) && B>0 && B<inf && floor(B) == ceil(B)
        if isrow(x)
            x = x.';
        end
        n = length(x);
        x_star = [];
        for i = 1:B
            temp = shuffle(x);
            x_star = [x_star, temp];
        end
 
    else
        error('x must be a vector. B must be a positive integer.')
    end