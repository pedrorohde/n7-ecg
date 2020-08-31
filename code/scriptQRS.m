% script pour detécter et afficher les complexes QRS d'un ECG

close all;

% fonction qui donne les complexes QRS d'un ECG
[ecg,necg,lp_ecg,hp_ecg,deriv_ecg,sq_ecg,moy_ecg,Fs,R_loc,QRS_width,Q_loc,S_loc]=QRSdetection;

N = length(ecg);
t = linspace(0,N/Fs,N); % vecteur temps

% on trace l'ECG et on marque les Q, R et S
hold on;
plot(t,ecg,'HandleVisibility','off');
plot(t(Q_loc),ecg(Q_loc),'o','DisplayName','Q');
plot(t(R_loc),ecg(R_loc),'o','DisplayName','R');
plot(t(S_loc),ecg(S_loc),'o','DisplayName','S');
hold off;

title('Complexes QRS de l''ECG');
xlabel('temps [s]');
grid;
legend show;
legend('Location','southeast');