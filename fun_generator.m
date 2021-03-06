function [A] = fun_generator(x0, x1, t0 , t1 , h)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

dx0 = 0;
ddx0 = 0;
den=(2*(t0 - t1)^2*(t0^3 - 3*t0^2*t1 + 3*t0*t1^2 - t1^3)); %denominateur commun

Ax5 = (ddx0*t0^2 - 2*ddx0*t0*t1 - 6*dx0*t0 + ddx0*t1^2 + 6*dx0*t1 + 12*x0 - 12*x1)/(2*(t0 - t1)^2*(t0^3 - 3*t0^2*t1 + 3*t0*t1^2 - t1^3));
Ax4 = (30*t0*x1 - 30*t0*x0 - 30*t1*x0 + 30*t1*x1 - 2*t0^3*ddx0 - 3*t1^3*ddx0 + 14*t0^2*dx0 - 16*t1^2*dx0 + 2*t0*t1*dx0 + 4*t0*t1^2*ddx0 + t0^2*t1*ddx0)/(2*(t0 - t1)^2*(t0^3 - 3*t0^2*t1 + 3*t0*t1^2 - t1^3));
Ax3 = (t0^4*ddx0 + 3*t1^4*ddx0 - 8*t0^3*dx0 + 12*t1^3*dx0 + 20*t0^2*x0 - 20*t0^2*x1 + 20*t1^2*x0 - 20*t1^2*x1 + 80*t0*t1*x0 - 80*t0*t1*x1 + 4*t0^3*t1*ddx0 + 28*t0*t1^2*dx0 - 32*t0^2*t1*dx0 - 8*t0^2*t1^2*ddx0)/(2*(t0 - t1)^2*(t0^3 - 3*t0^2*t1 + 3*t0*t1^2 - t1^3));
Ax2 = -(t1^5*ddx0 + 4*t0*t1^4*ddx0 + 3*t0^4*t1*ddx0 + 36*t0*t1^3*dx0 - 24*t0^3*t1*dx0 + 60*t0*t1^2*x0 + 60*t0^2*t1*x0 - 60*t0*t1^2*x1 - 60*t0^2*t1*x1 - 8*t0^2*t1^3*ddx0 - 12*t0^2*t1^2*dx0)/(2*(t0^2 - 2*t0*t1 + t1^2)*(t0^3 - 3*t0^2*t1 + 3*t0*t1^2 - t1^3));
Ax1 = -(2*t1^5*dx0 - 2*t0*t1^5*ddx0 - 10*t0*t1^4*dx0 + t0^2*t1^4*ddx0 + 4*t0^3*t1^3*ddx0 - 3*t0^4*t1^2*ddx0 - 16*t0^2*t1^3*dx0 + 24*t0^3*t1^2*dx0 - 60*t0^2*t1^2*x0 + 60*t0^2*t1^2*x1)/(2*(t0 - t1)^2*(t0^3 - 3*t0^2*t1 + 3*t0*t1^2 - t1^3));
Ax0 = (2*x1*t0^5 - ddx0*t0^4*t1^3 - 10*x1*t0^4*t1 + 2*ddx0*t0^3*t1^4 + 8*dx0*t0^3*t1^3 + 20*x1*t0^3*t1^2 - ddx0*t0^2*t1^5 - 10*dx0*t0^2*t1^4 - 20*x0*t0^2*t1^3 + 2*dx0*t0*t1^5 + 10*x0*t0*t1^4 - 2*x0*t1^5)/(2*(t0^2 - 2*t0*t1 + t1^2)*(t0^3 - 3*t0^2*t1 + 3*t0*t1^2 - t1^3));


Ax6_2 =         -h/((t1/2)^3*(t1 - t1/2)^3);
Ax5_2 =    (3*t1*h)/((t1/2)^3*(t1 - t1/2)^3);
Ax4_2 =-(3*t1^2*h)/((t1/2)^3*(t1 - t1/2)^3);
Ax3_2 = (t1^3*h)/((t1/2)^3*(t1 - t1/2)^3); 

A = [Ax0 Ax1 Ax2 Ax3+Ax3_2 Ax4+Ax4_2 Ax5+Ax5_2 Ax6_2];

end

