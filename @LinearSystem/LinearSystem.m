%## -*- texinfo -*-
%## @deftypefn  {Function File} {} LinearSystem ()
%## @deftypefnx {Function File} {} LinearSystem (@var{a})
%## Create a LinearSystem object representing a linear system
%##
%## @example
%## diff(x,t)=Ax+Bu
%##         y=Cx+Du
%## @end example
%##
%## @noindent
%## from a set of matrices [A, B, C, D].
%## @end deftypefn

function obj = LinearSystem(A,B,C,D)
% class constructor
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