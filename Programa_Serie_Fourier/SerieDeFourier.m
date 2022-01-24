% Programa Serie de Fourier

clc,clear

syms x n;

f = input('Introduce la función: ');

L = input('Introduce el periodo: ');

a0 = ((1\L)*int(f,-L,L));

f1 = f*(cos((n*pi*x)/L));

aN = ((1\L)*int(f1,-L,L));

f2 = f*(sin((n*pi*x)/L));

bN = ((1\L)*int(f2,-L,L));

y = (a0/2) + (aN*(cos((n*pi*x)/L))) + (bN*(sin((n*pi*x)/L)));

fprintf('Resultado = %s \n', y);
