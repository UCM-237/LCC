function [raiz,err,iter]=secante(fun,x0,x1,tol,maxiter,dibu)
%[raiz,err,iter]=secante('fun',x0,x1,tol,maxiter,dibu)
%Esta funci�n calcula la raiz de una funcion 'fun', partiendo de dos puntos
%x0, x1 (es aconsejable que la ra�z est� comprendida entre ellos)empleando
%el m�todo de la secante.
%tol representa la tolerancia l�mite por debajo de la cual se considera que
%la ra�z esta bien calculada.
%maxiter contiene el n�mero m�ximo de iteraciones que realizar� el programa
%en caso de no encontrar antes la ra�z.
%dibu. Si se da un valor a la variable dibu, el programa va dibujando los
%intervalos sucesivos, puntos medios etc, hasta alcanzar la raiz. Cada vez
%que realiza una iteraci�n detiene la ejecuci�n del programa, para que
%continue basta pulsar cualquier tecla.
%
%[raiz,err,iter]=secante('fun',x0,x1,tol,maxiter)
%ejecuta el programa sin dibujos ni pausas.
%
%La variable de salida raiz contiene el valor de la raiz alcanzada.
%err el error cometido, entendido �ste como el valor fun(raiz).
%iter contiene el n�mero de iteraciones empleado para alcanzar la ra�z con
%la tolerancia pedida




%dividimos en dos el c�lculo ya que si no se pinta, no hace falta usar m�s
%que una variable...
if nargin==6
    %evaluamos la funci�n en los puntos x0 y x1
    fx0=feval(fun,x0);
    fx1=feval(fun,x1);
    x=x1-(x1-x0)*fx1/(fx1-fx0)
    fx=feval(fun,x)
    %%%%%%%%%%%%%%%%%%OPCIONES DE DIBUJO%%%%%mas o menos monas%%%
    %construimos un intervalo de dibujo, (puede ser que el resultado nos
    %quede fuera... pero en fin...

    xg=x0-0.5:(x1-x0)/100:x1+0.5;
    y=feval(fun,xg);
    plot(xg,y)
    hold on
    %pintamos los puntos (x0,fx0), (x1,fx1), (x,fx)
    stem(x0,fx0,'r');
    stem(x1,fx1,'b');
    stem(x,fx,'k')
    % y la recta secante
    plot([x0 x],[fx0 0],'k')
    plot([x1,x],[fx1 0],'k')
    %si nos hemos salido del dibujo, a�adimos un trozo...
    if x>max(xg)
        xe=max(xg):(x-max(xg)+0.5)/100:x+0.5;
        ye=feval(fun,xe);
        plot(xe,ye)
    elseif x<min(xg)
        xe=x-0.5:(min(xg)-x+0.5)/100:min(xg);
        ye=feval(fun,xe);
        plot(xe,ye)
    end

    pause

    %comprobamos si hemos encotrado la ra�z
    if abs(fx)<=tol
        raiz=x;
        iter=1;
        err=fx;


    else
        iter=1;

        %aqui tenemos el bucle de la muerte...
        %redefinimos los puntos
        x0=x1;
        fx0=fx1;
        x1=x;
        fx1=fx;
        while(abs(fx)>tol)&(iter<=maxiter)
            %calculamos un nuevo punto y su valor f(x)
            x=x1-(x1-x0)*fx1/(fx1-fx0);
            fx=feval(fun,x);
            %Pintamos
            stem(x,fx,'r')
            plot([x0 ,x],[fx0,0],'k')
            plot([x1,x],[fx1 0],'k')
            %si nos hemos salido del dibujo, a�adimos un trozo...
            if x>max(xg)
                xe=max(xg):(x-max(xg)+0.5)/100:x+0.5;
                ye=feval(fun,xe);
                plot(xe,ye)
            elseif x<min(xg)
                xe=x-0.5:(min(xg)-x+0.5)/100:min(xg);
                ye=feval(fun,xe);
                plot(xe,ye)
            end

            pause

            iter=iter+1;
            x0=x1;
            fx0=fx1;
            x1=x;
            fx1=fx;
        end
        %devolvemos los resultados en las variables de salida...
        raiz=x;
        err=fx;
        %iter ya tiene el nombre correcto
        %pintamos la ra�z

        stem(x,fx,'g','MarkerFaceColor','g')
    end
else
    %metodo rapidito ya que no hay que pintar
    %evaluamos la funci�n en x0 y x1
    fx0=feval(fun,x0);
    fx1=feval(fun,x1);
    x=x1-(x1-x0)*fx1/(fx1-fx0);
    fx=feval(fun,x)


    %comprobamos si hemos encotrado la ra�z
    if abs(fx)<=tol
        raiz=x;
        iter=1;
        err=fx;

    else
        iter=1;

        %aqui tenemos el bucle de la muerte...
        %redefinimos los puntos
        x0=x1;
        fx0=fx1;
        x1=x;
        fx1=fx;
        while(abs(fx)>tol)&(iter<=maxiter)
            %calculamos un nuevo punto y su valor f(x)

            x=x1-(x1-x0)*fx1/(fx1-fx0);
            fx=feval(fun,x);

            iter=iter+1;
            x0=x1;
            fx0=fx1;
            x1=x;
            fx1=fx;
        end
        %devolvemos los resultados en las variables de salida...
        raiz=x;
        err=fx;
        %iter ya tiene el nombre correcto

    end
end
