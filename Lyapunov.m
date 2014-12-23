% Lyapunov stability analysis for linear systems

function P = Lyapunov(sys,options)

n = sys.nx;
I = eye(n);

% Create and solve the Lyapunov inequality
cvx_begin sdp
    variable P(n,n) symmetric
    minimize ( trace(P) )
	  P >= I
    sys.A'*P+P*sys.A <= - I;
cvx_end