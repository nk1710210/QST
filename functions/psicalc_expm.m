function [t, psi] = psicalc_expm(H, psi0, tmax, Nt)

    t = linspace(0, tmax, Nt);
    psi = zeros(Nt, length(psi0));

    for ii = 1:Nt
        psi(ii, :) = transpose(expm(-1i * H * t(ii)) * psi0);
    end

end
