function y=funpfijo1(x)
%y=funpfijo1(x)
%función de prueba para obtener por el método del punto fijo la raíz de la
%funcion f(x)=exp(x)-x.^2. (ver función prueba.m). En este caso, se emplea
%la función: g(x)=-sqrt(exp(x)) para obtener iterativamente su punto fijo
%=>  x=g(x),  que es la raíz de f(x).

y=-sqrt(exp(x));