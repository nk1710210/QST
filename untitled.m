N=200;
J=100;
tspan=[0,5];
NA=50;
phi=pi/2;
alpha=0.1;
delta=2*sqrt(log(2))/alpha;
loop=0;


psi0=GaussianState(N,NA,phi,delta);
H=Hamilton(N,J,loop);

for ii=150:200
    H(ii,ii)=-2*(ii-149)^2*1i;
end

tic
[t,psi] = ode45(@(t,psi) -1i*H*psi, tspan, psi0);
toc

figure(1)
plotpsi(psi,t,N)
figure(2)
plot(abs(psi(end,:)));