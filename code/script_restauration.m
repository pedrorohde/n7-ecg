% script qui enlève des échantillons d'un signal ECG et puis le reconstruit
% avec l'algorithme de Papoulis-Gerchberg

close all;

load ECG60_2;

N = length(ecg);
xnf = ecg; % xnf : x non-filtré

MSE = zeros(201,1); % vecteur des MSE à chaque itération

% filtre passe bas 30Hz
% l'algorithme a besoin d'un signal dont la DSP est limitée
X = fft(xnf);
X(floor(30*(N)/Fs):end) = 0;
xf = real(ifft(X)); % xf : x filtré

x = xf;

a = 115;
b = 130;
x(a:b) = 0; % on enlève quelques échantillons
x_perdu = x; % x_perdu : x avec des échantillons perdus


x(a:b) = linspace(x(a-1),x(b+1),b-a+1); % interpolation lineaire (initialisation)
MSE(1) = (xf-x)'*(xf-x)/length(xf); % MSE de la première approximation


% algorithme de papoulis-gerchberg
for i = 1:200
    Y = fft(x); % on passe au domaine fréquentiel
    Y(floor(30*N/Fs):end-floor(30*N/Fs)) = 0; % on met à 0 le contenu spectral hors la bande d'interêt
    y = ifft(Y); % on revient au domaine temporel
    x(a:b) = y(a:b); % on prend juste les échantillons qui étaient perdus
    MSE(i+1) = (xf-real(x))'*(xf-real(x))/length(xf); % MSE (entre x filtré et restauré) à chaque itération
end

x = real(x);

% figures
figure; 

subplot(2,2,1); hold on;
plot(xf); plot(x_perdu);
legend('signal original','signal échantillons perdus');
xlabel('échantillons');
title('Échantillons perdus');
axis([100 200 1000 3000]);
grid; hold off;

subplot(2,2,2); hold on;
plot(xf); plot(x);
legend('signal original','signal restauré');
xlabel('échantillons');
title('Restauration des échantillons perdus');
axis([110 140 1980 2050]);
grid; hold off;

subplot(2,2,[3,4]); semilogy(MSE);
xlabel('itération'); ylabel('MSE');
title('Erreur quadratique moyenne de la restauration');
axis([0, 200, 0, max(MSE)]);
grid;

