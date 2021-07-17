# -*- coding: utf-8 -*-
"""
Created on Fri Nov 16 16:11:03 2012

@author: juan
"""
import math
import numpy
x0=0
x=-math.sqrt(math.exp(x0))
xr=numpy.matrix([x])
n=0
while math.fabs(x-x0)>0.01:
    n=n+1
    x0=x
    x=-math.sqrt(math.exp(x0))
    xr=numpy.resize(xr,(n+1,1))
    xr[n,0]=x