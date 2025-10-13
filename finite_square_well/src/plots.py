import numpy as np
from matplotlib import pyplot as plt

proability_density = np.genfromtxt('finite_square_well/results/raw/probability.txt')
x = proability_density[5,:]

fig = plt.figure(figsize=(20,10))

for i in range(proability_density.shape[0]-3):
    plt.plot(x, proability_density[i,:], label = f"quantum number {i+1}")

plt.xlabel("x")
plt.ylabel("|ψ(x)|²")
plt.title("Probability densities for different n")
plt.grid(True)
plt.legend()
plt.tight_layout()
plt.savefig("finite_square_well/results/plots/probability_density.png", dpi=300)  # high-res

print(np.shape(proability_density))