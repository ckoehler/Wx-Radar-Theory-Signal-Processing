lambda = lambda/100;

% ==========
% = Part 4 =
% ==========

% desired azimuth
iaz = 130; 

% desired range
ir = 300; 
% Number of points for DFT (zero-padding)
npts = 64;

if ~exist('X_h','var') & ~exist('X_v','var') 
	fprintf('No data to process.\n'); 
end
X=X_h;
% % extract time series data
% 
time_series = squeeze(X(iaz,ir,:)); 
time = [1:length(time_series)]*pri; 
va = lambda/4/pri; 

% neg for vf fd neg relationship 
vel=-[-npts/2:(npts/2)-1]*2*va/npts; 

% % data window % 
d=boxcar(num_pulses); 
% calculate psd % 
S=periodogramse(time_series,d,npts); 
S=(pri*abs(fftshift(S))); 

% plot time data I/Q also
subplot(2,1,1);
plot(time, real(time_series), time, imag(time_series));
xlabel('time (s)'); 
ylabel('Voltage (V)'); 
title('I / Q data');
legend('I', 'Q');

% % plot % 
subplot(2,1,2);
plot(vel,S); 
grid on; 
xlabel('Radial Velocity (m/s)'); 
ylabel('S(f) (arbitrary power units)'); 
title('Periodogram');