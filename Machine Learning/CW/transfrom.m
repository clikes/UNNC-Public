function matrix = transfrom(origin_mat, coeff, mu)
    %if there is only one data do not need to do the zeromeans
    matrix = (origin_mat - mu) * coeff;
end