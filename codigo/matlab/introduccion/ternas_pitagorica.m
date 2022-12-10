%generación de ternas pitagóricas
%dados dos enteros positivos m > n
%a = m^2 - n^2
%b = 2*m*n
%c = m^2 + n^2
%forman una terna pitagorica -> a^2 + b^2 = c^2
%todas las posibles para1 a  m arbitrario
m = 10;
%numero total de ternas
s = (m-1)*m/2;
t = zeros(s,4);
k = 0
for i = 1:m
    for j = 1:i-1
        %se quieren guardar una debajo de otra
        k = k + 1;
        t(k,1) = i^2 - j^2;
        t(k,2) = 2*i*j;
        t(k,3) = i^2 + j^2;
        t(k,4) = sqrt(t(k,1)^2 + t(k,2)^2); %comprobacion
    end
end
plot(t(:,1),t(:,2),'+')
hold on
plot(t(:,2),t(:,1),'o')

        