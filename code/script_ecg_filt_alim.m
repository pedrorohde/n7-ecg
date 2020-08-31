% script pour enlever le bruit engendr� par l'alimentation d'un signal ECG

close all;

load ECG60_2; % le signal ECG perturb� par l'alimentation � 60Hz
f0 = 60; % fr�quence de coupure du filtre (on coupe ces 60Hz)
epsilon = 0.1; % s�l�ctivit� du filtre (voir script_encoche.m)

N = length(ecg); % taille du signal

% choix de la fenetre pour les p�riodogrammes
w = ones(size(ecg));
% w = hanning(N);

[Pecg, fecg] = per(ecg,w,Fs); % p�riodogramme de l'ECG (avant filtrage)
[Scor_ecg, fcor_ecg] = cor(ecg,'unbiased',Fs); % corr�logramme de l'ECG (avant filtrage)

y_ECG60_2 = filt_alim(ecg,Fs,f0,epsilon); % filtrage des 60Hz (voir filt_alim.m)

figure;

% p�riodogramme de l'ECG filtr�
[Pyy_ECG60_2, f_ECG60_2] = per(y_ECG60_2,w,Fs);
subplot(1,2,1); plot(fecg,Pecg, f_ECG60_2,Pyy_ECG60_2);
xlabel('fr�quence [Hz]'); ylabel('magnitude [dB]');
legend('signal d''entr�e (bruit�)', 'signal filtr�');
title('P�riodogramme de l''ECG bruit� et d�bruit�');
axis([min(fecg), max(fecg), -30, 110]);
grid;

% corr�logramme de l'ECG filtr�
[Scor_ECG60_2, f_ECG60_2] = cor(y_ECG60_2,'unbiased',Fs);
subplot(1,2,2); plot(fcor_ecg,Scor_ecg, f_ECG60_2,Scor_ECG60_2);
xlabel('fr�quence [Hz]'); ylabel('magnitude [dB]');
legend('signal d''entr�e (bruit�)', 'signal filtr�')
title('Corr�logramme (non-biais�) de l''ECG bruit� et d�bruit�');
axis([min(fecg), max(fecg), 50, 80]);
grid;