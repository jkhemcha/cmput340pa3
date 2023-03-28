function theta = invKin2D(l, theta0, pos, n, mode)
    theta_k = theta0
    % Define threshold for the norm where we say we have converged
    threshold = 0.0000001
    if mode == 0
        % Newton's method
        for i = 1:n
            [curr_pos, J_k] = evalRobot2D(l, theta_k);
            f_k = curr_pos - pos
            s_k = -J_k \ f_k;
            % Calculate new angles modulus 2 * pi to stop angles from
            % becoming unnecessarily large.
            theta_k = mod((theta_k + s_k), 2 * pi)
             % Stop at threshold for residual norm
            if norm(f_k) < threshold
                break
            end
        end
        theta = theta_k
    elseif mode == 1
        % Broyden's method
        % Initial jacobian approx.
        [curr_pos, B_k] = evalRobot2D(l, theta0)
        for i = 1:n
            f_k = curr_pos - pos
            s_k = -B_k \ f_k
            % Calculate new angles modulus 2 * pi to stop angles from
            % becoming unnecessarily large.
            theta_k = mod((theta_k + s_k), 2 * pi)
            % Evaluate the new position with theta k+1
            curr_pos = evalRobot2DNoJacobian(l, theta_k)
            f_k_1 = curr_pos - pos
            y_k = f_k_1 - f_k
            B_k = B_k + (((y_k - (B_k * s_k)) * s_k') / (s_k' * s_k))
            % Stop at threshold for residual norm
            if norm(f_k) < threshold
                break
            end
        end
        theta = theta_k
    end
end

