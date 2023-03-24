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
    elseif mode == 1
        % Broyden's method
        % Initial jacobian approx.
        [curr_pos, B_k] = evalRobot2D(l, theta0)
        for i = 1:n
            f_k = curr_pos - pos
            s_k = -B_k \ f_k
            theta_k = theta_k + s_k
            % Evaluate the new position with theta k+1
            curr_pos = evalRobot2DNoJacobian(l, theta_k)
            f_k_1 = curr_pos - pos
            y_k = f_k_1 - f_k
            B_k = B_k + (((y_k - (B_k * s_k)) * s_k') / (s_k' * s_k))
        end
        theta = theta_k
    end
end

