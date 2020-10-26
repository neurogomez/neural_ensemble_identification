function column_identity = get_barrel_identity(ROI_position, fov)

num_rois = numel(fields(ROI_position{fov}.ROI_centroids));
column_identity = zeros(num_rois, 1);
stimulus = {'e3', 'e2', 'e1', 'd3', 'd2', 'd1', 'c3', 'c2', 'c1', 'blank'};

for r = 1:numel(fields(ROI_position{fov}.ROI_centroids))
    roi = ['ROI', num2str(r)];
    if isfield(ROI_position{fov}.barrelAssignment_Barrel, roi)
        position = find(contains(stimulus, ROI_position{fov}.barrelAssignment_Barrel.(roi)));
        column_identity(r) = position;
    else
        column_identity(r) = 0;
    end
end

end
