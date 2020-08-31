% script pour regarder l'effet de diff�rents SNRs pour le sinus bruit�

N = 2000;
% on prend une fr�quence d'�chantillonage plus grande pour bien voir
% l'effet du bruit sur le sinus
Fe = 6000;
t = (0 : 1/Fe : (N-1)/Fe)'; % vecteur temps
f = 60; % fr�quence du sinus
s = sin(2*pi*f*t); % sinus
sigma = [0, 0.1, 1]; % �cart-types du bruit

figure; hold on;
for i=1:3
    b = sigma(i)*randn(N,1); % on calcule le bruit pour chaque �cart-type
    x = s + b; % ajout du bruit sur le sinus
    SNR = 10*log10((s'*s)/(b'*b)); % rapport signal sur bruit
    txt = ['SNR = ',num2str(SNR)];
    plot(t,x,'-','DisplayName',txt);
end
xlabel('temps [s]'); ylabel('signal');
title('Sinus bruit� � SNRs divers');
legend show;
axis([0 0.02 -3 3])
hold off;
legend('Location','southwest');