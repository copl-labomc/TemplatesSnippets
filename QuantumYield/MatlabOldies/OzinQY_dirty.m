%QY calculations based on Ozin et al. 2012, DOI : 10.1002/lpor.201200077
%APPROX: QY independent of excitation wavelength
%Buy solid standards! Small Cie à retrouver, but check if NIST & friends have anything or even better, methods to recommand
%Download standard data from PhotochemCAD
%FOR METHO: Do not forget to correct by background substraction, prolly better to record it inpendently to not forget it, along with empty sphere measure, and correct in post-processing here
%FOR METHO: dispersion calibration with spectral lamp
%FOR METHO: Always make very sure the excitation peak is always clearly below the max, here 4000, and/or zoom in live to check
%...TO CHECK : correction for sampling converted in energy & compensating for detector non linearity increasing with higher signal might held 
%N.B. I wonder for metho if a (powerful enough) LED's or lamp broad spectrum (can put a filter or grating to select a narrower band) might not make easier to measure a small absorption especially when very high QY or big absorption (inner filter!) for small QY, thus can use very diluted samples... but might need to include dispersion/spectral response of input optics
%N.B. Examine overlap of excitation & emission, prolongation vs just cut in half & check vs sum. Play in laser vs LED argument.
%N.B. Should add frequency cut off for fast noise... vs smoothing, check effect vs signal/noise, WARNING : MUST NOT AFFECT LASER PEAK!!!
%N.B. Could absolute y-scale choice affect numerical error propagation?
%N.B. Possibility to apply correction for the reabsorption-inner filter effect, but I am dubious: <http://journals.plos.org/plosone/article?id=10.1371/journal.pone.0103878>,somewhere in there <http://pubs.acs.org/doi/abs/10.1021/jp2082853> and this thesis <https://ecommons.usask.ca/handle/10388/ETD-2012-11-765>, etc. This one is more convincing: <>
%N.B. Talk radiometry & photometry w/ Pierre and where to find relevant litterature, standards, etc.

%VARIABLES

%Spectra to be imported as the following vectors
% ilambda : Wavelength of all spectra
% iaEmpty : The excitation source incident inside the empty sphere
% ibnotBeam : The sample inside the sphere, but not directly in the path of the excitation/incident beam.
% icBeam : The sample inside the sphere and directly in the incident/exciting beam path.
% iCCD : CCD detector sensitivity response (to replace with IRF_spectral instrument response function_ including sphere in calibration with a soleil)
%if needed, scaling to same acquisition time (keep same units for all, here usec)
t_a=3000;  
tPL_b=10000000;
tEx_b=3000;
tPL_c=3000000;
tEx_c=40000;
%PreProcessing: patching data together first and removing baseline (-data...), urg should be done in lab with dark spectrum. Here choice of letting negative contribute to the integral or not
%CHECK: Demonstrate in QY math that all scaling/patching (assuming linear) by acquisition time does not affect result.
lambda=ilambda(163:1935);   %Chopping to fit the unappropriate CCD sensitivity calibration data :( FIX THIS ARG!

iaEmpty=data(:,2)-186;   %-data(index or end,2);
aEmpty=iaEmpty(163:1935);

ibnotBeamEx=data(1:index,2)-185;    %-data(index,2);
ibnotBeamPL=data(index+1:end,2)-195;  %-data(index+1,2);
bnotBeamPL=ibnotBeamPL.*tEx_b./tPL_b;
ibnotBeam=[ibnotBeamEx ; bnotBeamPL];
bnotBeam=ibnotBeam(163:1935).*t_a./tEx_b;

icBeamEx=data(1:index,2)-183;     %-data(index,2);
icBeamPL=data(index+1:end,2)-195;  %-data(index+1,2);
cBeamPL=icBeamPL.*tEx_c./tPL_c;
icBeam=[icBeamEx ; cBeamPL];
cBeam=icBeam(163:1935).*t_a./tEx_c;

%Checking absorbance for reabsorption problems ("inner filter effect" though check how it depends on overlap between abs & PL spectra), should stay roughly below 0.1
%N.B. competes with having a "good" (vs noise?) absorption signal
[LaserMax_a,LaserLambda_a]=max(aEmpty)
[LaserMax_c,LaserLambda_c]=max(cBeam.*t_a./tEx_c)
Abs=log10(LaserMax_a/LaserMax_c)  %derive maths to relate it to A in the article

%Plot checks, also used to find integration index, though that should be done after the scaling below.
figure
hold on
plot(aEmpty(LaserLambda_a-15:LaserLambda_a+15))
plot(bnotBeam(LaserLambda_a-15:LaserLambda_a+15))
plot(cBeam(LaserLambda_c-15:LaserLambda_c+15))
hold off
plot(bnotBeam(35:end))
hold on
plot(cBeam(index+134:index+533))
%replot with for the chosen integration interval to check

%"scaling" by CCD detector spectral sensitivity response
toResample = timeseries(iCCD(:,2),iCCD(:,1));
CCD = resample(toResample, lambda, 'linear');
aEmpty = aEmpty./CCD.Data;
bnotBeam = bnotBeam./CCD.Data;
cBeam = cBeam./CCD.Data;

%"scaling" by wavelength for proportionnality to number of photons
aEmpty = aEmpty.*lambda;
bnotBeam = bnotBeam.*lambda;
cBeam = cBeam.*lambda;
%TO DO: check this & apply Valeur book &/or correction to distortion by paper (cited in vibronic coupling) as needed

%Smooth test, though should be done in the preprocessing at the beginning. Doesn't affect much due to integration :) check at which signal/noise it gets bad.
bnotBeamSmoo=smooth(bnotBeam(111:1500));
cBeamSmoo=smooth(cBeam(111:1500));
%replace  in integrations below ->variable with Smoo

%Peak areas, adjust indices (N.B. to do: test-compare to wavelength step*trapz)
L_a=trapz(lambda(7:30),aEmpty(7:30));    %Excitation, empty sphere
L_b=trapz(lambda(7:30),bnotBeam(7:30));  %Excitation, sample not in beam
L_c=trapz(lambda(7:30),cBeam(7:30));     %Excitation, sample in beam
P_a=0;                                         %PL emission, empty sphere
P_b=trapz(lambda(111:1500),bnotBeam(111:1500));  %PL emission, sample not in beam
P_c=trapz(lambda(111:1500),cBeam(111:1500));     %PL emission, sample in beam

%2MM, two measurement method
QY_2MM_c = P_c./(L_a-L_c)
QY_2MM_b = P_b./(L_a-L_b)

%3MM, three measurement method assuming f=1
A = 1-(L_c./L_b);
QY_3MM = (P_c-(1-A).*P_b)./(A.*L_a)