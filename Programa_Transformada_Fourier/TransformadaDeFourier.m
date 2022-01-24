clear all
clc
%% señal
Fs=512; %% Frecuencia de muestreo debe de ser 
        %% >= al doble de la frecuencia mas grande de la señal 
Ts=1/Fs; %%Periodo de muestreo
L=1024; %% Longitud de las muestras de la señal debe de ser > Fs 2 a la n 
t=(0:L-1).*Ts;
s=2*sin(2*pi*5*t)+sin(2*pi*12.5*t)+1.5*sin(2*pi*20*t)+0.5*sin(2*pi*155*t); %%señal
subplot(2,1,1),plot(t,s),title('Señal')

%%Espectro de frecuencias
Y=fft(s);
P1=2.*(abs(Y(1:L/2)/L));
f=Fs.*(0:(L/2)-1)./L; %% Vector de frecuencias
subplot(2,1,2),plot(f,P1),title('Tranformada de Fourier')