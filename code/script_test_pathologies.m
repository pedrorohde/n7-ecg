% script pour faire les tests statistiques sur un ECG et indiquer les
% possibles pathologies (� utiliser apr�s avoir d�fini les seuils de
% det�ction avec script_seuils_pathologies.m)

PFA = .005; % probabilit� de fausse alarme

% on prend un ECG et ses complexes QRS
scriptQRS;

% on normalise les valeurs de nombre d'�chantillons
QRS_width = QRS_width/Fs;
diff_Q = diff(Q_loc/Fs);

% on prend les variances pour calculer les seuils
load('sigmas_seuil.mat');

% on calcule les seuils de d�tection
% S = sigma^2 * fonction de repartition chi-carr�e inverse de 1-PFA
Salpha_QRS = sigma2_QRS_sain*chi2inv(1-PFA,length(QRS_width)-1);
Salpha_diffQ = sigma2_diff_Q_sain*chi2inv(1-PFA,length(diff_Q)-1);

% on calcule le rythme en bpm
freq_Q = 60./diff_Q;

% statistiques des tests pour la det�ction des rythmes hors les fr�quences normales
T60 = sqrt(length(freq_Q))*(mean(freq_Q)-60)/std(freq_Q); % test rythme < 60bpm
T100 = sqrt(length(freq_Q))*(mean(freq_Q)-100)/std(freq_Q); % test rythme > 100bpm

% seuil de detection pour le test des moyennes (distribution t-Student)
T = tcdf(PFA,length(freq_Q)-1);

% test de Neyman-Pearson
% on rejette H0 si la somme des x^2 > seuil
path_QRS = sum((QRS_width-mean(QRS_width)).^2) > Salpha_QRS;
path_diff_Q = sum((diff_Q-mean(diff_Q)).^2) > Salpha_diffQ;

% on rejette H0 si les statistiques du test de moyenne de rythme sont
% au-dela des seuils
path60 = T60 < -T;
path100 = T100 > T;

path = path_QRS | path_diff_Q | path60 | path100;

if(path)
    fprintf('\npathologie d�tect�e\n');
else
    fprintf('\naucune pathologie d�tect�e\n');
end

% on affiche les statistiques m�sur�es
fprintf('variance longueur QRS mesur�e =\t%0.4g\n',var(QRS_width));
fprintf('variance longueur QRS sain =\t%0.4g\n',sigma2_QRS_sain);
fprintf('variance rythme mesur�e =\t%0.4g\n',var(diff_Q));
fprintf('variance rythme sain =\t\t%0.4g\n',sigma2_diff_Q_sain);
fprintf('rythme mesur� =\t\t%0.4g bpm\n',mean(freq_Q));
fprintf('rythme normal: \t\t[60, 100] bpm\n');