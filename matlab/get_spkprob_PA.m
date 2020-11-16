function [stim_PA, stim_label] = get_spkprob_PA(dat_sorted,fov,thrld, stim_onset, tbin)

stimulus = {'e3', 'e2', 'e1', 'd3', 'd2', 'd1', 'c3', 'c2', 'c1', 'blank'};

%stim_onset = 5;
frameRate = 7.4811;
t_end = stim_onset + round(tbin*frameRate);

events_all=[];
stim_label = [];

for stim_num = 1:length(stimulus)-1
  stim = stimulus{stim_num};
  num_rois = numel(fieldnames(dat_sorted{fov}.deNoise_dff));
  trials = length(dat_sorted{fov}.deNoise_dff.ROI1.(stim));
  events_stim = zeros(num_rois, trials);


  for r = 1:num_rois
      roi = ['ROI', num2str(r)];
      stim_spkprob = dat_sorted{fov}.spike.(roi).(stim);
      max_prob = max(stim_spkprob(:,stim_onset:t_end),[],2);

      for trial = 1: length(max_prob)
          if max_prob(trial) < thrld
              max_prob(trial) = 0;
          end
      end
      events_stim(r,:) = max_prob.';

  end

  events_all = cat(2,events_all, events_stim);
  stim_label = cat(1,stim_label,ones(size(events_stim,2),1)*stim_num);

end

stim_PA = events_all.';

end
