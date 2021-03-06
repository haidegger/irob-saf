% in mm
% model_3d_corners = [0, 0, 0; ...
%     0, 120.5, 0; ...
%     101, 120.5, 0; ...
%     100, -3, 0];
%  model_3d_corners = [0, 0, 0; ...
%      0, -38, 0; ...
%      24.3, -38, 0; ...
%      24.3, 0, 0];
 
 model_3d_corners = [7, 67.5, 0; ...
     67.5, 67.5, 0; ...
     67.5, 7.5, 0; ...
     7.5, 7.5, 0];
%                
% model_3d_targets = [18, 33, 0; ...    %
%                     36.8, 15.8, 0; ...
%                     59.6, 14.4, 0; ...
%                     76.4, 35, 0; ...
%                     38.8, 54.2, 0; ...
%                     61.6, 52.8, 0; ...  %
%                     22.5, 74.5, 0; ...  %
%                     24, 98.8, 0; ...
%                     48.2, 73.1, 0; ...
%                     49.2, 99.0, 0; ...
%                     78.8, 73.8, 0; ...
%                     81.9, 97.6, 0; ...  %
%                     ];
                
model_3d_targets = [18.7, 17.3, 0; ...    %
                    9.4, 28.0, 0; ...
                    31.0, 28.0, 0; ...
                    9.4, 46.0, 0; ...
                    31.0, 46.0, 0; ...
                    21.7, 57.0, 0; ...  %
                    
                    43.5, 17.2, 0; ...  %
                    68.7, 17.2, 0; ...
                    43.5, 37.2, 0; ...
                    68.7, 37.2, 0; ...
                    43.5, 57.2, 0; ...
                    68.7, 57.2, 0; ...  %
                    ];
                
target_h = 60.0;

grasp_h = 20.0;

model_3d_approaches = model_3d_targets + repmat([0, 0, target_h], size(model_3d_targets, 1), 1);

model_3d_grasps = model_3d_targets + repmat([0, 0, grasp_h], size(model_3d_targets, 1), 1);

target_d = 2.0;


save pnp_phantom_model.mat model_3d_corners model_3d_targets model_3d_approaches model_3d_grasps target_h grasp_h target_d