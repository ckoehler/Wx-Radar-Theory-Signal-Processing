% clear;
% load iq_OUPRIME_20090613_0328_e1.29_prt2.mat;

lambda1 = lambda / 100;

% desired azimuth
iaz = 130;

% desired range
ir = 300;

% number of data points (zero padding)
npts = 512;

if ~exist('X_h','var') & ~exist('X_v','var')
	fprintf('No data to process.\n');
end
X=X_h;

% % extract time series data
%
time_series = squeeze(X(iaz,ir,:));
time = [1:length(time_series)]*pri;
va = lambda1/4/pri;

% neg for vf fd neg relationship
f = [-npts/2:(npts/2)-1];
vel=-f*2*va/npts;

% % data window %
d=boxcar(num_pulses);
% calculate psd %
S=periodogramse(time_series,d,npts);
S=(pri*abs(fftshift(S)));

% plot time data I/Q also
subplot(3,2,1);
plot(time, real(time_series), time, imag(time_series));
xlabel('time (s)');
ylabel('Voltage (V)');
title('I / Q data');
legend('I', 'Q');

% % plot %
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

h = freqz([1],a,npts);
Phiest = pri*fftshift(sig2*abs(h).^2);


subplot(3,2,3);
plot(Phiest);
xlabel('samples');
ylabel('S(f) (arbitrary power units)');
title('Yule Walker');


% ==========
% = MUSIC =
% ==========
m = 10;

w=music(time_series,n,m);

subplot(3,2,4);
plot(w);
xlabel('samples');
ylabel('S(f) (arbitrary power units)');
title('MUSIC');

% =========
% = Capon =
% ========= 
phi = capon(time_series,n,npts);

phi = fftshift(phi);
subplot(3,2,5);
plot(phi);
xlabel('samples');
ylabel('S(f) (arbitrary power units)');
title('Capon');