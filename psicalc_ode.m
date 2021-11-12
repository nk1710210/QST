function [t,psi] = psicalc_ode(H,psi0,tmax)

tspan=[0,tmax];
[t,psi] = ode113(@(t,psi) -1i*H*psi, tspan, psi0);

end

