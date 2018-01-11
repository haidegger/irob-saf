% in mm
model_3d_corners = [0, 0, 0; ...
                    0, 120.5, 0; ...
                    101, 120.5, 0; ...
                    100, -3, 0];
               
model_3d_targets = [19.6, 35, 0; ...    %
                    38.8, 15.8, 0; ...
                    61.6, 14.4, 0; ...
                    80.4, 35, 0; ...
                    38.8, 54.2, 0; ...
                    61.6, 52.8, 0; ...  %
                    22.5, 73.1, 0; ...  %
                    23, 96.8, 0; ...
                    49.2, 72.1, 0; ...
                    48.2, 96.3, 0; ...
                    78.4, 71.1, 0; ...
                    78.7, 95.3, 0; ...  %
                    ];
                
target_h = 30.0;

grasp_h = 20.0;

model_3d_approaches = model_3d_targets + repmat([0, 0, target_h], size(model_3d_targets, 1), 1);

model_3d_grasps = model_3d_targets + repmat([0, 0, grasp_h], size(model_3d_targets, 1), 1);

target_d = 8.0;

save pnp_phantom_model.mat model_3d_corners model_3d_targets model_3d_approaches model_3d_grasps target_h grasp_h target_d