#!/usr/bin/env python3

# Ejemplos de como operar en Python con NumPy
# Utiliza "ipython" para tener una consola como en Matlab
# El codigo de este archivo sigue el contenido de Practica_1_LCC.pdf

import numpy as np
import matplotlib.pyplot as plt
import matplotlib
from scipy import linalg as la

# Funcion para el ejercicio 4

def sup_vol_fun(r, h):
    area = 2*np.pi*r*h + 2*np.pi*r*r
    volume = np.pi*r*r*h
    return np.array([area, volume])

# Funcion para el ejercicio 6

def funmat(x, n):
    fx = 1 / (1 + np.abs(x)**n)
    return fx

# Ejercicio 4
radio = 3
altura = 5

resultado = sup_vol_fun(radio, altura)

print("El area del cilindro es:", resultado[0], " y el volumen es:", resultado[1])

# Ejercicio 6
fig = plt.figure() # Crea el marco/ventana

# Cuantos gráficos en el marco y su organizacion.
ax1 = fig.add_subplot(1,1,1) # 1 fila, 1 columna, primera posicion

n = 3
x = np.linspace(-40, 40, 200)

ax1.plot(x, funmat(x, n))
ax1.set_xlabel("x")
#ax1.set_ylabel("$\frac{1}{1+|x|^3}$")
plt.pause(3)
