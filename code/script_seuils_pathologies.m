% script pour calculer les variances pour les seuils
% sauvegarde ces variances dans le fichier sigmas_seuil.mat

% on prend un ECG (ici, il doit être sain) et ses complexes QRS
scriptQRS;

% on normalise les valeurs de nombre d'échantillons
QRS_width = QRS_width/Fs;
Q_loc = Q_loc/Fs;

% variance de la durée des QRS
sigma2_QRS_sain = var(QRS_width);

% variance du rythme
diff_Q_sain = diff(Q_loc);
sigma2_diff_Q_sain = var(diff_Q_sain);

save('sigmas_seuil.mat','sigma2_QRS_sain','sigma2_diff_Q_sain');