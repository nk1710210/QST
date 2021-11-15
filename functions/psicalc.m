function [t,psi] = psicalc(H,psi0,tmax,method,varargin)
if strcmp(method,'ode')
    if nargin == 5
        opts = varargin{1};
        tspan = [0, tmax];
        [t, psi] = ode113(@(t, psi) -1i * H * psi, tspan, psi0, opts);
    else
        tspan = [0, tmax];
        [t, psi] = ode113(@(t, psi) -1i * H * psi, tspan, psi0);
    end
elseif strcmp(method,'expm')
    Nt = varargin{1};
    [t,psi] = psicalc_expm(H,psi0,tmax,Nt);
elseif strcmp(method,'eig')
    Nt = varargin{1};
    VEC = varargin{2};
    D = varargin{3};
    [t,psi] = psicalc_eig(VEC,D,psi0,tmax,Nt);
end
end