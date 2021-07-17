function pendulo2(L,theta,w,tfinal,dt)
%problema del pendulo. Calculamos del movimiento de un pendulo simple de
%dos maneras: a partir de la ecuacion del pendulo y aproximando sen(theta)
%por el angulo theta... Se ve muy bien la diferencia en el periodo para
%angulos grandes (probar por ejemplo para pi/2 y para angulos peque�os y
%distintas longitudes)
%L=Longitud del pendulo
%dt Intervalo de tiempo empleado en la integracion por Euler
t=0 %inicializamos el tiempo a cero
wf0=w %Inicializamos la velocidad
w0 = w
thetaf0=theta %inicializamos el angulo de desplazamiento de la vertical
w0 = w
theta0 = theta
%calculamos la velocidad (Euler)
while t<=tfinal
t=t+dt;
%pendulo autentico
wf=wf0-9.8*sin(thetaf0)*dt/L; %integro para obtener las velocidades sucesivas
thetaf=thetaf0+wf0*dt; %integro para obtener las posiciones sucesivas

%pendulo aproximado
w=w0-9.8*theta0*dt/L; %integro para obtener las velocidades sucesivas
theta=theta0+w0*dt;  %integro para obtener las velocidades sucesivas


hold on
plot(t,thetaf,'.b')
plot(t,theta,'.r')
drawnow
wf0 = wf;
thetaf0 = thetaf;
w0 = w;
theta0 = theta;
end