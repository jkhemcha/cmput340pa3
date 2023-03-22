function theta = invKin2D(l, theta0, pos, n, mode)
    theta_k = theta0
    if mode == 0
        % Newton's method
        for i = 1:n
            [curr_pos, J_k] = evalRobot2D(l, theta_k);
            f_k = curr_pos - pos
            s_k = -J_k \ f_k;
            theta_k = theta_k + s_k
        end
        theta = theta_k
    else
        % Broydin's method
    end
end

