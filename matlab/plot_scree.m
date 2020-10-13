function var_exp = plot_scree(evals)

subplot(2,1,1)
plot(evals)
ylabel('Variance Explained')
xlim([0,100])
title('Scree Plot')

csum = cumsum(evals);
var_exp = csum/sum(evals);

subplot(2,1,2)
plot(var_exp)
xlabel('Number of Components')
xlim([0,100])
ylabel('Cum Sum of Variance Explained')
title('Cum Sum Var Explained')
end
