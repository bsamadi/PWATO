## -*- texinfo -*-
## @deftypefn  {Function File} {} LinearSystem ()
## @deftypefnx {Function File} {} LinearSystem (@var{a})
## Create a LinearSystem object representing a linear system
##
## @example
## diff(x,t)=Ax+Bu
##         y=Cx+Du
## @end example
##
## @noindent
## from a set of matrices [A, B, C, D].
## @end deftypefn

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
                 obj.A = normrnd(0,1,[A,A]);
                 obj.B = normrnd(0,1,[A,B]);
                 obj.C = normrnd(0,1,[C,A]);
                 obj.D = normrnd(0,1,[C,B]);
                 obj.nx = A;
                 obj.nu = B;
                 obj.ny = C;
               elseif nargin == 1
                 obj.A = normrnd(0,1,[A,A]);
                 obj.B = normrnd(0,1,[A,1]);
                 obj.C = normrnd(0,1,[1,A]);
                 obj.D = normrnd(0,1,[1,1]);                   
                 obj.nx = A;
                 obj.nu = 1;
                 obj.ny = 1;
               elseif nargin == 0
                 obj.A = normrnd(0,1,[2,2]);
                 obj.B = normrnd(0,1,[2,1]);
                 obj.C = normrnd(0,1,[1,2]);
                 obj.D = normrnd(0,1,[1,1]);                   
                 obj.nx = 2;
                 obj.nu = 1;
                 obj.ny = 1;
               else
                 print_usage ();
               endif
endfunction