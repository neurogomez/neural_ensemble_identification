function events_spont = get_spikes_spont(dat_sorted,fov,tbin,thrld)

stimulus = {'e3', 'e2', 'e1', 'd3', 'd2', 'd1', 'c3', 'c2', 'c1', 'blank'};
stim = stimulus{10}; % blanks

frameRate = 7.4811;
t_length = 28; % trial length in frames
step = round(tbin*frameRate);

num_rois = numel(fieldnames(dat_sorted{fov}.deNoise_dff));
trials = length(dat_sorted{1}.deNoise_dff.ROI1.(stim));
events_spont = zeros(num_rois, trials*(t_length/step));

for r = 1:num_rois
    roi = ['ROI', num2str(r)];
    stim_deriv = diff(dat_sorted{1}.deNoise_dff.(roi).(stim),1, 2);

    % find spike event indices
    [event_nroi, event_idx] = find(stim_deriv >= thrld);
    
    events_ROI = zeros(t_length/step,length(stim_deriv));
    % create population vector
    for idx = 1:length(event_nroi)
        for k = 1:t_length/step
            if (event_idx(idx) >= 1+step*(k-1)) && (event_idx(idx) <= 1+step*k)
                events_ROI(k,event_nroi(idx)) = 1;
            end
        end
    end
    events_spont(r,:) = events_ROI(:);
end

end
