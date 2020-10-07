% load data
% addpath('matlab','data')
% load('calcium_data.mat')
% load('stimuli_info.mat')

% data summary
num_fields = 8;
dat_summary = get_info(data,stimuli_info, num_fields);

thrld = 0.25;
fov = 1;
stim = 1;

events_stim = get_spikes_stim(dat_sorted,fov,thrld,stim);
plot_poparray(events_stim, stim)

events_spont = get_spikes_spont(dat_sorted,fov,thrld);
spont_PCA = events_spont - mean(events_spont, 2);
[coeff,score,latent] = pca(spont_PCA);
scatter(score(:,1), score(:,2))
% var_exp = plot_varexplained(latent);
% plot(latent)
