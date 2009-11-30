% clear;
% load iq_OUPRIME_20090613_0328_e1.29_prt2.mat;

lambda1 = lambda / 100;

% desired azimuth
iaz = 130;

% desired range
ir = 300;

% number of data points (zero padding)
npts = 1024;

X=X_h;

% ===============
% = Time Series =
% ===============
% % extract time series data

time_series = squeeze(X(iaz,ir,:));
time = [1:length(time_series)]*pri;
va = lambda1/4/pri;

% plot time data I/Q also
subplot(3,2,1);
plot(time, real(time_series), time, imag(time_series));
xlabel('time (s)');
ylabel('Voltage (V)');
title('I / Q data');
legend('I', 'Q');


% ===============
% = Periodogram =
% ===============

% neg for vf fd neg relationship
f = [-npts/2:(npts/2)-1];
vel=-f*2*va/npts;

% window
d=boxcar(num_pulses);

% calculate psd %
S=periodogramse(time_series,d,npts);
S=(pri*abs(fftshift(S)));


subplot(3,2,2);
plot(vel,S);
grid on;
xlabel('Radial Velocity (m/s)');
ylabel('S(f) (arbitrary power units)');
title('Periodogram');


% ===============
% = yule walker =
% ===============

n=4;
[a sig2]=yulewalker(time_series,n);

[h,F] = freqz([1],a,npts, 'whole');
Phiest = pri*fftshift(sig2*abs(h).^2);


subplot(3,2,3);
plot(vel,Phiest);
xlabel('samples');
ylabel('S(f) (arbitrary power units)');
title('Yule Walker');


% ==========
% = MUSIC =
% ==========
n = 1;
m = 2*n;

w= music(time_series,n,m);
w = -(w)/pi*va;
subplot(3,2,4);
stem(w, ones(length(w)));
axis([-va-1 va+1 0 2]);
xlabel('samples');
ylabel('S(f) (arbitrary power units)');
title('MUSIC');

% =========
% = Capon =
% ========= 
n = 16;
phi = capon(time_series,n,npts);

phi = fftshift(phi);
subplot(3,2,5);
plot(vel,phi);
xlabel('Radial Velocity (m/s)');
ylabel('S(f) (arbitrary power units)');
title('Capon');