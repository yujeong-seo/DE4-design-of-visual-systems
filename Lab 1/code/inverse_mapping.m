function [Out] = inverse_mapping(In, Theta)
    % Image initialisation
    [rows, cols] = size(In);
    Out = zeros(rows, cols);

    % Rotation center
    xc = cols / 2;
    yc = rows / 2;

    % Set trig functions as variable
    cos_t = cos(Theta);
    sin_t= sin(Theta);

    R = [cos_t  sin_t;
        -sin_t  cos_t];

    R_inv = inv(R);

    Tc = [xc; yc];

    for y_dest = 1:rows
        for x_dest = 1:cols

            % Calculating as matrix
            V_dest = [x_dest; y_dest];
            V_src = R_inv * (V_dest - Tc) + Tc;

            x_src_raw = V_src(1);
            y_src_raw = V_src(2);

            x_src = round(x_src_raw);
            y_src = round(y_src_raw);
            if x_src >= 1 && x_src <= cols && y_src >= 1 && y_src <= rows
                Out(y_dest, x_dest) = In(y_src, x_src);
            end
        end
    end
end