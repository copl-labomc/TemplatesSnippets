#%%
import numpy as np
import sys

#%%
def calculate_qd_concentration(V_QDs, V_solvant, Awave, Aexc, material):
    """
    Calculates the concentration of different colloidal quantum dot (cQD) materials based on the
    Peng method using the first exciton peak wavelength and absorbance.
    
    Parameters:
    V_cQDs (float): Volume of the QD solution (any unit as long as it's the same as V_solvant)
    V_solvant (float): Volume of the solvent (any unit as long as it's the same as V_cQDs)
    Awave (float): Wavelength of the first exciton peak
    Aexc (float): Absorbance at the first exciton peak
    material (string): Material of the measured quantum dots. Can be "CdSe", "CdTe" or "CdS".
    
    Returns:
    float: Initial QD concentration (in mol/L)
    """
    if material == "CdSe":
        # Calculate CdSe QD diameter using Peng paper fit
        D_Peng_CdSe = (1.6122e-9 * Awave**4) - (2.6575e-6 * Awave**3) + \
                  (1.6242e-3 * Awave**2) - (0.4277 * Awave) + 41.57
        # Calculate CdSe QD concentration using Peng method
        extinction_CdSe = 5857 * D_Peng_CdSe**2.65
        C_Peng_predil = Aexc / (extinction_CdSe * 1)

    elif material == "CdTe":
        # Calculate CdTe QD diameter using Peng paper fit  
        D_Peng_CdTe = (9.8127e-7 * Awave**3) - (1.7147e-3 * Awave**2) + \
                      (1.0064 * Awave) - 194.84
        # Calculate CdTe QD concentration using Peng method
        extinction_CdTe = 10043 * D_Peng_CdTe**2.12
        C_Peng_predil = Aexc / (extinction_CdTe * 1)

    elif material == "CdS":
        # Calculate CdS QD diameter using Peng paper fit
        D_Peng_CdS = (-6.6521e-8 * Awave**3) + (1.9557e-4 * Awave**2) - \
                     (9.2352e-2 * Awave) + 13.29
        # Calculate CdS QD concentration using Peng method
        extinction_CdS = 21536 * D_Peng_CdS**2.3
        C_Peng_predil = Aexc / (extinction_CdS * 1)
    
    # Calculate initial QD concentration
    V_diluted = V_QDs + V_solvant
    C_Peng = C_Peng_predil * V_diluted / V_QDs
    
    return C_Peng

#%%
# This cell does not really work, I do not know what the goal was so I don't know how to fix it
if __name__ == "__main__":
    V_cQDs = float(sys.argv[1])
    V_solvant = float(sys.argv[2])
    Awave = float(sys.argv[3])
    Aexc = float(sys.argv[4])
    material = str(sys.argv[5])
    print(calculate_qd_concentration(V_cQDs, V_solvant, Awave, Aexc, material))

#%%
#initial batch of measurements
print(f"initial C with 1:100 dilution:{calculate_qd_concentration(0.3, 29.7, 573.18, 0.09676529467, 'CdSe')}")
print(f"initial C with 1:200 dilution:{calculate_qd_concentration(0.3, 59.7, 572.13, 0.0468599461, 'CdSe')}")
print(f"initial C with 1:1000 dilution:{calculate_qd_concentration(0.3, 299.7, 568.99, 0.0123021761, 'CdSe')}")
# %%
# May 7th batch of measurements
C_100 = calculate_qd_concentration(0.3, 29.7, 570.74, 0.1184577197, "CdSe")
print(f"initial C with 1:100 dilution: {C_100} mol/L")
C_200 = calculate_qd_concentration(0.3, 59.7, 568.99, 0.06279129535, "CdSe")
print(f"initial C with 1:200 dilution: {C_200} mol/L")
C_400 = calculate_qd_concentration(0.3, 119.7, 566.89, 0.03251485899, "CdSe")
print(f"initial C with 1:400 dilution: {C_400} mol/L")
C_600 = calculate_qd_concentration(0.3, 179.7, 565.85, 0.02710300684, "CdSe")
print(f"initial C with 1:600 dilution: {C_600} mol/L")
C_800 = calculate_qd_concentration(0.3, 239.7, 563.4, 0.019982161, "CdSe")
print(f"initial C with 1:800 dilution: {C_800} mol/L")
C_1000 = calculate_qd_concentration(0.3, 299.7, 562.7, 0.01922318526, "CdSe")
print(f"initial C with 1:1000 dilution: {C_1000} mol/L")
# %%
C_full = np.average([C_100, C_200, C_400, C_600, C_800, C_1000])
C_STD_full = np.std([C_100, C_200, C_400, C_600, C_800, C_1000])

print(f"Average initial C, all tests: {round(C_full, 7)} ± {round(C_STD_full, 7)} mol/L")
print(f"Volume of stock solution for 120 nmol: {round(120e-09/C_full * 1000, 4)} mL")
# %%
