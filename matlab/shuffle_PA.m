function shuffled_PA = shuffle_PA(stim_PA, dim)

[m,n] = size(stim_PA);
shuffled_PA = zeros(m,n);
if dim == 1
    for i = 1:n
        idx = randperm(m);
        shuffled_PA(idx,i) = stim_PA(:,i);  % columns arranged randomly
    end
elseif dim == 2
    for i = 1:m
        idx = randperm(n);
        shuffled_PA(i,idx) = stim_PA(i,:);  % columns arranged randomly
    end
end
end
