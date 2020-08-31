% filtre pour couper la fr�quence de l'alimentation de l'ECG
% entr�es:
%   x: signal � filtrer
%   Fs: fr�quence d'�chantillonage
%   f0: fr�quence de l'alimentation
%   epsilon: facteur de s�lectivit�


function y = filt_alim(x,Fs,f0,epsilon)
    
    % filtre � encoche:
    f0 = f0/Fs; % normalisation de la frequence
    w0 = 2*pi*f0; % frequence en rad/s
    a1 = -2*cos(w0); % coefficient a1
    B = [1, a1, 1]; % numerateur de la transmittance (ne depend pas de epsilon)
    A = [1, (1-epsilon)*a1, (1-epsilon)^2]; % denominateur de la transmittance

    y = filter(B,A,x);

end