function [raiz,err,iter,tiempo]=biseccion(fun,a,b,tol,maxiter,dibu)
%[raiz,err,iter]=biseccion('fun',a,b,tol,maxiter,dibu)
%Esta función calcula la raiz de una funcion 'fun', en el intervalo [a,b],
%empleando el método de la bissección.
%tol representa la tolerancia límite por debajo de la cual se considera que 
%la raíz esta bien calculada.
%maxiter contiene el número máximo de iteraciones que realizará el programa
%en caso de no encontrar antes la raíz.
%dibu. Si se da un valor a la variable dibu, el programa va dibujando los
%intervalos sucesivos, puntos medios etc, hasta alcanzar la raiz. Cada vez
%que realiza una iteración detiene la ejecución del programa, para que
%continue basta pulsar cualquier tecla.
%
%[raiz,err,iter]=biseccion('fun',a,b,tol,maxiter)
%ejecuta el programa sin dibujos ni pausas.
%
%La variable de salida raiz contiene el valor de la raiz alcanzada.
%err el error cometido, entendido éste como el valor fun(raiz).
%iter contiene el número de iteraciones empleado para alcanzar la raíz con
%la tolerancia pedida

%evaluamos la función en los extremos del intervalo para confirmar que
%existe una raíz (o al menos un número impar de ellas..
fa=feval(fun,a);
fb=feval(fun,b);
%%%%%%%%%%%%%%%%%%OPCIONES DE DIBUJO%%%%%mas o menos monas%%%
%construimos un intervalo un poquito más amplio que el que no dan para
%buscar la raíz
tiempo=0;
if nargin==6
    x=a-(b-a)/10:(b-a)/100:b+(b-a)/10;
    y=feval(fun,x);
    plot(x,y)
    hold on
    %pintamos los puntos del intervalos
    stem(a,feval(fun,a),'r');
    stem(b,feval(fun,b),'b');
    pause
end

if fa*fb<0
    %existe raiz
    %calculamos el punto medio.
    c=(a+b)/2;
    %calculamos el valor de f(c)
    fc=feval(fun,c);
    %comprobamos si hemos encotrado la raíz
    if abs(fc)<=tol
        raiz=fc;
        iter=1;
        err=fc;
    else
        iter=1;
        %aqui tenemos el bucle de la muerte...
        while(abs(fc)>tol)&(iter<=maxiter)
            if fc*fa>0 %comprobamos si tiene fc tiene el mismo signo que fa
                a=c;
                fa=fc;
                if nargin==6
                stem(a,fa,'r')
                pause
                end
            else
                b=c;
                fb=fc;%en realidad no hace falta esta asignacion ya que fb
                      %no vuelve a usarse
                if nargin==6
                   stem(b,fb,'b')
                   pause
                end
            end
            %calculamos un nuevo punto intermedio
            tic
            c=(a+b)/2;
            fc=feval(fun,c);
            t=toc;
            iter=iter+1;
            tiempo=(tiempo*(iter-1)+t)/iter;
            
        end
    end
    %devolvemos los resultados en las variables de salida...
    raiz=c;
    err=fc;
    %iter ya tiene el nombre correcto
    %pintamos la raíz
    if nargin==6
    stem(c,fc,'g','MarkerFaceColor','g')
    end
else
    error('no hay raíz en el intervalo o hay más de una')
end
