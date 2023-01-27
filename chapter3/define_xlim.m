% returns the xaxis-limits used in the subplots for exer_3_7.m and
% exer_3_8.m
function [x1, x2] = define_xlim(array1, array2)
    x1 = min([array1(1, :), array2(1, :)]) - 1;
    x2 = max([array1(2, :), array2(2, :)]) + 1;
end