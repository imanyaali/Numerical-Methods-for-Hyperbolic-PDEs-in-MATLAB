# Numerical Methods for Hyperbolic PDEs in MATLAB

This repository contains MATLAB implementations of two well-known numerical methods for solving hyperbolic partial differential equations (PDEs):

1. **Lax-Wendroff Method**: Implemented in `LaxWendroff_Full.m`, this second-order accurate method uses a central difference approximation to calculate the solution at each time step, considering boundary conditions.

2. **MacCormack Method**: Implemented in `MacCormack_Full.m`, this second-order accurate predictor-corrector method calculates the solution by predicting with a forward difference and correcting with a backward difference.

Both methods are used in computational fluid dynamics (CFD) and are essential for simulating wave propagation and similar phenomena.

## How to Use
To use these functions, simply call them with the appropriate input parameters. For example:

```matlab
U_next = LaxWendroff_Full(U, M, N, CFL, n);
