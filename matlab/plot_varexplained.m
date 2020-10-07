function var_exp = plot_varexplained(evals)

csum = cumsum(evals);
var_exp = csum/sum(evals);

plot(var_exp)
xlabel('Number of Components')
ylabel('Variance Explained')
title('Scree Plot')
end

