function cluster_info = cluster_idxs(dat_sorted,fov,cluster_lbls, stim_label)

stimulus = {'e3', 'e2', 'e1', 'd3', 'd2', 'd1', 'c3', 'c2', 'c1', 'blank'};
pa_size = zeros(length(stimulus)-1,1);
map = [];
for stim_num = 1: length(stimulus)-1
    stim = stimulus{stim_num};
    pa_size(stim_num) = length(dat_sorted{fov}.dff.ROI1.(stim));
    map = vertcat(map,(1:pa_size(stim_num)).');
end

map = [(1:length(map)).',map];

cluster_num = max(cluster_lbls);

for cluster = 1:cluster_num
    cluster_info{cluster}.idx = find(cluster_lbls == cluster); % find index position of cluster
    cluster_info{cluster}.stim = stim_label(cluster_info{cluster}.idx); % retrieve which whisker was deflected in that trial
    for n = 1:length(cluster_info{cluster}.idx)
        cluster_info{cluster}.idx(n) = map(cluster_info{cluster}.idx(n),2);
    end
end

end
