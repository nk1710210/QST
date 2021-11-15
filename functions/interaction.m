function H = interaction(H, i, j, J)
    %在哈密顿量H中增加ij两粒子间的相互作用，强度为J
    arguments
        H (:, :)
        i int16
        j int16
        J (1, 1) = 1
    end

    H(i, j) = H(i, j) + J;
    H(j, i) = H(j, i) + conj(J);

end
