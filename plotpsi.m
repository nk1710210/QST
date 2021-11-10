function plotpsi(psi,t,N)
%plotpsi 绘制psi随时间变化的瀑布图
%   此处显示详细说明
X=zeros(length(t),N);
Y=X;
Z=X;                    %初始化网格坐标

% init_phase=exp((1:N)*1i*phi);
% psi_phase=zeros(length(t),N);
% for index=1:length(t)
%     psi_phase(index,:)=psi(index,:)./init_phase;
% end
% C=angle(psi_phase);           %以相位作为网格颜色

for index=1:length(t)
    X(index,:)=1:N;
    Y(index,:)=t(index);
    Z(index,:)=abs(psi(index,:)).^2;
end
waterfall(X,Y,Z)      
xlabel('N')
ylabel('t')
zlabel('|\psi|^2')
colorbar
view(45,30)


end

