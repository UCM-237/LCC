#!/usr/bin/env python3

# Ejemplos de como operar en Python con NumPy
# Utiliza "ipython" para tener una consola como en Matlab
# El codigo de este archivo sigue el contenido de Practica_1_LCC.pdf

import numpy as np
import matplotlib.pyplot as plt
import matplotlib
from scipy import linalg as la

# Ejercicio 1
xf = np.array([1,2,9,4,5]) # Array/vector FILA
xc = np.array([[1],[2],[9],[4],[5]]) # Array de arrays o vector de vectores. Cada fila contiene una fila, es "equivalente" a un vector COLUMNA

xcTraspuesto = xc.T # "Cuidado", esto es una fila que contiene otra fila. Ver Ejercicio 8 para qué sirve esto.

# Ejercicio 2
vec = np.linspace(6,7,4)

# Ejercicio 3
# El índice en vec[indice] NO es la posicion del elemento, si no que es el "offset" con respecto al primer elemento. Así vec[0] apunta al primer elemento, y vec[2] apunta al elemento 3.

vec[2] = vec[2] + 1

# Ejercicio 5
tabla3 = np.linspace(3, 30, 10, dtype=int) #Queremos Enteros en vez de Floats

# Ejercicio 8
a = np.array([0, 6, 8, 3])
b = np.array([-1, 7, 8*2, 4])

# Because a and b are unidimensional arrays, we need to given them an additional dimension before concatenate them. Otherwise, we can only achieve [a b], i.e., b after a in along the only one dimension.

a2d = a.reshape(1,np.size(a)) # Ahora es una fila que contiene una fila, hemos añadido una dimension extra
b2d = b.reshape(1,np.size(b))

ab24 = np.concatenate((a2d,b2d), axis=0)
ab42 = np.concatenate((a2d.T,b2d.T), axis=1)

# Ejercicio 14
B = np.zeros((4,4)) # El input de esta funcion si no es un escalar, ha de ser una dupla, no vale np.zeros(4, 4).
B[0, :] = a           # Todas (:) las columnas de la primera fila igual a "a"
B[1, :] = np.zeros(4)
B[2, :] = np.ones(4)
B[3, :] = b

# Ejercicio 15
k = np.diag(B[0:2, 0:2])

# Ejercicio 16
C = B[0:3, 0:3]

# Ejercicio 17
A = np.array([[1, 2], [4, -1]])
B = np.array([[4, -2], [-6, 3]])

C = A + B

determinanteA = la.det(A)
determinanteB = la.det(B)
invA = la.inv(A)
#invB = la.inv(B) #B is a singular matrix and then the function returns error

E = A.dot(B) # Así es como multiplicamos arrays de arrays (matrices)
F = B.dot(A)

# Ejercicio 18
A = np.array([[1, 3, 6],
              [8, 9, 1],
              [3,10, 9]])
b = np.array([[1],
              [3],
              [4]])

x = la.inv(A).dot(b) # A x = b  -> x = A^{-1} b
