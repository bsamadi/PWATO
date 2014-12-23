% Lyapunov stability analysis for a random linear system

sys = LinearSystem(3);
P = Lyapunov(sys);
eig(sys.A)