function H = Hamilton(N,J,loop)
%HAMILTON 生成哈密顿量
%  N：粒子数
%  J：耦合常数
%  loop:是否组成闭环

arguments
    N (1,1) int16 {mustBePositive}
    J (1,1) double {mustBePositive} = 1
    loop (1,1) = false
end

H=zeros(N,N);

if loop
    max=N;
else
    max=N-1;
end

for j=1:max
    H=H+ada_hc(N,j);
end

H=-H*J;

end

