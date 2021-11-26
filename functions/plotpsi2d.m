function plotpsi2d(psi, t, N)
    %plotpsi2d 绘制psi随时间变化的图像
    %   此处显示详细说明
    x = [1, N];
    y = [t(end), 0];
    C = zeros(length(t), N);

    for ii = length(t)
        C(N + 1 - ii, :) = abs(psi(ii, :)).^2; %图片形式，行标要反过来
    end

    image(x, y, C, 'CDataMapping', 'scaled')

    xlabel('N')
    ylabel('t')
    colorbar
end
