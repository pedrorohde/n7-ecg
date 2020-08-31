% script pour enlever le bruit engendré par l'alimentation d'un signal ECG

close all;

load ECG60_2; % le signal ECG perturbé par l'alimentation à 60Hz
f0 = 60; % fréquence de coupure du filtre (on coupe ces 60Hz)
epsilon = 0.1; % séléctivité du filtre (voir script_encoche.m)

N = length(ecg); % taille du signal

% choix de la fenetre pour les périodogrammes
w = ones(size(ecg));
% w = hanning(N);

[Pecg, fecg] = per(ecg,w,Fs); % périodogramme de l'ECG (avant filtrage)
[Scor_ecg, fcor_ecg] = cor(ecg,'unbiased',Fs); % corrélogramme de l'ECG (avant filtrage)

y_ECG60_2 = filt_alim(ecg,Fs,f0,epsilon); % filtrage des 60Hz (voir filt_alim.m)

figure;

% périodogramme de l'ECG filtré
[Pyy_ECG60_2, f_ECG60_2] = per(y_ECG60_2,w,Fs);
subplot(1,2,1); plot(fecg,Pecg, f_ECG60_2,Pyy_ECG60_2);
xlabel('fréquence [Hz]'); ylabel('magnitude [dB]');
legend('signal d''entrée (bruité)', 'signal filtré');
title('Périodogramme de l''ECG bruité et débruité');
axis([min(fecg), max(fecg), -30, 110]);
grid;

% corrélogramme de l'ECG filtré
[Scor_ECG60_2, f_ECG60_2] = cor(y_ECG60_2,'unbiased',Fs);
subplot(1,2,2); plot(fcor_ecg,Scor_ecg, f_ECG60_2,Scor_ECG60_2);
xlabel('fréquence [Hz]'); ylabel('magnitude [dB]');
legend('signal d''entrée (bruité)', 'signal filtré')
title('Corrélogramme (non-biaisé) de l''ECG bruité et débruité');
axis([min(fecg), max(fecg), 50, 80]);
grid;