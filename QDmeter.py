import numpy as np
import sys

if __name__ == "__main__":
    V_cQDs = float(sys.argv[1])
    V_solvant = float(sys.argv[2])
    Awave = float(sys.argv[3])
    Aexc = float(sys.argv[4])
    print(calculate_qd_concentration(V_cQDs, V_solvant, Awave, Aexc))

def calculate_qd_concentration(V_QDs, V_solvant, Awave, Aexc):
    """
    Calculates the concentration of different colloidal quantum dot (cQD) materials based on the
    Peng method using the first exciton peak wavelength and absorbance.
    
    Parameters:
    V_cQDs (float): Volume of the QD solution (any unit as long as it's the same as V_solvant)
    V_solvant (float): Volume of the solvent (any unit as long as it's the same as V_cQDs)
    Awave (float): Wavelength of the first exciton peak
    Aexc (float): Absorbance at the first exciton peak
    
    Returns:
    float: Initial QD concentration (in mol/L)
    """
    # Calculate CdSe QD diameter using Peng paper fit
    D_Peng_CdSe = (1.6122e-9 * Awave**4) - (2.6575e-6 * Awave**3) + \
                  (1.6242e-3 * Awave**2) - (0.4277 * Awave) + 41.57
    
    # Calculate CdTe QD diameter using Peng paper fit  
    D_Peng_CdTe = (9.8127e-7 * Awave**3) - (1.7147e-3 * Awave**2) + \
                  (1.0064 * Awave) - 194.84
    
    # Calculate CdS QD diameter using Peng paper fit
    D_Peng_CdS = (-6.6521e-8 * Awave**3) + (1.9557e-4 * Awave**2) - \
                 (9.2352e-2 * Awave) + 13.29
    
    # Calculate CdSe QD concentration using Peng method
    extinction_CdSe = 5857 * D_Peng_CdSe**2.65
    C_Peng_CdSe = Aexc / (extinction_CdSe * 1)
    
    # Calculate CdTe QD concentration using Peng method
    extinction_CdTe = 10043 * D_Peng_CdTe**2.12
    C_Peng_CdTe = Aexc / (extinction_CdTe * 1)
    
    # Calculate CdS QD concentration using Peng method
    extinction_CdS = 21536 * D_Peng_CdS**2.3
    C_Peng_CdS = Aexc / (extinction_CdS * 1)
    
    # Calculate initial QD concentration
    V_diluted = V_cQDs + V_solvant
    C_Peng = C_Peng_CdTe * V_diluted / V_QDs
    
    return C_Peng
