function events_spont = get_spikes_spont(dat_sorted,fov,thrld)

stimulus = {'e3', 'e2', 'e1', 'd3', 'd2', 'd1', 'c3', 'c2', 'c1', 'blank'};
stim = stimulus{10}; % blanks

num_rois = numel(fieldnames(dat_sorted{fov}.deNoise_dff));
trials = length(dat_sorted{1}.deNoise_dff.ROI1.(stim));
events_spont = zeros(num_rois, trials*3);

for r = 1:num_rois
    roi = ['ROI', num2str(r)];
    stim_deriv = diff(dat_sorted{1}.deNoise_dff.(roi).(stim),1, 2);

    % find spike event indices
    [event_nroi, event_idx] = find(stim_deriv >= thrld);
    
    events_ROI = zeros(3,length(stim_deriv));
    % create population vector
    for idx = 1:length(event_nroi)
        if (event_idx(idx) >= 5) && (event_idx(idx) <= 12)
            events_ROI(1,event_nroi(idx)) = 1;
            
        elseif (event_idx(idx) >= 13) && (event_idx(idx) <= 20)
            events_ROI(2,event_nroi(idx)) = 1;
            
        elseif (event_idx(idx) >= 21)
            events_ROI(3,event_nroi(idx)) = 1;
            
        end
    end
    events_spont(r,:) = events_ROI(:);
end

end
