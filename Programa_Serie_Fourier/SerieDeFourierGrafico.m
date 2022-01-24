
N = input('Introduce el valor de n: ');

x = -3*pi:0.01:3*pi;

sum = 0;

for n=1:N
    y = -pi*sin(n*x)*(2*sin(n*pi)*(6/n^4 - (3*pi^2)/n^2) - 2*cos(n*pi)*((6*pi)/n^3 - pi^3/n)) ;
    sum = sum + y;
    plot(x,sum);
    grid on
    xlim([-2*pi 2*pi])
    xticks([-3*pi -2*pi -pi 0 pi 2*pi 3*pi])
    xticklabels({'-3\pi','-2\pi','-\pi','0','\pi','2\pi','3\pi'})
    pause(.5) 
end