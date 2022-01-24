
%Se configura el canal
voz=audiorecorder(44100,16,1);
%Mensaje a la consola donde el usuario puede comenzar a hablar
disp('Start speaking.');
%Comienza a tomar el audio en lapso de 2 segundos
recordblocking(voz, 1.5);
%Mensaje a la consola donde se termia la grabación de audio
disp('End of Recording.');
%Reproducimos audio
play(voz);
%Todos los datos del audio son guardados en un arreglo
y = getaudiodata(voz);

%Se plotea el arreglo guardado en y
figure(1)
plot(y,'g','linewidth',1.5);
xlabel('tiempo (t)')
title('Señal de Entrada'),ylim([-1 1])
grid on;

%Se le aplica hamming a la señal para quitar el mayor ruido posible
yh = y.*hamming(length(y));

%Se plotea el espectrograma de nuestra señal
figure(2)
spectrogram(yh);

%Se le aplica transformada rapida de Fourier a yh
rfft=abs(fft(yh));
%Se obtiene solo la parte principal de los datos
rfft=abs(rfft(1:round(numel(rfft)/2)));
%Se crea el arreglo para el eje de x y asi plotear rfft
f=(0:length(rfft)-1)*(44100/2)/(numel(rfft)-1);

%figure(5);
%plot(f,yh,'g',1.5);

%Gráfica de la transformada de Fourier
figure(3);
plot(f,rfft,'g');
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
scatter(x1,y1,'g');
xlabel('Frecuencia (Hz)')
ylabel('Amplitud')
title('Frecuencia fundamental de tu vocal');

if (y1>=1000 && y1<=2100)
    disp("Vocal A"); 
    disp("Genero: Hombre");
elseif (y1>=470 && y1<=600)
    disp("Vocal E"); 
    disp("Genero: Hombre");
elseif (y1>=601 && y1<=680 || y1>=280 && y1<=310)
    disp("Vocal I"); 
    disp("Genero: Hombre");
elseif (y1>=730 && y1<=999)
    disp("Vocal O"); 
    disp("Genero: Hombre");
elseif (y1>=315 && y1<=380)
    disp("Vocal U"); 
    disp("Genero: Hombre");
else
    disp("Error en la identificación");
end

%{
    if (y1>=222 && y1<=230)
        disp("Vocal A"); 
        disp("Genero: Mujer");
    elseif (y1>=681 && y1<=700)
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
%}




