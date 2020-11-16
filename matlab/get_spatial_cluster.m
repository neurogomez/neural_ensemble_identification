function spatial_clusters = get_spatial_cluster(dat_sorted, data, cluster_dff_avg_norm, cutoff, cluster_num, fov, t_start, tbin)

% Get dF/F for Cells within Cluster for each whisker stimulus type
stimulus = {'e3', 'e2', 'e1', 'd3', 'd2', 'd1', 'c3', 'c2', 'c1', 'blank'};
frameRate = 7.4811;
t_end = t_start + round(tbin*frameRate);

for clust = 1: cluster_num
    spatial_clusters{clust}.rois = find(cluster_dff_avg_norm(:,clust) > cutoff);
    spatial_clusters{clust}.dff_max = zeros(length(spatial_clusters{clust}.rois),9);
    spatial_clusters{clust}.dff_max_norm = zeros(length(spatial_clusters{clust}.rois),9);
     spatial_clusters{clust}.dff_max_std = zeros(length(spatial_clusters{clust}.rois),9);
    for nrois = 1:length(spatial_clusters{clust}.rois)
        roi = ['ROI', num2str(spatial_clusters{clust}.rois(nrois))];

        %get z-score from denoised dF/F - all 15 movies
        all_movies = [];
        for m  = 1:numel(fields(data{fov}.ROI1))
            mname = ['movie_',num2str(m)];
            all_movies = [all_movies, data{fov}.(roi).(mname).deNoise_dff];
        end
        [~, mu, sigma] = zscore(all_movies);

        for stim_num = 1:length(stimulus)-1
            stim = stimulus{stim_num};
            dff_stim = dat_sorted{fov}.deNoise_dff.(roi).(stim);
            dff_stim_zscore = (dff_stim - mu)/sigma;
            spatial_clusters{clust}.dff_max(nrois,stim_num) = mean(max(dff_stim(:,t_start:t_end),[],2));
            spatial_clusters{clust}.dff_max_std(nrois,stim_num) = std(max(dff_stim(:,t_start:t_end),[],2));
            spatial_clusters{clust}.dff_max_norm(nrois,stim_num) = mean(max(dff_stim_zscore(:,t_start:t_end),[],2));
        end
    end
end

end
