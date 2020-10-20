function plot_ROIlabel(x_pst,y_pst, label, titlename)

scatter(x_pst, y_pst,30,label,'filled')
fire_ice = customcolormap_preset('red-white-blue');
colormap(fire_ice)
caxis([-0.1,0.1])
h = colorbar;
ylabel(h, 'ROI Weight Value')
xlim([0,513])
ylim([0,513])
set(gca,'xtick',[])
set(gca,'ytick',[])
box on
title(titlename)

end
