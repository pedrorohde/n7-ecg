% fonction per : périodogramme
%
% [Sper, f] = per(x,w,Fs), avec:
%   x : signal
%   w : fenêtre (vecteur de la même taille de x)
%   Fs : fréquence d'échantillonage

function [Sper, f] = per(x,w,Fs)

    N = length(x);
    Sper = 10*log10(((abs(fft(x.*w,N*2))).^2)/N);
    Sper = Sper(1:N); % on prend juste la moitié du périodogramme
    f = linspace(0,Fs/2,N)'; % vecteur des fréquences
    
end