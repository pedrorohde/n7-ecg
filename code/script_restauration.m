% script qui enl�ve des �chantillons d'un signal ECG et puis le reconstruit
% avec l'algorithme de Papoulis-Gerchberg

close all;

load ECG60_2;

N = length(ecg);
xnf = ecg; % xnf : x non-filtr�

MSE = zeros(201,1); % vecteur des MSE � chaque it�ration

% filtre passe bas 30Hz
% l'algorithme a besoin d'un signal dont la DSP est limit�e
X = fft(xnf);
X(floor(30*(N)/Fs):end) = 0;
xf = real(ifft(X)); % xf : x filtr�

x = xf;

a = 115;
b = 130;
x(a:b) = 0; % on enl�ve quelques �chantillons
x_perdu = x; % x_perdu : x avec des �chantillons perdus


x(a:b) = linspace(x(a-1),x(b+1),b-a+1); % interpolation lineaire (initialisation)
MSE(1) = (xf-x)'*(xf-x)/length(xf); % MSE de la premi�re approximation


% algorithme de papoulis-gerchberg
for i = 1:200
    Y = fft(x); % on passe au domaine fr�quentiel
    Y(floor(30*N/Fs):end-floor(30*N/Fs)) = 0; % on met � 0 le contenu spectral hors la bande d'inter�t
    y = ifft(Y); % on revient au domaine temporel
    x(a:b) = y(a:b); % on prend juste les �chantillons qui �taient perdus
    MSE(i+1) = (xf-real(x))'*(xf-real(x))/length(xf); % MSE (entre x filtr� et restaur�) � chaque it�ration
end

x = real(x);

% figures
figure; 

subplot(2,2,1); hold on;
plot(xf); plot(x_perdu);
legend('signal original','signal �chantillons perdus');
xlabel('�chantillons');
title('�chantillons perdus');
axis([100 200 1000 3000]);
grid; hold off;

subplot(2,2,2); hold on;
plot(xf); plot(x);
legend('signal original','signal restaur�');
xlabel('�chantillons');
title('Restauration des �chantillons perdus');
axis([110 140 1980 2050]);
grid; hold off;

subplot(2,2,[3,4]); semilogy(MSE);
xlabel('it�ration'); ylabel('MSE');
title('Erreur quadratique moyenne de la restauration');
axis([0, 200, 0, max(MSE)]);
grid;

