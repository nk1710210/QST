function psi = GaussianState(N, NA, phi, delta)
    %GUASSIANSTATE 生成指定的高斯波包
    %  N：粒子数
    %  NA：中心位置
    %  phi：
    %  delta：波包半宽,delta=2sqrt(ln2)/alpha
    psi = zeros(N, 1);
    alpha = 2 * sqrt(log(2)) / delta;

    for j = 1:N
        psi(j) = exp((-alpha^2 * (j - NA)^2) / 2 +1i * phi * j);
    end

    psi = psi / norm(psi); %归一化
end
