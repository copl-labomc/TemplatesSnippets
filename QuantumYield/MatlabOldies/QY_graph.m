function [G_vide, G_plein]= QY_graph(l_1,p_1,l_2,p_2,l_3,p_3)
% Fichier fonction pour tracer les graphiques des mesures prises avec la sphère
% intégratrice. Cette fonction pourra être utilisé dans l'interface
% graphique. 
%
% Les entrées sont les données prises par le spectromètre.
%
% Signification des entrées: 
%
% l_x : données de la sphère vide à la mesure x
% p_x : données de la sphère avec l'échantillon à la mesure x
%
% Il est important d'enregistrer les données en «Tab delemited, no headers»
% et d'utiliser le même spectromètre durant toutes les mesures.
%
% Réalisé par Louis-Philippe Dallaire en 2017

% Réalisation du graphique des lasers (sphère intégratrice vide)
G_vide = figure;
plot(l_1(:,1),l_1(:,2),l_2(:,1),l_2(:,2),l_3(:,1),l_3(:,2));
title('Empty Sphere');
xlabel('Wavelength');
ylabel('Intensity of spectrometer');
legend('Measurement 1','Measurement 2','Measurement 3');

% Réalisation du graphique des PL (sphère intégratrice avec échantillon)

G_plein = figure;
plot(p_1(:,1),p_1(:,2),p_2(:,1),p_2(:,2),p_3(:,1),p_3(:,2));
title('Sphere with Sample');
xlabel('Wavelength');
ylabel('Intensity of spectrometer');
legend('Measurement 1','Measurement 2','Measurement 3');
end