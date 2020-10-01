% data summary
num_fields = 8;
dat_summary = get_info(data,stimuli_info, num_fields);

figure (1)
plot(data{1}.ROI1.movie_1.dff)

figure(2)
plot(data{1}.ROI1.movie_1.deNoise_dff)
hold on 
dff_deriv = diff(data{1}.ROI1.movie_1.deNoise_dff);
plot(dff_deriv)

figure(3)
plot(data{1}.ROI1.movie_1.spike)

std_roi3 = std(data{1}.ROI3.movie_1.dff)