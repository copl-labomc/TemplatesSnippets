function [QY_1, QY_2,QY_3, QY_mean, QY_std] = QY_calcul (l_1,l_2,l_3,p_1,p_2,p_3, lambda_l1,lambda_l2,lambda_p1,lambda_p2)
% Fichier pour calculer la valeur du rendement quantique (Quantum yield, QY) a partir de donn�es prises dans la sph�re int�gratrice. 
% Trois set de donn�es doivent �tre pris. Chaque set de donn�es comprend deux mesures:
% Une mesure de la sph�re vide (seul le pique laser est affich� sur le
% spectrom�tre) et une mesure avec l'�chantillon dans la sph�re (le
% spectrom�tre affiche le pique laser et le pique de PL).
%
% Ce code pourra �tre utilis� dans l'interface graphique.
% 
% Pour que ce code fonctionne bien, il est important de prendre toutes les
% mesures avec le m�me spectrom�tre et d'enregistrer les donn�es dans un
% fichier en � tab delimited, no headers�. 
% Cela minimisera la manipulation des donn�es n�cessaire au bon fonctionemment du code.
%
% Significations des entr�es et sorties: 
%
% QY_x : Valeur du QY � la mesure x
% QY_mean : Valeur moyenne des QY 
% QY_std : �cart-type des QY 
% l_x : donn�es de la sph�re vide � la mesure x
% p_x : donn�es de la sph�re avec l'�chantillon � la mesure x
% lambda_l1 : longueur d'onde marquant le d�but du pique laser
% lambda_l2 : longueur d'onde marquant la fin du pique laser
% lambda_p1 : longueur d'onde marquant le d�but du pique de PL
% lambda_p2 : longueur d'onde marquant la fin du pique de PL
%
% Attention: Ce code contient la calibration en intensit� du
% spectrom�tre utilis�. Il est important de s'assurer que celle-ci est
% ad�quate pour le spectrom�tre utilis� avec la sph�re int�gratrice.
%
% R�alis� par Louis-Philippe Dallaire en 2017 


% D�termination des dimensions des matrices de donn�es et des bonds discrets de
% longueur d'ondes.

[n,~] = size(l_1);             % dimensions matrices
d_lambda = l_1(2,1)-l_1(1,1);  % bond de longueur d'onde

% Calibration en intensit� du spectrom�tre

Cal = ones(1,n); % Vecteur de calibration. Note: Calibration temporaire et mauvaise!! Changer dans le code!! 

% D�termination des position des piques dans les matrices

diff_l1 = lambda_l1 - l_1(1,1);
n_l1 = round((diff_l1/d_lambda)) + 1; % Premi�re longueur d'onde du pique laser

diff_l2 = lambda_l2 - l_1(1,1);
n_l2 = round((diff_l2/d_lambda)) + 1; % Deuxi�me longueur d'onde du pique laser

diff_p1 = lambda_p1 - l_1(1,1); 
n_p1 = round((diff_p1/d_lambda)) + 1; % Premi�re longueur d'onde du pique de PL

diff_p2 = lambda_p2 - l_1(1,1); 
n_p2 = round((diff_p2/d_lambda)) + 1; % Deuxi�me longueur d'onde du pique de PL 

% Int�gration discr�te des piques lasers et PL pour l_1 et p_1

laser_l1 = 0; % Initialisation de la valeur du pique laser pour la sph�re vide � la premi�re mesure
laser_p1 = 0; % Initialisation de la valeur du pique laser pour la sph�re pleine � la premi�re mesure

for n = n_l1:n_l2
    laser_l1 = laser_l1 + ((l_1(n+1,1)-l_1(n,1))*l_1(n,2)*Cal(n)*l_1(n,1)); % somme pour laser_l1
    laser_p1 = laser_p1 + ((p_1(n+1,1)-p_1(n,1))*p_1(n,2)*Cal(n)*p_1(n,1)); % somme pour laser_p1
end

