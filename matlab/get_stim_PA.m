function [stim_PA, stim_label] = get_stim_PA(dat_sorted,fov,thrld,tbin)

stimulus = {'e3', 'e2', 'e1', 'd3', 'd2', 'd1', 'c3', 'c2', 'c1', 'blank'};
events_all=[];
stim_label = [];

for stim_num = 1:length(stimulus)-1
    events_stim = get_spikes_stim(dat_sorted,fov,thrld,tbin,stim_num);
    events_all = cat(2,events_all, events_stim);
    stim_label = cat(1,stim_label,ones(size(events_stim,2),1)*stim_num);
end

stim_PA = events_all.';

end
