function plot_poparray(events_stim, stim_num)
stimulus = {'e3', 'e2', 'e1', 'd3', 'd2', 'd1', 'c3', 'c2', 'c1', 'blank'};
mymap = [0 0 0 ; 1 1 1]; % black and white cmpa
tname = ['Population Aray for ', stimulus{stim_num}];

heatmap(events_stim, 'Colormap', mymap, 'ColorbarVisible', 'off');

xlabel('trial')
ylabel('ROI')
title(tname)

Ax = gca;
Ax.XDisplayLabels = nan(size(Ax.XDisplayData));
Ax.YDisplayLabels = nan(size(Ax.YDisplayData));
end
