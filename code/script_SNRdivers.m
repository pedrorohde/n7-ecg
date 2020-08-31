% script pour regarder l'effet de différents SNRs pour le sinus bruité

N = 2000;
% on prend une fréquence d'échantillonage plus grande pour bien voir
% l'effet du bruit sur le sinus
Fe = 6000;
t = (0 : 1/Fe : (N-1)/Fe)'; % vecteur temps
f = 60; % fréquence du sinus
s = sin(2*pi*f*t); % sinus
sigma = [0, 0.1, 1]; % écart-types du bruit

figure; hold on;
for i=1:3
    b = sigma(i)*randn(N,1); % on calcule le bruit pour chaque écart-type
    x = s + b; % ajout du bruit sur le sinus
    SNR = 10*log10((s'*s)/(b'*b)); % rapport signal sur bruit
    txt = ['SNR = ',num2str(SNR)];
    plot(t,x,'-','DisplayName',txt);
end
xlabel('temps [s]'); ylabel('signal');
title('Sinus bruité à SNRs divers');
legend show;
axis([0 0.02 -3 3])
hold off;
legend('Location','southwest');