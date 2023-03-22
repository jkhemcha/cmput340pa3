function [pos, J] = evalRobot2D(l, theta)
    % Initialize outputs
    pos = []
    J = []
    
    % Find the position vector pos for the end effector [x;y]
    % x
    pos = [(l(1) * cos(theta(1))) + (l(2) * cos((theta(1) + theta(2))))]
    % y
    pos = [pos; (l(1) * sin(theta(1))) + (l(2) * sin((theta(1) + theta(2))))]
    
    % Find the Jacobian J of pos with respect to theta
    % x = l1 * cos(theta1) + l2 * cos(theta1 + theta2)
    % y = l1 * sin(theta1) + l2 * sin(theta1 + theta2)
    J = [(-1 * l(1)* sin(theta(1))) + (-1 * l(2) * sin(theta(1) + theta(2))), -1 * l(2) * sin(theta(1) + theta(2));
         (l(1) * cos(theta(1))) + (l(2) * cos(theta(1) + theta(2))), (l(2) * cos(theta(1) + theta(2)))]
end


