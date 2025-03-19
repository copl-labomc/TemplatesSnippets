function [G_vide, G_plein]= QY_graph(l_1,p_1,l_2,p_2,l_3,p_3)
% Fichier fonction pour tracer les graphiques des mesures prises avec la sph�re
% int�gratrice. Cette fonction pourra �tre utilis� dans l'interface
% graphique. 
%
% Les entr�es sont les donn�es prises par le spectrom�tre.
%
% Signification des entr�es: 
%
% l_x : donn�es de la sph�re vide � la mesure x
% p_x : donn�es de la sph�re avec l'�chantillon � la mesure x
%
% Il est important d'enregistrer les donn�es en �Tab delemited, no headers�
% et d'utiliser le m�me spectrom�tre durant toutes les mesures.
%
% R�alis� par Louis-Philippe Dallaire en 2017

% R�alisation du graphique des lasers (sph�re int�gratrice vide)
G_vide = figure;
plot(l_1(:,1),l_1(:,2),l_2(:,1),l_2(:,2),l_3(:,1),l_3(:,2));
title('Empty Sphere');
xlabel('Wavelength');
ylabel('Intensity of spectrometer');
legend('Measurement 1','Measurement 2','Measurement 3');

% R�alisation du graphique des PL (sph�re int�gratrice avec �chantillon)

G_plein = figure;
plot(p_1(:,1),p_1(:,2),p_2(:,1),p_2(:,2),p_3(:,1),p_3(:,2));
title('Sphere with Sample');
xlabel('Wavelength');
ylabel('Intensity of spectrometer');
legend('Measurement 1','Measurement 2','Measurement 3');
end