function plotpsi2d(psi, t, N, clim)
    %plotpsi2d 绘制psi随时间变化的图像
    %   此处显示详细说明
    arguments
        psi (:,:)
        t (1,:)
        N (1,1)
        clim (1, :) = 0
    end

    x = [1, N];
    y = [t(end), 0];
    C = zeros(length(t), N);

    for ii = 1:length(t)
        C(length(t) + 1 - ii, :) = abs(psi(ii, :)).^2; %图片形式，行标要反过来
    end

    if clim == 0
        imagesc(x, y, C)
    else
        imagesc(x, y, C, clim)
    end

    xlabel('N')
    ylabel('t')
    axis xy
    %colorbar
end
