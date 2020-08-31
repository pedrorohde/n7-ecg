% fonction cor : corrélogramme
%
% [Scor, f] = cor(x,w,biais), avec:
%   x : signal
%   biais : 'biased' ou 'unbiased'
%   Fs : fréquence d'échantillonage

function [Scor, f] = cor(x,biais,Fs)
    
%     N = length(x);
%     Kx = xcorr(x,biais);
%     Kx = [Kx(N:end); Kx(1:N-1)];
%     Scor = 10*log10(fft([Kx(1:N); zeros(2*N+1,1); Kx(N:-1:2)]));
%     Scor = real(Scor(1:2*N));
%     f = linspace(0,Fs/2,2*N);

    N = length(x);
    Kx = xcorr(x,biais);
    Kx = [Kx(N:end); 0; Kx(end:-1:N+1)];
    Scor = 10*log10(fft(Kx,2*N));
    Scor = real(Scor(1:N));
    f = linspace(0,Fs/2,N)';

end