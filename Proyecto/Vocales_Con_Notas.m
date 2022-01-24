
[notaVoz,ruta]=uigetfile('*.m4a','Selecciona una nota de voz');
voz=strcat(ruta,notaVoz);
[y,Fs]=audioread(voz);
sound(y,Fs);
%Se plotea el arreglo guardado en y
figure(1)
plot(y,'b','linewidth',1.5);
xlabel('tiempo (t)')
title('Señal de Entrada'),ylim([-1 1])
grid on;

%Se le aplica hamming a la señal para quitar el mayor ruido posible
yh = y.*hamming(length(y));

%Se plotea el espectrograma de nuestra señal
%figure(2)
%spectrogram(yh);

%Se le aplica transformada rapida de Fourier a yh
rfft=abs(fft(yh));
%Se obtiene solo la parte principal de los datos
rfft=abs(rfft(1:round(numel(rfft)/2)));
%Se crea el arreglo para el eje de x y asi plotear Y
f=(0:length(rfft)-1)*(44100/2)/(numel(rfft)-1);

%Gráfica de la transformada de Fourier
figure(3);
plot(f,rfft);
xlabel('Frecuencia (Hz)')
ylabel('Amplitud');
title('Espectro de mi vocal');

%Obtiene la Frecuencia Fundamenta de la vocal
[x1,y1] = max(rfft);
disp("Máxima Amplitud");
disp(x1);
disp(y1);

%Se plotea el punto de la frecuencia fundamental de la vocal
figure(4);
scatter(y1,x1);
xlabel('Frecuencia (Hz)')
ylabel('Amplitud')
title('Frecuencia fundamental de tu vocal');

%Hombre
if (y1>=750 && y1<=800)
    disp("Vocal A"); 
    disp("Genero: Hombre");
elseif (y1>=320 && y1<=350)
    disp("Vocal E"); 
    disp("Genero: Hombre");
elseif (y1>=300 && y1<=319)
    disp("Vocal I"); 
    disp("Genero: Hombre");
elseif (y1>=500 && y1<=520)
    disp("Vocal O"); 
    disp("Genero: Hombre");
elseif (y1>=351 && y1<=380)
    disp("Vocal U"); 
    disp("Genero: Hombre");
elseif (y1>=222 && y1<=230)
    disp("Vocal A"); 
    disp("Genero: Mujer");
elseif (y1>=219 && y1<=221)
    disp("Vocal E"); 
    disp("Genero: Mujer");
elseif (y1>=260 && y1<=370)
    disp("Vocal I"); 
    disp("Genero: Mujer");
elseif (y1>=680 && y1<=700)
    disp("Vocal O"); 
    disp("Genero: Mujer");
elseif (y1>=250 && y1<=260)
    disp("Vocal U"); 
    disp("Genero: Mujer");
else
    disp("Error en la identificación");
end