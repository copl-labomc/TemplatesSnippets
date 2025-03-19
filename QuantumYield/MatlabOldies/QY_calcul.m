function [QY_1, QY_2,QY_3, QY_mean, QY_std] = QY_calcul (l_1,l_2,l_3,p_1,p_2,p_3, lambda_l1,lambda_l2,lambda_p1,lambda_p2)
% Fichier pour calculer la valeur du rendement quantique (Quantum yield, QY) a partir de données prises dans la sphère intégratrice. 
% Trois set de données doivent être pris. Chaque set de données comprend deux mesures:
% Une mesure de la sphère vide (seul le pique laser est affiché sur le
% spectromètre) et une mesure avec l'échantillon dans la sphère (le
% spectromètre affiche le pique laser et le pique de PL).
%
% Ce code pourra être utilisé dans l'interface graphique.
% 
% Pour que ce code fonctionne bien, il est important de prendre toutes les
% mesures avec le même spectromètre et d'enregistrer les données dans un
% fichier en « tab delimited, no headers». 
% Cela minimisera la manipulation des données nécessaire au bon fonctionemment du code.
%
% Significations des entrées et sorties: 
%
% QY_x : Valeur du QY à la mesure x
% QY_mean : Valeur moyenne des QY 
% QY_std : écart-type des QY 
% l_x : données de la sphère vide à la mesure x
% p_x : données de la sphère avec l'échantillon à la mesure x
% lambda_l1 : longueur d'onde marquant le début du pique laser
% lambda_l2 : longueur d'onde marquant la fin du pique laser
% lambda_p1 : longueur d'onde marquant le début du pique de PL
% lambda_p2 : longueur d'onde marquant la fin du pique de PL
%
% Attention: Ce code contient la calibration en intensité du
% spectromètre utilisé. Il est important de s'assurer que celle-ci est
% adéquate pour le spectromètre utilisé avec la sphère intégratrice.
%
% Réalisé par Louis-Philippe Dallaire en 2017 


% Détermination des dimensions des matrices de données et des bonds discrets de
% longueur d'ondes.

[n,~] = size(l_1);             % dimensions matrices
d_lambda = l_1(2,1)-l_1(1,1);  % bond de longueur d'onde

% Calibration en intensité du spectromètre

Cal = ones(1,n); % Vecteur de calibration. Note: Calibration temporaire et mauvaise!! Changer dans le code!! 

% Détermination des position des piques dans les matrices

diff_l1 = lambda_l1 - l_1(1,1);
n_l1 = round((diff_l1/d_lambda)) + 1; % Première longueur d'onde du pique laser

diff_l2 = lambda_l2 - l_1(1,1);
n_l2 = round((diff_l2/d_lambda)) + 1; % Deuxième longueur d'onde du pique laser

diff_p1 = lambda_p1 - l_1(1,1); 
n_p1 = round((diff_p1/d_lambda)) + 1; % Première longueur d'onde du pique de PL

diff_p2 = lambda_p2 - l_1(1,1); 
n_p2 = round((diff_p2/d_lambda)) + 1; % Deuxiéme longueur d'onde du pique de PL 

% Intégration discrète des piques lasers et PL pour l_1 et p_1

laser_l1 = 0; % Initialisation de la valeur du pique laser pour la sphère vide à la première mesure
laser_p1 = 0; % Initialisation de la valeur du pique laser pour la sphère pleine à la première mesure

for n = n_l1:n_l2
    laser_l1 = laser_l1 + ((l_1(n+1,1)-l_1(n,1))*l_1(n,2)*Cal(n)*l_1(n,1)); % somme pour laser_l1
    laser_p1 = laser_p1 + ((p_1(n+1,1)-p_1(n,1))*p_1(n,2)*Cal(n)*p_1(n,1)); % somme pour laser_p1
end

