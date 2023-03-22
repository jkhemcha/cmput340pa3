% Without central difference method
evalRobot2D([1;1], [pi/4;pi/4])
% J =
   % -1.7071   -1.0000
   %  0.7071    0.0000

% With central difference formula using h=0.1
fdJacob2D([1;1], [pi/4;pi/4], 0.1)
% J =
   % -1.7043   -0.9983
   %  0.7059         0

% With central difference formula using h=0.5
fdJacob2D([1;1], [pi/4;pi/4], 0.5)
% J =
   % -1.6369   -0.9589
   %  0.6780         0
   
% With central difference formula using h=1
fdJacob2D([1;1], [pi/4;pi/4], 1)
% J =
  % -1.4365   -0.8415
  %  0.5950         0

% With central difference formula using h=10
fdJacob2D([1;1], [pi/4;pi/4], 10)
% J =
  % 0.0929   0.0544
  % -0.0385        0

   
% 2a.
% From the above results, we can see that the two methods
% are producing very similar results when a small value of h is chosen (less than 1).

% 2b.
% We would use this finite diffference approximation instead of the first
% approach when we have some error in our calculations and when we need to
% get a similar result to the actual jacobian for some perturbation to the
% input.