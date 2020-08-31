% fonction per : p�riodogramme
%
% [Sper, f] = per(x,w,Fs), avec:
%   x : signal
%   w : fen�tre (vecteur de la m�me taille de x)
%   Fs : fr�quence d'�chantillonage

function [Sper, f] = per(x,w,Fs)

    N = length(x);
    Sper = 10*log10(((abs(fft(x.*w,N*2))).^2)/N);
    Sper = Sper(1:N); % on prend juste la moiti� du p�riodogramme
    f = linspace(0,Fs/2,N)'; % vecteur des fr�quences
    
end