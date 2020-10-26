function plot_clst_barrels(x_pst,y_pst, label,column_identity, titlename, sz)

bcolumns = {'none','e3', 'e2', 'e1', 'd3', 'd2', 'd1', 'c3', 'c2', 'c1'};

syms = {'o' '+' '*' '.' 'x' 's' 'd' 'p' 'h' '^'};
hold on % important
h = gobjects(numel(x_pst),1);
for i = 1:numel(x_pst)
    % Assign the label to the legend string using DisplayName
    h(i) = scatter(x_pst(i),y_pst(i),sz,label(i),'filled',syms{column_identity(i)+1});
end

J = customcolormap([0 0.5 1], {'#000034','#007cff','#e3ffff'});
colormap(J)
caxis([0,0.5])
c = colorbar('southoutside');

hold on
columns2plot = unique(column_identity);
l = zeros(length(columns2plot), 1);
for n = 1:length(columns2plot)
    l(n) = scatter(NaN, NaN,30, 'filled', 'b',syms{columns2plot(n)+1});
end

ylabel(c, 'Average dF/F')
legend(l, bcolumns, 'location', 'eastoutside');

xlim([0,513])
ylim([0,513])
set(gca,'xtick',[])
set(gca,'ytick',[])
box on
title(titlename)

end
