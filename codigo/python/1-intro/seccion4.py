#!/usr/bin/env python3

# Ejemplos de como operar en Python con NumPy
# Utiliza "ipython" para tener una consola como en Matlab
# El codigo de este archivo sigue el contenido de Practica_1_LCC.pdf

import numpy as np
import matplotlib.pyplot as plt
import matplotlib
from scipy import linalg as la

# Funcion ejercicio 2
def serieinv(n):
    serie = 0
    for i in range(1,n,1):
        serie = serie + 1.0/i
    return serie

# Funcion ejercicio 3
def fibo(n):
    serie = 0
    f = np.zeros(n)
    f[0] = 1
    f[1] = 2
    i = 2
    while i < n:
        f[i] = f[i-1] + f[i-2]
        i = i + 1

    return f

print("Resultado ejercicio 2:", serieinv(1000))
print("Resultado ejercicio 3:", fibo(10))


