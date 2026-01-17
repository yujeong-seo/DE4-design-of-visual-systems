function [Out] = forward_mapping(In, Theta)
    % Image dimension
    [rows, cols] = size(In);

    % Initialise the output image with 0 (black)
    Out = zeros(rows, cols);

    % Rotation center
    xc = cols / 2;
    yc = rows / 2;

    % Set trig functions as variable
    cos_t = cos(Theta);
    sin_t= sin(Theta);

    R = [cos_t  sin_t;
        -sin_t  cos_t];

    Tc = [xc; yc];

    % Forward mapping loop: through the source
    for y_src = 1:rows
        for x_src = 1:cols

            % Calculating as matrix
            V_src = [x_src; y_src];
            V_dest = R * (V_src - Tc) + Tc;

            x_dest_raw = V_dest(1);
            y_dest_raw = V_dest(2);
            
            % Round for the nearest pixel
            x_dest = round(x_dest_raw);
            y_dest = round(y_dest_raw);

            % Destination within the image boundaries
            if x_dest >= 1 && x_dest <= cols && y_dest >= 1 && y_dest <= rows
                Out(y_dest, x_dest) = In(y_src, x_src);
            end
        end
    end
end