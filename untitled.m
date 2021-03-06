N = 300;
J = 100;
tmax = 5;
tspan = [0, tmax];
Nt = 100;
NA = 100;
NV = 150;
phi = pi / 2;
alpha = 0.05;
delta = 2 * sqrt(log(2)) / alpha;
loop = 1;
iii = 1;
Vs = (0:0.1:2) * J;

for V = Vs

    psi0 = GaussianState(N, NA, phi, delta);
    H = Hamilton(N, J, loop);
    H(NV, NV) = V;

    for ii = (N - 50):N
        H(ii, ii) = -1 * (abs(ii - N + 50))^1 * 1i;
    end

    for ii = 1:50
        H(ii, ii) = -1 * (abs(ii - 50))^1 * 1i;
    end

    % tic
    % [t,psi] = ode45(@(t,psi) -1i*H*psi, tspan, psi0);
    % toc

    tic
    [VEC, D] = eig(H);
    t = linspace(0, tmax, Nt);
    psi = zeros(Nt, N);

    for i = 1:Nt
        expH = VEC * diag(exp(diag(D * t(i) * -1i))) / VEC;
        psi(i, :) = expH * psi0;
    end

    toc

    p = vecnorm(psi(:, NV:N), 2, 2); %右边一半的波函数概率总和
    T(iii) = max(p);
    %fprintf('T=%f\n',T)
    iii = iii + 1;
end

scatter(Vs, T)
hold on
plot(Vs, 4 ./ (4 + (Vs / J).^2))
hold off
% figure(1)
% plotpsi(psi,t,N)
% figure(2)
% plot(t,p);
