clear;
f = 100;
fs = 100000;
ncycles = 5;
A = 1;

sangle = 2*pi*f/fs;
t = 0:sangle:ncycles*(2*pi);
X = A*sin(t);


subplot(2,2,1);
plot(t, X);
title('X = 100 Hz sinusoid sampled at 100kHz');

subplot(2,2,2);
M = pmusic(X,1);
plot(M);
title('pmusic(X,1)');
axis([0 40 0 7*10^29]);

subplot(2,2,3);
P = periodogram(X);
plot(P);
title('Periodogram(X)');
axis([0 40 0 400]);

subplot(2,2,4);
pyulear(X, 8);
title('Yule Walker 8th order on X');
