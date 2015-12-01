% IndoorObstacleSet3 gives a set of obstacles for the ASL vicon arena
%
%   AUTHOR: Ross Allen, ASL, Stanford University
%   DATE:   Oct 7, 2015
%
%   Notes:
%       - Wall with gap
%		- written so that obstacle dimensions can be written on
%			the interval of [0,1] and auto scaled to the obstacleSpace
%			dimensions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [LWH_F, YPR_F, CM_F] = IndoorObstacleSet3(obstacles)

envL = abs(obstacles.obstacleSpace(1,1) ...
	- obstacles.obstacleSpace(1,2));% (m) length of environment (x)
envW = abs(obstacles.obstacleSpace(2,1) ...
	- obstacles.obstacleSpace(2,2));% (m) length of environment (y)
envH = abs(obstacles.obstacleSpace(3,1) ...
	- obstacles.obstacleSpace(3,2));% (m) length of environment (z)

% Length/Width/Height of fixed cuboid obstacles (-) (m-th COLUMN vector corresponds to m-th obstacle)
LWH_F = [...
    [1.0, 0.05, 0.3]', ...
    [1.0, 0.05, 0.3]', ...
    [0.1, 0.05, 1.0]', ...
    [0.5, 0.05, 1.0]'];
nObs = size(LWH_F,2);
LWH_F = LWH_F.*repmat([envL, envW, envH]', 1, nObs);

% Yaw/Pitch/Roll of fixed cuboid obstacles (deg) (m-th COLUMN vector corresponds to m-th obstacle)
YPR_F = zeros(3, nObs);

% Position vector of fixed cuboid obstacle centroid [m] (m-th COLUMN vector corresponds to m-th obstacle)
CM_F = [...
    [0.5, 0.5, 0.85]',...
    [0.5, 0.5, 0.15]', ...
	[0.1, 0.5, 0.5]', ...	
    [0.7, 0.5, 0.5]'];
CM_F = CM_F.*repmat([envL, envW, envH]', 1, nObs) + ...
	repmat([obstacles.obstacleSpace(1,1), ...
	 obstacles.obstacleSpace(2,1), ...
	obstacles.obstacleSpace(3,1)]', 1, nObs);

end