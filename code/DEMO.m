% c'est possible aussi de lancer chaque script separament
% voir _README.txt pour des d�tails sur chaque script

close all;

disp('Appuyez sur Entr�e pour lancer le script du sinus bruit� � SNRs divers');
pause;
script_SNRdivers;

disp('Appuyez sur Entr�e pour lancer le script d''analyse spectrale du sinus bruit�');
pause;
script_bruit;

disp('Appuyez sur Entr�e pour lancer le script du filtre � encoche');
pause;
script_encoche;

disp('Appuyez sur Entr�e pour lancer le script de filtrage � encoche du sinus');
pause;
script_sinus_debruitage;

disp('Appuyez sur Entr�e pour lancer le script de filtrage � encoche d''un ECG');
pause;
script_ecg_filt_alim;

disp('Appuyez sur Entr�e pour lancer le script de restauration');
pause;
script_restauration;

disp('Appuyez sur Entr�e pour lancer le script de det�ction des complexes QRS');
pause;
scriptQRS;

disp('Appuyez sur Entr�e pour lancer le script de d�finition des seuils de det�ction');
disp('Merci de choisir l`ECG6 comme r�ference');
pause;
script_seuils_pathologies;

disp('Appuyez sur Entr�e pour lancer le script de test des ECGs');
pause;
r = 1;
while(r==1)
    script_test_pathologies;
    r = input('Voulez-vous continuer? [1=oui/0=non] ');
end