PL_l1 = 0; % Initialisation de la valeur du pique PL pour la sphère vide à la première mesure
PL_p1 = 0; % Initialisation de la valeur du pique PL pour la sphère pleine à la première mesure

for n = n_p1:n_p2
    PL_l1 = PL_l1 + ((l_1(n+1,1)-l_1(n,1))*l_1(n,2)*Cal(n)*l_1(n,1)); % somme pour PL_l1
    PL_p1 = PL_p1 + ((p_1(n+1,1)-p_1(n,1))*p_1(n,2)*Cal(n)*p_1(n,1)); % somme pour PL_p1
end

% Intégration discrète des piques lasers et PL pour l_2 et p_2

laser_l2 = 0; % Initialisation de la valeur du pique laser pour la sphère vide à la deuxième mesure
laser_p2 = 0; % Initialisation de la valeur du pique laser pour la sphère pleine à la deuxième mesure

for n = n_l1:n_l2
    laser_l2 = laser_l2 + ((l_2(n+1,1)-l_2(n,1))*l_2(n,2)*Cal(n)*l_2(n,1)); % somme pour laser_l2
    laser_p2 = laser_p2 + ((p_2(n+1,1)-p_2(n,1))*p_2(n,2)*Cal(n)*p_2(n,1)); % somme pour laser_p2
end

PL_l2 = 0; % Initialisation de la valeur du pique PL pour la sphère vide à la deuxième mesure
PL_p2 = 0; % Initialisation de la valeur du pique PL pour la sphère pleine à la deuxième mesure

for n = n_p1:n_p2
    PL_l2 = PL_l2 + ((l_2(n+1,1)-l_2(n,1))*l_2(n,2)*Cal(n)*l_2(n,1)); % somme pour PL_l2
    PL_p2 = PL_p2 + ((p_2(n+1,1)-p_2(n,1))*p_2(n,2)*Cal(n)*p_2(n,1)); % somme pour PL_p2
end

% Intégration discrète des piques lasers et PL pour l_3 et p_3

laser_l3 = 0; % Initialisation de la valeur du pique laser pour la sphère vide à la troisième mesure
laser_p3 = 0; % Initialisation de la valeur du pique laser pour la sphère pleine à la troisième mesure

for n = n_l1:n_l2
    laser_l3 = laser_l3 + ((l_3(n+1,1)-l_3(n,1))*l_3(n,2)*Cal(n)*l_3(n,1)); % somme pour laser_l3
    laser_p3 = laser_p3 + ((p_3(n+1,1)-p_3(n,1))*p_3(n,2)*Cal(n)*p_3(n,1)); % somme pour laser_p3
end

PL_l3 = 0; % Initialisation de la valeur du pique PL pour la sphère vide à la troisième mesure
PL_p3 = 0; % Initialisation de la valeur du pique PL pour la sphère pleine à la troisième mesure

for n = n_p1:n_p2
    PL_l3 = PL_l3 + ((l_3(n+1,1)-l_3(n,1))*l_3(n,2)*Cal(n)*l_3(n,1)); % somme pour PL_l3
    PL_p3 = PL_p3 + ((p_3(n+1,1)-p_3(n,1))*p_3(n,2)*Cal(n)*p_3(n,1)); % somme pour PL_p3
end

% Calcul des quantum yields pour les trois mesures 

QY_1 = (PL_p1-PL_l1)/(laser_l1-laser_p1); % Quantum yield de la première mesure 

QY_2 = (PL_p2-PL_l2)/(laser_l2-laser_p2); % Quantum yield de la deuxième mesure

QY_3 = (PL_p3-PL_l3)/(laser_l3-laser_p3); % Quantum yield de la troisième mesure

% Calcul de la moyenne et de l'écart-type des QY 

QY_mean = mean([QY_1 QY_2 QY_3]); % Calcul de la moyenne des QY

QY_std = std([QY_1 QY_2 QY_3]); % calcul de l'écart-type des QY

end