function A = ada_hc(N, j)
    %ada_hc 输出a_j^{dagger}a_{j+1}+h.c.的矩阵
    %  N:粒子数
    %  j:编号

    arguments
        N (1, 1) int16 {mustBePositive}
        j (1, 1) int16 {mustBePositive}
    end

    A = zeros(N, N);

    if j < N
        A(j, j + 1) = 1;
        A(j + 1, j) = 1;
    elseif j == N
        A(j, 1) = 1;
        A(1, j) = 1;
    else
        j = mod(j, N);
        A(j, j + 1) = 1;
        A(j + 1, j) = 1;
    end

end
