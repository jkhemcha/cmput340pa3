

% 4a.
% After running many tests, it seems that Broyden's method sometimes fails
% to converge in 'n' steps in cases where Newton's method would indeed
% converge. This suggests that Newton's method is able to find convergence
% in less steps in the general case. However, we know that in Newton's
% method we spend time calculating the gradient to build the jacobian
% matrix, which we avoid doing in Broyden's method. Therefore, we can say
% that Broyden's method will have a faster performance (less expensive
% calculations required) thabn Newton's method.

% Below is an experiment where we run Newton's method 5 times, then
% Broyden's method 5 times.

% This code is a modified version of the code available in eval2D.m
% make sure you define n and mode, the ones
% below are for illustration
n = 10;

ls=[0.5,0.5]';
t=rand(2,1); %Choose some random starting point.

clf;
plotRobot2D(ls,t);
hold off;

count = 0

% Run 5 experiments with Newton's method
while(count < 5)
  desired=ginput(1)'; %Get desired position from user

  clf;
  plot(desired(1),desired(2),'*');
  hold on;
  plotRobot2D(ls,t,':');
  
  %Solve and display the position
  t=invKin2D(ls,t,desired,n,0); 
  plotRobot2D(ls,t);
  hold off;
  count = count + 1
end

% Run 5 experiments with Broyden's method
while(count < 10)
  desired=ginput(1)'; %Get desired position from user

  clf;
  plot(desired(1),desired(2),'*');
  hold on;
  plotRobot2D(ls,t,':');
  
  %Solve and display the position
  t=invKin2D(ls,t,desired,n,1); 
  plotRobot2D(ls,t);
  hold off;
  count = count + 1
end
