%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Spinswitching code was written by Guoping Zhang and Yihua Bai at     
% Indiana State University, USA, May 4, 2015, supported by U. S. 
% Department of Energy grant,  Contract No. DE-FG02-06ER46304.
%
%
% This code is based on the paper G. P. Zhang, Y. H. Bai and Thomas F. 
% George, "A new and simple model for magneto-optics   uncovers an 
% unexpected spin switching", EPL, 112 (2015) 27001. This code can be 
% extended to include exchange interactions, see G. P. Zhang, Y. H. Bai
% and Thomas F. George, "Switching ferromagnetic spins by an ultrafast 
% laser pulse: Emergence of giant optical spin-orbit torque", EPL, 115 
% (2016) 57003. 
%
%
% This code is free of charge to anyone who is interested in 
% all-optical spin switching. 
% It is copyrighted by  Guoping Zhang and Yihua Bai, (2019). 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

function Fv=funcl(t,Y)
%constants
echarge=1.60217653;
emass=9.1093826;
h=6.62606957;
constant=(2*pi/h)^2*echarge*emass*0.01; 
eh=2*pi*echarge/h;
em=echarge/emass*100.0;

% position of the electron
xx=Y(1);
yy=Y(2);
zz=Y(3);

% spin of the electron
sx=Y(7);
sy=Y(8);
sz=Y(9);

% system parameters
soc=0.06;
gamma=0;

%laser parameters
tau=60;
amplitude=0.035;
photonenergy=1.6;
electronenergy=photonenergy;
omega0=2*pi*echarge*electronenergy/h;
w=2*pi*echarge*photonenergy/h;

%Left circularly polarized light 
asin=amplitude*exp(-t^2/tau^2)*sin(w*t);
acos=amplitude*exp(-t^2/tau^2)*cos(w*t);
ex=-asin;
ey=acos;
ez=0;                   
lx=Y(2)*Y(6)-Y(3)*Y(5);
ly=Y(3)*Y(4)-Y(1)*Y(6);
lz=Y(1)*Y(5)-Y(2)*Y(4);
Fv(1,1) = Y(4)+soc*eh*(zz*sy-yy*sz);
Fv(2,1) = Y(5)+soc*eh*(xx*sz-zz*sx);
Fv(3,1) = Y(6)+soc*eh*(yy*sx-xx*sy);
Fv(4,1) = -2*gamma*Y(4)-omega0^2*Y(1)+em*ex+soc*eh*(Y(8)*Y(6)-Y(9)*Y(5));
Fv(5,1) = -2*gamma*Y(5)-omega0^2*Y(2)+em*ey+soc*eh*(Y(9)*Y(4)-Y(7)*Y(6));
Fv(6,1) = -2*gamma*Y(6)-omega0^2*Y(3)+em*ez+soc*eh*(Y(7)*Y(5)-Y(8)*Y(4));
Fv(7,1) = soc*constant*(ly*Y(9)-lz*Y(8));
Fv(8,1) = soc*constant*(lz*Y(7)-lx*Y(9));
Fv(9,1) = soc*constant*(lx*Y(8)-ly*Y(7));



