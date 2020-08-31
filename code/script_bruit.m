% script pour l'analyse spectrale d'un sinus bruit�

close all;

N = 2000; % nombre de points des signaux utilises
sigma = 0.05; % ecart-type du bruit blanc gaussien
b = sigma*randn(N,1); % bruit blanc gaussien
figure; histfit(b); % histogram
xlabel('X'); ylabel('Fonction de densit� de probabilit�');
title('Histogramme du bruit blanc Gaussian');

% definition du signal
Fe = 200; % frequence d'echantillonage
t = (0 : 1/Fe : (N-1)/Fe)'; % vecteur temps (N points a Fe points/seconde)
f = 60; % frequence du sinus
s = sin(2*pi*f*t); % sinus (signal non-bruite)
x = s + b; % ajout du bruit gaussien au signal
figure; plot(t,x);
xlabel('temps [s]'); ylabel('signal');
title(['Sinus bruit� (SNR = ',num2str(10*log10((s'*s)/(b'*b))),')']);

figure;

% periodogramme avec fenetre rectangulaire
w = ones(size(x));
[PxxR, FxxR] = per(x,w,Fe);
subplot(2,2,1); plot(FxxR,PxxR);
xlabel('fr�quence [Hz]'); ylabel('magnitude [dB]');
title('P�riodogramme du sinus bruit� (fen�tre rectangulaire)');
grid;

% periodogramme avec fenetre de Hanning
w = hanning(N);
[PxxH, FxxH] = per(x,w,Fe);
subplot(2,2,2); plot(FxxH,PxxH);
xlabel('fr�quence [Hz]'); ylabel('magnitude [dB]');
title('P�riodogramme du sinus bruit� (fen�tre de Hanning)');
grid;

% correlogramme biaise
[ScorB, FcorB] = cor(x,'biased',Fe);
subplot(2,2,3); plot(FcorB,ScorB);
xlabel('fr�quence [Hz]'); ylabel('magnitude [dB]');
title('Corr�logramme (biais�) du sinus bruit�');
grid;

% correlogramme non-biaise
[ScorU, FcorU] = cor(x,'unbiased',Fe);
subplot(2,2,4); plot(FcorU,ScorU);
xlabel('fr�quence [Hz]'); ylabel('magnitude [dB]');
title('Corr�logramme (non-biais�) du sinus bruit�');
grid;