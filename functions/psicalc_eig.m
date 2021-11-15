function [t, psi] = psicalc_eig(VEC, D, psi0, tmax, Nt)

    t = linspace(0, tmax, Nt);
    psi = zeros(Nt, length(psi0));

    for ii = 1:Nt
        expH = VEC * diag(exp(diag(D * t(ii) * -1i))) / VEC;
        psi(ii, :) = expH * psi0;
    end

end
