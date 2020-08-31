## Instructions (in French)

lancer le script `DEMO.m` pour éxecuter tous les scripts.

1 - `script_SNRdivers.m`: regarder l'effet de différents SNRs pour le sinus bruité

2 - `script_bruit.m`: analyse spectrale d'un sinus bruité

3 - `script_encoche.m`: regarder l'effet de la séléctivité (epsilon) dans la transmittance du filtre à encoche

4 - `script_sinus_debruitage.m`: genérer un sinus bruité et puis le filtrer avec un filtre à encoche

5 - `script_ecg_filt_alim.m`: enlever le bruit engendré par l'alimentation d'un signal ECG

6 - `script_restauration.m`: enlève des échantillons d'un signal ECG et puis le reconstruit avec l'algorithme de Papoulis-Gerchberg

7 - `scriptQRS`: detécter et afficher les complexes QRS d'un ECG

8 - `script_seuils_pathologies.m`: calculer les variances pour les seuils auvegarde ces variances dans le fichier sigmas_seuil.mat

9 - `script_test_pathologies.m`: faire les tests statistiques sur un ECG et indiquer les possibles pathologies (à utiliser après avoir défini les seuils de detéction avec script_seuils_pathologies.m)


fonctions:

`cor.m`: corrélogramme
`per.m`: périodogramme
`filt_alim`: filtre à encoche
