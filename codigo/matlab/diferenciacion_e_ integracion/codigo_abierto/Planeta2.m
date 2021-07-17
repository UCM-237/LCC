function Planeta(m,x,v0,tfinal)
%planeta sometido a una fuerza central
%m masa del 'sol'
%x=posici�n inicial, vector x=[x(1),x(2)]
%v=velocidad inicial vector v=[v(1),v(2)]
%Dependiendo de las condiciones iniciales y la masa del sol EL planetilla
%hace una orbita distinta.  Todas las unidades son arbitrarias G=1
%empezar probando con Planeta(1,[1 0],[0 0.6],100) da orbitas eliptica.
% A partir de ah� es jugar con los parametros para obtener
%distintas orbitas,OJO. ESTAS ECUACIONES SE VEN MUY AFECTADAS POR ERRORES
%NUMERICOS SI SE DESCOMPENSAN MUCHOS LOS PARAMETROS los FENOMENOS QUE SE
%OBSERVAN SE DEBEN SOBRE TODO A ESTOS ERRORES... VAMOS QUE HA NADIE SE LE
%OCURRE RESOLVER UN PROBLEMA REAL DE ESTOS USANDO EULER...
dt=0.01
t=0
h=plot(x(1),x(2),'o','MarkerFaceColor','b','MarkerSize',5);
hold on
plot(0,0,'oy','MarkerSize',10,'MarkerFaceColor','r')
while t<=tfinal
t=t+dt;
v(1)=v0(1)-m*dt*x0(1)/(x0(1)^2+x0(2)^2)^(3/2); %integro la componente (1) de la fuerza
v(2)=v0(2)-m*dt*x0(2)/(x0(1)^2+x0(2)^2)^(3/2); %integro la componente (2) de la fuerza
x(1)=x0(1)+v0(1)*dt; %integro velocidades y obtengo posiciones
x(2)=x0(2)+v0(2)*dt;
delete(h)
h=plot(x(1),x(2),'o','MarkerFaceColor','b','MarkerSize',5); 
hold on
plot(x(1),x(2),'.b') %dibuja el trazado de la orbita, si se comenta esta linea se ve solo
%el planeta moverse
drawnow
v0 = v;
x0 =x;
end