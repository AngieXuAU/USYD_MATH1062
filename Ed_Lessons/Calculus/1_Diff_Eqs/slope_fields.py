import numpy as np
import matplotlib.pyplot as plt

# ---- EDIT THE FUNCTION ----
# dy/dx = f(x, y).  Try:  x + y   or   2 - 3*y/(100 + 2*x)   or   x*y
def f(x, y):
    return x + y
# -------------------------

# ---- EDIT THE RANGE & DENSITY ----
# range: how much of the xy-plane is shown (currently -5 to 5)
# density: how many direction ticks are drawn along each axis (currently 20)
x = np.linspace(-5, 5, 20)
y = np.linspace(-5, 5, 20)
# -----------------------------------
X, Y = np.meshgrid(x, y)

# Slope at each point, converted to a unit vector (U, V) so every
# tick is drawn the same length -- direction matters, not size
slope = f(X, Y)
length = np.sqrt(1 + slope**2)
U, V = 1 / length, slope / length

plt.figure(figsize=(10, 10))
plt.quiver(
    X, Y, U, V,
    angles="xy", pivot="mid", width=0.0025,
    headlength=0, headaxislength=0,  # no arrowheads -- just direction ticks
)
plt.xlabel("x")
plt.ylabel("y")
plt.title("Slope field for dy/dx = f(x, y)")
plt.axis([-6, 6, -6, 6])  # small buffer around the grid so edge ticks aren't clipped

plt.savefig("vector_field.png", dpi=300, bbox_inches="tight")