function plot_thrld(data,frameRate, ROInum, thresh)
ROI = ['ROI', num2str(ROInum)];
all_movies = [];
fov = 4;

% Combine All Movies: de Noise dF/F
for m  = 1:15
    mname = ['movie_',num2str(m)];
    all_movies = [all_movies, data{fov}.(ROI).(mname).deNoise_dff];
end

% Plot dF/F
dat = data{fov}.(ROI).movie_1.dff;
t1 = linspace(1,length(dat),length(dat))/frameRate;
subplot(2,1,1)
plot(t1,dat)
xlim([0,350])
title(ROI)
ylabel('dF/F')

% Plot Z Score
dat_deriv = diff(all_movies, 1, 2);
t2 = linspace(1,length(dat_deriv),length(dat_deriv))/frameRate;
subplot(2,1,2)
plot(t2,dat_deriv);
ylim([0,1.5])
xlim([0,350])
yline(thresh, '--r');
xlabel('Time (s)')
ylabel('d/dx of de Noised dF/F')
end
