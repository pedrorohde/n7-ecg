% script pour gen�rer un sinus bruit� et puis le filtrer avec un filtre �
% encoche

close all;

N = 2000; % nombre de points des signaux utilises
sigma = 0.05; % ecart-type du bruit blanc gaussien
b = sigma*randn(N,1); % bruit blanc gaussien

% definition du signal
Fe = 200; % frequence d'echantillonage
t = (0 : 1/Fe : (N-1)/Fe)'; % vecteur temps (N points a Fe points/seconde)
f = 60; % frequence du sinus
s = sin(2*pi*f*t); % sinus (signal non-bruite)
x = s + b; % ajout du bruit gaussien au signal

f0 = 60; % fr�quence de coupure du filtre (on coupe les 60Hz)
epsilon = 0.9; % s�l�ctivit� du filtre (voir script_encoche.m)

y = filt_alim(x,Fe,f0,epsilon);

% choix de la fenetre pour les p�riodogrammes
w = ones(size(x));
% w = hanning(N);

[Pxx, Fxx] = per(x,w,Fe);
[Pyy, Fyy] = per(y,w,Fe);
[Scorx, Fcorx] = cor(x,'unbiased',Fe);
[Ycory, Fcory] = cor(y,'unbiased',Fe);

figure;
subplot(1,2,1); plot(Fxx,Pxx,Fyy,Pyy);
xlabel('fr�quence [Hz]'); ylabel('magnitude [dB]');
legend('signal d''entr�e (bruit�)', 'signal filtr�');
legend('Location','northwest');
txt = ['P�riodogramme du sinus bruit� et d�bruit�, \epsilon = ',num2str(epsilon)];
title(txt); grid;

subplot(1,2,2); plot(Fcorx,Scorx,Fcory,Ycory);
xlabel('fr�quence [Hz]'); ylabel('magnitude [dB]');
legend('signal d''entr�e (bruit�)', 'signal filtr�');
legend('Location','northwest');
txt = ['Corr�logramme (non-biais�) du sinus bruit� et d�bruit�, \epsilon = ',num2str(epsilon)];
title(txt); grid;