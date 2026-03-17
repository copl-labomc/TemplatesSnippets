#%%
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import matplotlib.gridspec as gsc
import plotly.graph_objects as go
from typing import Tuple

def wavelength_to_rgb(nm) -> Tuple:

    '''
    Takes a wavelength of visible light
    between 380 and 780 nanometres inclusive.
    Values outside this range will raise a ValueError.
    Returns a list of corresponding RGB values.
    Based on Dan Bruton's Fortran implementation.
    '''

    if nm < 380 or nm > 780:

        return (0, 0, 0)

    gamma = 0.8
    max_intensity = 255
    factor = 0

    rgb = {"R": 0, "G": 0, "B": 0}

    if 380 <= nm <= 439:
        rgb["R"] = -(nm - 440) / (440 - 380)
        rgb["G"] = 0.0
        rgb["B"] = 1.0
    elif 440 <= nm <= 489:
        rgb["R"] = 0.0
        rgb["G"] = (nm - 440) / (490 - 440)
        rgb["B"] = 1.0
    elif 490 <= nm <= 509:
        rgb["R"] = 0.0
        rgb["G"] = 1.0
        rgb["B"] = -(nm - 510) / (510 - 490)
    elif 510 <= nm <= 579:
        rgb["R"] = (nm - 510) / (580 - 510)
        rgb["G"] = 1.0
        rgb["B"] = 0.0
    elif 580 <= nm <= 644:
        rgb["R"] = 1.0
        rgb["G"] = -(nm - 645) / (645 - 580)
        rgb["B"] = 0.0
    elif 645 <= nm <= 780:
        rgb["R"] = 1.0
        rgb["G"] = 0.0
        rgb["B"] = 0.0

    if 380 <= nm <= 419:
        factor = 0.3 + 0.7 * (nm - 380) / (420 - 380)
    elif 420 <= nm <= 700:
        factor = 1.0
    elif 701 <= nm <= 780:
        factor = 0.3 + 0.7 * (780 - nm) / (780 - 700)

    if rgb["R"] > 0:
        rgb["R"] = int(max_intensity * ((rgb["R"] * factor) ** gamma))
    else:
        rgb["R"] = 0

    if rgb["G"] > 0:
        rgb["G"] = int(max_intensity * ((rgb["G"] * factor) ** gamma))
    else:
        rgb["G"] = 0

    if rgb["B"] > 0:
        rgb["B"] = int(max_intensity * ((rgb["B"] * factor) ** gamma))
    else:
        rgb["B"] = 0

    return (rgb["R"]/255, rgb["G"]/255, rgb["B"]/255)


# %%
df = pd.read_csv('Données LY-wavelength-fix.csv', sep=',', header=None)
data = np.array(df.values)

x = data[2:,1].astype(float)
y = data[2:,2].astype(float)
n = data[2:,0]

# %%

plt.rc('axes', linewidth=2)
fig, (ax1, ax2) = plt.subplots(1, 2, sharey = True, figsize=(12,6), gridspec_kw={'width_ratios': [2, 1]})
fig.subplots_adjust(bottom=0.3)
plt.tight_layout()

for i in range(np.shape(x)[0]):
    ax1.scatter(x[i], y[i], color = wavelength_to_rgb(x[i]), label = f"{i+1}: {n[i]}")
    if 500 < x[i] < 540:
        ax2.scatter(x[i], y[i], color = wavelength_to_rgb(x[i]))
        if i+1 != 18:
            ax2.annotate(f"{i+1}", (x[i]-1, y[i]+1200), size = "large")
        else:
            ax2.annotate(f"{i+1}", (x[i]+0.5, y[i]-1000), size = "large")
    else:
        ax1.annotate(f"{i+1}", (x[i]-2.5, y[i]+1200), size = "large")
ax1.plot((500, 500), (-1000, 90000), c = "black", ls = "--")
ax1.plot((540, 540), (-1000, 90000), c = "black", ls = "--")


ax1.tick_params("both", direction = "inout", top = True, right = True, width = 2, length = 6, labelsize = 16)
ax2.tick_params("both", direction = "inout", top = True, right = True, width = 2, length = 6, labelsize = 16)
ax1.set_xlabel("Emission peak wavelength [nm]", fontsize = 20)
ax1.xaxis.set_label_coords(0.76, -0.06)
ax1.set_ylabel("Light yield [photons/MeV]", fontsize = 20)
#ax2.set_xlabel("Emission peak wavelength [nm]", fontsize = 20)
#plt.yscale("log")

#!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#USE THIS HERE TO MOVE THE LEGEND (second coord controls height, negative is down)
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!
ax1.legend(loc='lower left', bbox_to_anchor=(-0.21, -0.9), ncol=4, fontsize = "large")
#ax1.legend(loc='upper left', bbox_to_anchor=(-0.027, 1.455), ncol=4)
plt.ylim(-1000, 83000)

#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#Savefig here, activate as needed
#plt.savefig("Figure LY V3.svg", dpi = 200, bbox_inches = "tight")
plt.show

plt.show()
# %%
