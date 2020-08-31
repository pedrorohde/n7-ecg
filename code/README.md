## Instructions (in French)

lancer le script `DEMO.m` pour �xecuter tous les scripts.

1 - `script_SNRdivers.m`: regarder l'effet de diff�rents SNRs pour le sinus bruit�

2 - `script_bruit.m`: analyse spectrale d'un sinus bruit�

3 - `script_encoche.m`: regarder l'effet de la s�l�ctivit� (epsilon) dans la transmittance du filtre � encoche

4 - `script_sinus_debruitage.m`: gen�rer un sinus bruit� et puis le filtrer avec un filtre � encoche

5 - `script_ecg_filt_alim.m`: enlever le bruit engendr� par l'alimentation d'un signal ECG

6 - `script_restauration.m`: enl�ve des �chantillons d'un signal ECG et puis le reconstruit avec l'algorithme de Papoulis-Gerchberg

7 - `scriptQRS`: det�cter et afficher les complexes QRS d'un ECG

8 - `script_seuils_pathologies.m`: calculer les variances pour les seuils auvegarde ces variances dans le fichier sigmas_seuil.mat

9 - `script_test_pathologies.m`: faire les tests statistiques sur un ECG et indiquer les possibles pathologies (� utiliser apr�s avoir d�fini les seuils de det�ction avec script_seuils_pathologies.m)


fonctions:

`cor.m`: corr�logramme
`per.m`: p�riodogramme
`filt_alim`: filtre � encoche
