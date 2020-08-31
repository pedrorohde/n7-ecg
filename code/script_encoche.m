% script pour regarder l'effet de la séléctivité (epsilon) dans la
% transmittance du filtre à encoche

close all;

% parametres du filtre a encoche :
Fe = 200; % frequence d'echantillonage
f0 = 60; % frequence a eliminer

f0 = f0/Fe; % normalisation de la frequence
w0 = 2*pi*f0; % frequence en rad/s
a1 = -2*cos(w0); % coefficient a1

% on trace le filtre pour differents epsilons:
figure; hold on;
xlabel('fréquence [Hz]'); ylabel('magnitude [dB]');
title('Transmittance du filtre à encoche')
axis([0 100 -60 10]);

B = [1, a1, 1]; % numerateur de la transmittance (ne depend pas de epsilon)
for epsilon = 0.1 : 0.1 : 0.9 % boucle sur plusieurs valeurs de epsilon
    
    A = [1, (1-epsilon)*a1, (1-epsilon)^2]; % denominateur de la transmittance
    [H, F] = freqz(B,A,N,Fe); % calcul de la transmittance
    H = 20*log10(abs(H));
    txt = ['\epsilon = ',num2str(epsilon)];
    plot(F,H,'-','DisplayName',txt);
    
end

hold off;
legend show;
legend('Location','southwest');