function [Out] =  Shear(In, Xshear, Yshear)
    % Image initialisation
    [rows, cols] = size(In);
    Out = zeros(rows, cols);
    
    % Rotation center
    xc = cols / 2;
    yc = rows / 2;

    S = [1,     Xshear;
        Yshear, 1];

    S_inv = inv(S);

    Tc = [xc; yc];

    for y_dest = 1:rows
        for x_dest = 1:cols
            V_dest = [x_dest; y_dest];
            V_src = S_inv * (V_dest - Tc) + Tc;

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