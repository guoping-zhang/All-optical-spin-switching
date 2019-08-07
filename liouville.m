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

dy0=[0;0;0;0;0;1;0;0;-2.2]; 
options = odeset('RelTol',1e-6,'AbsTol',1e-8);
[tv,Yv]=ode45('spinswitching', [-1000 1000], dy0, options);
plot (tv,Yv(:,7));
hold on
plot (tv,Yv(:,8));
plot (tv,Yv(:,9));
hold off
