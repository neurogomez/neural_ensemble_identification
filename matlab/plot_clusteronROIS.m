function plot_clusteronROIS(x_pst,y_pst, label, titlename, sz)

scatter(x_pst, y_pst,sz,label,'filled')
J = customcolormap([0 0.5 1], {'#000034','#007cff','#e3ffff'});
colormap(J)
caxis([0,0.5])
h = colorbar;
%ylabel(h, 'Z-score Avg dF/F')
xlim([0,513])
ylim([0,513])
set(gca,'xtick',[])
set(gca,'ytick',[])
box on
title(titlename)

end
