function [z, mu, sigma] = plot_zscore(data,frameRate, ROInum, thresh) 
ROI = ['ROI', num2str(ROInum)];
all_movies = [];

% Combine All Movies: de Noise dF/F
for m  = 1:15
    mname = ['movie_',num2str(m)];
    all_movies = [all_movies, data{1}.(ROI).(mname).deNoise_dff]; 
end

% Plot dF/F
dat = data{1}.(ROI).movie_1.dff;
t1 = linspace(1,length(dat),length(dat))/frameRate;
subplot(2,1,1)
plot(t1,dat)
xlim([0,350])
title(ROI)
ylabel('dF/F')

% Plot Z Score
dat_deriv = diff(all_movies, 1, 2);
[z, mu, sigma] = zscore(dat_deriv);
t2 = linspace(1,length(dat_deriv),length(dat_deriv))/frameRate;
subplot(2,1,2)
plot(t2,z);
ylim([0,20])
xlim([0,350])
yline(thresh, '--r');
xlabel('Time (s)')
ylabel('Z Score')
end
