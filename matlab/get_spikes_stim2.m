function events_stim = get_spikes_stim2(dat_sorted,fov,thrld,tbin, stim_num)

stimulus = {'e3', 'e2', 'e1', 'd3', 'd2', 'd1', 'c3', 'c2', 'c1', 'blank'};
stim = stimulus{stim_num};

num_rois = numel(fieldnames(dat_sorted{fov}.deNoise_dff));
trials = length(dat_sorted{1}.deNoise_dff.ROI1.(stim));
events_stim = zeros(num_rois, trials*2);

stim_onset = 5;
frameRate = 7.4811;
step = round(tbin*frameRate);
t_end = stim_onset + step;

for r = 1:num_rois
    roi = ['ROI', num2str(r)];
    stim_deriv = diff(dat_sorted{1}.deNoise_dff.(roi).(stim),1, 2);

    % find spike event indices
    [event_nroi, event_idx] = find(stim_deriv >= thrld);

    events_ROI = zeros(2,length(stim_deriv));
    % create population vector
    for idx = 1:length(event_nroi)
        if (event_idx(idx) >= stim_onset) && (event_idx(idx) <= t_end)
            events_ROI(1,event_nroi(idx)) = 1;
        elseif (event_idx(idx) > t_end) && (event_idx(idx) <= t_end+step)
            events_ROI(2,event_nroi(idx)) = 1;
        end
    end
    events_stim(r,:) = events_ROI(:);
end

end
