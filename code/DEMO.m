% c'est possible aussi de lancer chaque script separament
% voir _README.txt pour des détails sur chaque script

close all;

disp('Appuyez sur Entrée pour lancer le script du sinus bruité à SNRs divers');
pause;
script_SNRdivers;

disp('Appuyez sur Entrée pour lancer le script d''analyse spectrale du sinus bruité');
pause;
script_bruit;

disp('Appuyez sur Entrée pour lancer le script du filtre à encoche');
pause;
script_encoche;

disp('Appuyez sur Entrée pour lancer le script de filtrage à encoche du sinus');
pause;
script_sinus_debruitage;

disp('Appuyez sur Entrée pour lancer le script de filtrage à encoche d''un ECG');
pause;
script_ecg_filt_alim;

disp('Appuyez sur Entrée pour lancer le script de restauration');
pause;
script_restauration;

disp('Appuyez sur Entrée pour lancer le script de detéction des complexes QRS');
pause;
scriptQRS;

disp('Appuyez sur Entrée pour lancer le script de définition des seuils de detéction');
disp('Merci de choisir l`ECG6 comme réference');
pause;
script_seuils_pathologies;

disp('Appuyez sur Entrée pour lancer le script de test des ECGs');
pause;
r = 1;
while(r==1)
    script_test_pathologies;
    r = input('Voulez-vous continuer? [1=oui/0=non] ');
end