PL_l1 = 0; % Initialisation de la valeur du pique PL pour la sph�re vide � la premi�re mesure
PL_p1 = 0; % Initialisation de la valeur du pique PL pour la sph�re pleine � la premi�re mesure

for n = n_p1:n_p2
    PL_l1 = PL_l1 + ((l_1(n+1,1)-l_1(n,1))*l_1(n,2)*Cal(n)*l_1(n,1)); % somme pour PL_l1
    PL_p1 = PL_p1 + ((p_1(n+1,1)-p_1(n,1))*p_1(n,2)*Cal(n)*p_1(n,1)); % somme pour PL_p1
end

% Int�gration discr�te des piques lasers et PL pour l_2 et p_2

laser_l2 = 0; % Initialisation de la valeur du pique laser pour la sph�re vide � la deuxi�me mesure
laser_p2 = 0; % Initialisation de la valeur du pique laser pour la sph�re pleine � la deuxi�me mesure

for n = n_l1:n_l2
    laser_l2 = laser_l2 + ((l_2(n+1,1)-l_2(n,1))*l_2(n,2)*Cal(n)*l_2(n,1)); % somme pour laser_l2
    laser_p2 = laser_p2 + ((p_2(n+1,1)-p_2(n,1))*p_2(n,2)*Cal(n)*p_2(n,1)); % somme pour laser_p2
end

PL_l2 = 0; % Initialisation de la valeur du pique PL pour la sph�re vide � la deuxi�me mesure
PL_p2 = 0; % Initialisation de la valeur du pique PL pour la sph�re pleine � la deuxi�me mesure

for n = n_p1:n_p2
    PL_l2 = PL_l2 + ((l_2(n+1,1)-l_2(n,1))*l_2(n,2)*Cal(n)*l_2(n,1)); % somme pour PL_l2
    PL_p2 = PL_p2 + ((p_2(n+1,1)-p_2(n,1))*p_2(n,2)*Cal(n)*p_2(n,1)); % somme pour PL_p2
end

% Int�gration discr�te des piques lasers et PL pour l_3 et p_3

laser_l3 = 0; % Initialisation de la valeur du pique laser pour la sph�re vide � la troisi�me mesure
laser_p3 = 0; % Initialisation de la valeur du pique laser pour la sph�re pleine � la troisi�me mesure

for n = n_l1:n_l2
    laser_l3 = laser_l3 + ((l_3(n+1,1)-l_3(n,1))*l_3(n,2)*Cal(n)*l_3(n,1)); % somme pour laser_l3
    laser_p3 = laser_p3 + ((p_3(n+1,1)-p_3(n,1))*p_3(n,2)*Cal(n)*p_3(n,1)); % somme pour laser_p3
end

PL_l3 = 0; % Initialisation de la valeur du pique PL pour la sph�re vide � la troisi�me mesure
PL_p3 = 0; % Initialisation de la valeur du pique PL pour la sph�re pleine � la troisi�me mesure

for n = n_p1:n_p2
    PL_l3 = PL_l3 + ((l_3(n+1,1)-l_3(n,1))*l_3(n,2)*Cal(n)*l_3(n,1)); % somme pour PL_l3
    PL_p3 = PL_p3 + ((p_3(n+1,1)-p_3(n,1))*p_3(n,2)*Cal(n)*p_3(n,1)); % somme pour PL_p3
end

% Calcul des quantum yields pour les trois mesures 

QY_1 = (PL_p1-PL_l1)/(laser_l1-laser_p1); % Quantum yield de la premi�re mesure 

QY_2 = (PL_p2-PL_l2)/(laser_l2-laser_p2); % Quantum yield de la deuxi�me mesure

QY_3 = (PL_p3-PL_l3)/(laser_l3-laser_p3); % Quantum yield de la troisi�me mesure

% Calcul de la moyenne et de l'�cart-type des QY 

QY_mean = mean([QY_1 QY_2 QY_3]); % Calcul de la moyenne des QY

QY_std = std([QY_1 QY_2 QY_3]); % calcul de l'�cart-type des QY

end