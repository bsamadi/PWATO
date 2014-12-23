% Lyapunov stability analysis for a random linear system

%## There are four different ways of calling the LinearSystem command:
%## 1- Given A, B, C, D matrices, LinearSystem(A,B,C,D) returns the 
%##    corresponding linear system.
%## 2- Given the number of states (n), inputs (m) and outputs (p), 
%##    LinearSystem(n,m,p) returns a random linear system with the 
%##    given specifications.
%## 3- Given the number of states (n), LinearSystem(n) returns a 
%##    random linear system with n states, 1 input and 1 output. 
%## 4- Without any input argument, LinearSystem returns a random 
%##    linear system with 2 states, 1 input and 1 output.
sys = LinearSystem(3);

%## Solving a SDP to find a Lyapunov function for the linear system
P = Lyapunov(sys);

%## Verifying the result by computing the eigenvalues of sys.A
eig(sys.A)