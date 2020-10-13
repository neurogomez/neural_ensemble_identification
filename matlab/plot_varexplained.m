function plot_varexplained(evals)

plot(evals)
ylabel('Variance Explained')
xlabel('PCs')
xlim([0,50])
title('Var Explained')
end
