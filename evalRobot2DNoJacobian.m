function pos = evalRobot2DNoJacobian(l, theta)
    % Used in Broyden's method which doesn't require calculating gradients!
    % Initialize outputs
    pos = [];
    
    % Find the position vector pos for the end effector [x;y]
    % x
    pos = [(l(1) * cos(theta(1))) + (l(2) * cos((theta(1) + theta(2))))];
    % y
    pos = [pos; (l(1) * sin(theta(1))) + (l(2) * sin((theta(1) + theta(2))))]
end