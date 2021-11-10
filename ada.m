function A = ada(N,j)
%ada 输出a_j^{dagger}a_{j+1}的矩阵
%  N:粒子数
%  j:编号
A=zeros(N,N);
A(j,mod(j+1,N))=1;
end

