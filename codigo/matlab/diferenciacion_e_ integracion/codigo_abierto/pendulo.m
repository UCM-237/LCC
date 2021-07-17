function pendulo(L,theta,w,tfinal,dt)
%problema del pendulo. Calculamos del movimiento de un pendulo simple de
%dos maneras: a partir de la ecuacion del pendulo y aproximando sen(theta)
%por el angulo theta... Se ve muy bien la diferencia en el periodo para
%angulos grandes (probar por ejemplo para pi/2 y para angulos peque�os y
%distintas longitudes)
%L=Longitud del pendulo
%dt Intervalo de tiempo empleado en la integracion por Euler
t=0 %inicializamos el tiempo a cero
wf=w %Inicializamos la velocidad 
thetaf=theta %inicializamos el angulo de desplazamiento de la vertical
%calculamos la velocidad (Euler)
while t<=tfinal
t=t+dt;
%pendulo autentico
w=w-9.8*sin(theta)*dt/L; %integro para obtener las velocidades sucesivas
theta=theta+w*dt; %integro para obtener las posiciones sucesivas

%pendulo aproximado
wf=wf-9.8*thetaf*dt/L; %integro para obtener las velocidades sucesivas
thetaf=thetaf+wf*dt;  %integro para obtener las velocidades sucesivas


hold on
plot(t,theta,'.')
plot(t,thetaf,'.r')
drawnow
end