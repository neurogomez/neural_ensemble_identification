function plot_PCA(score,stim_label, plt_title)

custom_cmap = [0.702,0.000,0.000;
          0.000,0.071,0.592;
          0.412,0.000,0.600;
          0.608,0.016,0.620;
          0.769,0.176,0.612;
          0.902,0.329,0.573;
          1.000,0.490,0.502;
          1.000,0.663,0.404;
          1.000,0.859,0.345];

scatter(score(:,1), score(:,2),10,stim_label)% projection onto first 2 components
colormap(custom_cmap)
colorbar
xlim([-2,2])
ylim([-2,2])
xlabel('PC 1')
ylabel('PC 2')
title(plt_title)
end
