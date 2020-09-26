#!/usr/bin/env python3

# Ejemplos de como operar en Python con NumPy
# Si quieres tener una consola como en Matlab, puedes usar el programa "ipython"
# El código de este archivo sigue el contenido de Practica_1_LCC.pdf

import numpy as np
import matplotlib.pyplot as plt
import matplotlib

# Ejercicio 2: Operaciones basicas con numeros escalares
# Fíjate que algunas operaciones devuelven un float y NO un entero

a = 7
b = 2
suma = a + b
resta = a - b
multiplicacion = a * b
division = a / b
potencia = a**b

print("Ejercicio 2")
print("Los valoes de a y b son:", a, b)
print("Resultado de la suma (a + b):", suma)
print("Resultado de la resta (a - b):", resta)
print("Resultado de la multiplicacion (a * b):", multiplicacion)
print("Resultado de la division (a / b):", division)
print("Resultado de la potencia (a ^ b):", potencia)
print("")

# Ejercicio 3: Diferentes funciones elementales con numpy
# Fíjate que algunas funciones devuelven un floar y NO un entero

a = -4

absoluto = np.abs(a)
raiz = np.sqrt(absoluto)
coseno = np.cos(a)
redondeo = np.round(coseno)

print("Ejercicio 3")
print("El valor absoluto de a es:", absoluto)
print("El valor de la raíz cuadrada del valor absoluto de a es:", raiz)
print("El coseno de a radianes es:", coseno)
print("El valor redondeado del coseno de a es:", redondeo)
print("")

# Ejercicio 4: Introducción a vectores
x = np.linspace(0, 2*np.pi, 30) # A diferencia de Matlab, x es un array y se procesa como una FILA

y = np.sin(x)

print("Ejercicio 4")
print("El vector x es:", x)

fig = plt.figure() # Crea el marco/ventana

# Cuantos gráficos en el marco y su organizacion.
ax1 = fig.add_subplot(1,2,1) # 1 fila, 2 columnas, primera posicion
ax2 = fig.add_subplot(1,2,2) # 1 fila, 2 columnas, segunda posicion

# Pintar
ax1.plot(x,y,'r-') # El contenido de ax, pintar y frente a x
ax2.plot(x,y**2,'r-') # El contenido de ax, pintar el cuadrado de cada elemento de y frente a x

# Pausita
plt.pause(3) # Pausa para ver el grafico por si ejecutas este script desde la consola y no desde ipython o similar
