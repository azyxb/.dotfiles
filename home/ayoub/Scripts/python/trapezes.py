#!/usr/bin/env python3.7

import numpy as np

def trap(f, a, b, n):
	""" Cette fonction utilise la methode des trapezes pour calculer une
	approximation de l'integrale de la fonction f sur [a,b] pour une 
	subdivision de support de n elements.
	"""
	assert n > 0
	p = (b - a)/n
	i = 0.5 * (f(a) + f(b))
	for k in range(1,n):
		i += f(a + k * p)
	return i * p

def integ(f, a, b, e):
	""" Cette fonction essaye, d'une maniere naive, de trouvez la
	valeur de l'integrale a la precision e, elle peut etre utilisee
	pour toutes les fonctions continues.
	"""
	n = 1
	while np.abs(trap(f, a, b, n) - trap(f, a, b, n+1)) > e:
		if n < 100:
			n += n
		else:
			n += int(np.log(n))
	print(n)
	return trap(f, a, b, n)

def f(x):
	return x

a = 0.01
b = 1
e = 0.0000001

print(integ(f, a, b, e))
