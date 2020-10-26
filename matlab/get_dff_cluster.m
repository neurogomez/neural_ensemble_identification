function [cluster_info,cluster_dff_avg] = get_dff_cluster(dat_sorted, fov, cluster_info, tbin)

stimulus = {'e3', 'e2', 'e1', 'd3', 'd2', 'd1', 'c3', 'c2', 'c1', 'blank'};
num_rois = numel(fieldnames(dat_sorted{fov}.deNoise_dff));

stim_onset = 5;
frameRate = 7.4811;
t_end = stim_onset + round(tbin*frameRate);

for r = 1:num_rois
    roi = ['ROI', num2str(r)];
    for clust = 1:length(cluster_info)
        max_dff = [];
        for stim_num = 1: length(stimulus)-1
            stim = stimulus{stim_num};
            dff_stim = dat_sorted{fov}.deNoise_dff.(roi).(stim);
            cluster_info{clust}.dff.(roi).(stim) = dff_stim(cluster_info{clust}.idx(find(cluster_info{clust}.stim == stim_num)),:);
            max_dff = vertcat(max_dff, max(cluster_info{clust}.dff.(roi).(stim)(:,stim_onset:t_end),[],2));
        end
        cluster_info{clust}.dff.(roi).max_avg = mean(max_dff);
    end
end

cluster_dff_avg = zeros(num_rois,length(cluster_info));
for clust = 1:length(cluster_info)
    for r = 1:num_rois
        roi = ['ROI', num2str(r)];
        cluster_dff_avg(r,clust) = cluster_info{clust}.dff.(roi).max_avg;
    end
end

end
