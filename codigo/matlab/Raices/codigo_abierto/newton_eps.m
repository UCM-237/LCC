function [raiz,err,iter]=newton_eps(fun,dfun,x0,maxiter,dibu)

%
%[raiz,err,iter]=newton('fun','dfun',x0,tol,maxiter)
%ejecuta el programa sin dibujos ni pausas.
%
%La variable de salida raiz contiene el valor de la raiz alcanzada.
%err el error cometido, entendido �ste como el valor fun(raiz).
%iter contiene el n�mero de iteraciones empleado para alcanzar la ra�z con
%la tolerancia pedida
%[raiz,err,iter]=newton('fun','dfun',x0,tol,maxiter,dibu)
%Esta funci�n calcula la raiz de una funcion 'fun', partiendo de un punto
%x0, que debe elegirse pr�ximo a la ra�z,empleando el m�todo de newton.
%'dfun' representa la funci�n derivada de 'fun'
%tol representa la tolerancia l�mite por debajo de la cual se considera que
%la ra�z esta bien calculada.
%maxiter contiene el n�mero m�ximo de iteraciones que realizar� el programa
%en caso de no encontrar antes la ra�z.
%dibu. Si se da un valor a la variable dibu, el programa va dibujando los
%intervalos sucesivos, puntos medios etc, hasta alcanzar la raiz. Cada vez
%que realiza una iteraci�n detiene la  ejecuci�n del programa, 
% para que continue basta pulsar cualquier tecla.



%dividimos en dos el c�lculo ya que si no se pinta, no hace falta usar m�s
%que una variable...
if nargin==5
    %evaluamos la funci�n y su derivada en el punto x0
    fx0=feval(fun,x0);
    x1=x0-fx0/feval(dfun,x0);
    %%%%%%%%%%%%%%%%%%OPCIONES DE DIBUJO%%%%%mas o menos monas%%%
    %construimos un intervalo de dibujo, (puede ser que el resultado nos
    %quede fuera... pero en fin...
    
    x=x0-0.5:4/100:x0+0.5;
    y=feval(fun,x);
    plot(x,y)
    hold on
    %pintamos el punto (x0,fx0)
    stem(x0,fx0,'r');
    pause
    
    %calculamos el punto de corte de la recta tangente con el eje x
    
    %
    fx1=feval(fun,x1);
    %comprobamos si hemos encotrado la ra�z
    if abs(fx1)<=eps
        raiz=x1;
        iter=1;
        err=fx1;
        %pintamos.
        
        stem(x1,fx1,'g')
        plot([x0 ,x1],[fx0,fx1],'k')
        %si nos hemos salido del dibujo, a�adimos un trozo...
        if x1>max(x)
            xe=max(x):(x1-max(x)+0.5)/100:x1+0.5;
            ye=feval(fun,xe);
            plot(xe,ye)
        elseif x1<min(x)
            xe=x1-0.5:(min(x)-x1+0.5)/100:min(x);
            ye=feval(fun,xe);
            plot(xe,ye)
        end
    else
        stem(x1,fx1,'r')
        plot([x0 ,x1],[fx0,0],'k')
        %si nos hemos salido del dibujo, a�adimos un trozo...
        if x1>max(x)
            xe=max(x):(x1-max(x)+0.5)/100:x1+0.5;
            ye=feval(fun,xe);
            plot(xe,ye)
        elseif x1<min(x)
            xe=x1-0.5:(min(x)-x1+0.5)/100:min(x);
            ye=feval(fun,xe);
            plot(xe,ye)
        end
        pause
        iter=1;
        %aqui tenemos el bucle de la muerte...
        while(abs(x1-x0)>eps(x1))&(iter<=maxiter)
            x0=x1;
            fx0=fx1;
            %calculamos un nuevo punto y su valor f(x1)
            x1=x0-fx0/feval(dfun,x0);
            fx1=feval(fun,x1);
            %pintamos
            stem(x1,fx1,'r')
            plot([x0 ,x1],[fx0,0],'k')
            %si nos hemos salido del dibujo, a�adimos un trozo
            if x1>max(x)
                xe=max(x):(x1-max(x)+0.5)/100:x1+0.5;
                ye=feval(fun,xe);
                plot(xe,ye)
            elseif x1<min(x)
                xe=x1-0.5:(min(x)-x1+0.5)/100:min(x);
                ye=feval(fun,xe);
                plot(xe,ye)
            end
            
            pause
            iter=iter+1;
        end
        %devolvemos los resultados en las variables de salida...
        raiz=x1;
        err=fx1;
        %iter ya tiene el nombre correcto
        %pintamos la ra�z
        
        stem(x1,fx1,'g','MarkerFaceColor','g')
    end
else
    %metodo rapidito ya que no hay que pintar
    %evaluamos la funci�n y su derivada en el punto x0
    fx0=feval(fun,x0);
    x0=x0-fx0/feval(dfun,x0);
    %comprobamos si hemos encotrado la ra�z
    if abs(fx0)<=eps
        raiz=x0;
        iter=1;
        err=fx0;
    else
        iter=1;
        %aqui tenemos el bucle de la muerte...
        x1=x0-fx0/feval(dfun,x0);
        while(abs(x1-x0)>eps(x1))&(iter<=maxiter)
            x0=x1;
            fx0=feval(fun,x0);
            %calculamos un nuevo punto y su valor f(x)
            x1=x0-fx0/feval(dfun,x0);
            iter=iter+1;
            abs(x1-x0)
            eps(x1)
        end
        %devolvemos los resultados en las variables de salida...
        raiz=x0;
        err=fx0;
        %iter ya tiene el nombre correcto
        %pintamos la ra�z
    end
end
