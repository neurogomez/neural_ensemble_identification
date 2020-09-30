function data_info = get_info(data, stimuli_info, num_fields)
for i = 1:num_fields
    data_info(i).name = "FOV_" + num2str(i);
    data_info(i).ROIs = numel(fieldnames(data{i}));
    data_info(i).movies = numel(fieldnames(data{i}.ROI1));
    
    indiv = 0;
    group = 0;
    blank = 0;
    tone = 0;
    
    for m = 1:data_info(i).movies
        mname = ['movie_',num2str(m)];
        
        for l = 1:length(stimuli_info{i}.(mname).Label)
            if stimuli_info{i}.(mname).Label(l) < 9
                indiv = indiv+1;
            elseif stimuli_info{i}.(mname).Label(l) == 9
                group = group+1;
            elseif stimuli_info{i}.(mname).Label(l) == 10
                blank = blank+1;
            elseif stimuli_info{i}.(mname).Label(l) > 10
                tone = tone + 1;
            end
        end
    end
    
    data_info(i).indiv_trials = indiv;
    data_info(i).group_trials = group;
    data_info(i).blank_trials = blank;
    data_info(i).tone_trials = tone;
end
end