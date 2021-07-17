function [raiz,err,iter]=pfijo(gfun,x0,tol,maxiter,dibu)
%[raiz,err,iter]=pfijo('gfun',x0,tol,maxiter,dibu)
%Esta funci�n calcula la raiz de una funcion (x) 'fun'  empleando el m�todo del punto
%fijo, 'gfun' debe ser una funci�n g(x) que cumpla g(x)-x=f(x).
%Nota: para calcular la ra�z basta con pasar la funci�n 'gfun' al programa.
%fun solo se pasa si se desea que el progrma dibuje
%
%x0, es un punto inicial de b�squeda
%tol representa la tolerancia l�mite por debajo de la cual se considera que
%la ra�z esta bien calculada.
%maxiter contiene el n�mero m�ximo de iteraciones que realizar� el programa
%en caso de no encontrar antes la ra�z.
%dibu. Si se da un valor a la variable dibu, el programa va dibujando los
%pasos sucesivos del algoritmo hasta alcanzar la raiz. Cada vez
%que realiza una iteraci�n detiene la ejecuci�n del programa, para que
%continue basta pulsar cualquier tecla.
%
%[raiz,err,iter]=pfijo('fun','gfun',x0,tol,maxiter)
%ejecuta el programa sin dibujos ni pausas.
%
%La variable de salida raiz contiene el valor de la raiz alcanzada.
%err el error cometido, entendido �ste como el valor fun(raiz).
%iter contiene el n�mero de iteraciones empleado para alcanzar la ra�z con
%la tolerancia pedida




%dividimos en dos el c�lculo ya que si no se pinta, no hace falta usar m�s
%que una variable...

%evaluamos la funci�n en los puntos x0 y x1
x=feval(gfun,x0);
if nargin==5
    %%%%%%%%%%%%%%%%%%OPCIONES DE DIBUJO%%%%%mas o menos monas%%%
    %construimos un intervalo de dibujo, (puede ser que el resultado nos
    %quede fuera... pero en fin...
    xg=min([x0 x])-0.5:abs(x-x0)/100:max([x0 x])+0.5;
    y=feval(gfun,xg);
    plot(xg,y)
    hold on
    %pintamos la recta y=x
    plot(xg,xg,'r')
    %pintamos los puntos (x0,x) y (x,x)
    stem(x0,x,'r');
    plot([x0 x],[x x])
    pause
end
%comprobamos si hemos encotrado la ra�z
if abs(x-x0)<=tol
    raiz=x;
    iter=1;
    %err=x-x0;


else
    iter=1;
    error=x-x0
    %aqui tenemos el bucle de la muerte...
    %redefinimos los puntos

    while(abs(x-x0)>tol)&(iter<=maxiter)
        %calculamos un nuevo punto y su valor f(x)
        x0=x;
        x=feval(gfun,x0);
        if nargin==5
            %Pintamos
            %pintamos los puntos (x0,x) y (x,x)
            plot([x0 x0], [x0 x])
            plot(x0,x,'o')
            plot([x0 x],[x x])
            %si nos hemos salido del dibujo, a�adimos un trozo...
            if x>max(xg)
                xe=max(xg):(x-max(xg)+0.5)/100:x+0.5;
                ye=feval(gfun,xe);
                plot(xe,ye)
                plot(xe,xe,'r')
            elseif x<min(xg)
                xe=x-0.5:(min(xg)-x+0.5)/100:min(xg);
                ye=feval(gfun,xe);
                plot(xe,ye)
                plot(xe,xe,'r')
            end

           % pause
        end
        iter=iter+1;
        %error=[error x-x0]
    end
    raiz=x;
    err=x-x0;
    %plot(1:iter,error)
    %iter ya tiene el nombre correcto
    %pintamos la ra�z

end
if nargin==5&iter<maxiter
    figure(1)
    plot(x0,x,'og','MarkerFaceColor','g')
end

