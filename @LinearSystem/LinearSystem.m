%## -*- texinfo -*-
%## @deftypefn  {Function File} {} LinearSystem ()
%## Create a LinearSystem object representing a linear system
%##
%## @example
%## diff(x,t)=Ax+Bu
%##         y=Cx+Du
%## @end example
%##
%## @noindent
%## from a set of matrices [A, B, C, D]. 
%##
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
%##
%## @end deftypefn

% class constructor
function obj = LinearSystem(A,B,C,D)

if nargin == 4
    obj.A = A;
    obj.B = B;
    obj.C = C;
    obj.D = D;
    obj.nx = size(A,1);
    obj.nu = size(B,2);
    obj.ny = size(C,1);
    
elseif nargin == 3
    obj.A = randn(A,A)-2*eye(A);
    obj.B = randn(A,B);
    obj.C = randn(C,A);
    obj.D = randn(C,B);
    obj.nx = A;
    obj.nu = B;
    obj.ny = C;
elseif nargin == 1
    obj.A = randn(A,A)-2*eye(A);
    obj.B = randn(A,1);
    obj.C = randn(1,A);
    obj.D = randn(1,1);
    obj.nx = A;
    obj.nu = 1;
    obj.ny = 1;
else
    obj.A = randn(2,2)-2*eye(2);
    obj.B = randn(2,1);
    obj.C = randn(1,2);
    obj.D = randn(1,1);
    obj.nx = 2;
    obj.nu = 1;
    obj.ny = 1;
end%if
%endfunction