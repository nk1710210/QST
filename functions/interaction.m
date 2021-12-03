function H = interaction(H, i, j, J)
    %H_ij=J, H_ji=J*
    arguments
        H (:, :)
        i int16
        j int16
        J (1, 1) = 1
    end

    H(i, j) = J;
    H(j, i) = conj(J);

end
