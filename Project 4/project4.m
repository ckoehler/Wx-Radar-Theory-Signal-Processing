lambda = lambda/100;

% ==========
% = Part 4 =
% ==========

	% % desired azimuth
	% iaz = 130; 
	% 
	% % desired range
	% ir = 300; 
	% 
	% % number of data points (zero padding)
	% npts = 64;
	% 
	% if ~exist('X_h','var') & ~exist('X_v','var') 
	% 	fprintf('No data to process.\n'); 
	% end
	% X=X_h;
	% 
	% % % extract time series data
	% % 
	% time_series = squeeze(X(iaz,ir,:)); 
	% time = [1:length(time_series)]*pri; 
	% va = lambda/4/pri; 
	% 
	% % neg for vf fd neg relationship 
	% vel=-[-npts/2:(npts/2)-1]*2*va/npts; 
	% 
	% % % data window % 
	% d=boxcar(num_pulses); 
	% % calculate psd % 
	% S=periodogramse(time_series,d,npts); 
	% S=(pri*abs(fftshift(S))); 
	% 
	% % plot time data I/Q also
	% subplot(2,1,1);
	% plot(time, real(time_series), time, imag(time_series));
	% xlabel('time (s)'); 
	% ylabel('Voltage (V)'); 
	% title('I / Q data');
	% legend('I', 'Q');
	% 
	% % % plot % 
	% subplot(2,1,2);
	% plot(vel,S); 
	% grid on; 
	% xlabel('Radial Velocity (m/s)'); 
	% ylabel('S(f) (arbitrary power units)'); 
	% title('Periodogram');

% ==========
% = Part 5 =
% ==========

%%%
% storm samples
%%%%

% % az: 120
% % ranges: 72,52, 50(alias), 45
% 	ranges_to_plot = [45, 50, 52, 72]
% 	
% 	% first, storm data
% 	% desired azimuth
% 	iaz = 120; 
% 
% for ii=1:4
% 	
% 	% desired range
% 	% ir = 65; 
% 	ir = ranges_to_plot(ii);
% 	
% 	% number of data points (zero padding)
% 	npts = 64;
% 
% 	if ~exist('X_h','var') & ~exist('X_v','var') 
% 		fprintf('No data to process.\n'); 
% 	end
% 	X=X_h;
% 
% 	% % extract time series data
% 	% 
% 	time_series = squeeze(X(iaz,ir,:)); 
% 	time = [1:length(time_series)]*pri; 
% 	va = lambda/4/pri; 
% 
% 	% neg for vf fd neg relationship 
% 	vel=-[-npts/2:(npts/2)-1]*2*va/npts; 
% 
% 	% % data window % 
% 	d=boxcar(num_pulses); 
% 	% calculate psd % 
% 	S=periodogramse(time_series,d,npts); 
% 	S=(pri*abs(fftshift(S))); 
% 
% 	% plot time data I/Q also
% 	subplot(4,2,ii*2-1);
% 	plot(time, real(time_series), time, imag(time_series));
% 	xlabel('time (s)'); 
% 	ylabel('Voltage (V)'); 
% 	title_str = sprintf('I / Q data @ gate %i', ranges_to_plot(ii));
% 	title(title_str);
% 	legend('I', 'Q');
% 
% 	% % plot % 
% 	subplot(4,2,2*ii);
% 	plot(vel,S); 
% 	grid on; 
% 	xlabel('Radial Velocity (m/s)'); 
% 	ylabel('S(f) (arbitrary power units)'); 
% 	title('Periodogram');
% end

%%%
% ground clutter samples
%%%%

% az: 120
% ranges: 17-20 for ground clutter
	% ranges_to_plot = [17:20];
	% 	
	% % first, storm data
	% % desired azimuth
	% iaz = 120; 
	% 
	% plot_index = 1;
	% for ii=1:length(ranges_to_plot)
	% 
	% 	% desired range
	% 	% ir = 65; 
	% 	ir = ranges_to_plot(ii);
	% 
	% 	% number of data points (zero padding)
	% 	npts = 64;
	% 
	% 	if ~exist('X_h','var') & ~exist('X_v','var') 
	% 		fprintf('No data to process.\n'); 
	% 	end
	% 	X=X_h;
	% 
	% 	% % extract time series data
	% 	% 
	% 	time_series = squeeze(X(iaz,ir,:)); 
	% 	time = [1:length(time_series)]*pri; 
	% 	va = lambda/4/pri; 
	% 
	% 	% neg for vf fd neg relationship 
	% 	vel=-[-npts/2:(npts/2)-1]*2*va/npts; 
	% 
	% 	% % data window % 
	% 	d=boxcar(num_pulses); 
	% 	% calculate psd % 
	% 	S=periodogramse(time_series,d,npts); 
	% 	S=(pri*abs(fftshift(S))); 
	% 
	% 	% plot time data I/Q also
	% 	subplot(4,2,plot_index*2-1);
	% 	plot(time, real(time_series), time, imag(time_series));
	% 	xlabel('time (s)'); 
	% 	ylabel('Voltage (V)'); 
	% 	title_str = sprintf('I / Q data @ gate %i', ranges_to_plot(ii));
	% 	title(title_str);
	% 	legend('I', 'Q');
	% 
	% 	% % plot % 
	% 	subplot(4,2,2*plot_index);
	% 	plot(vel,S); 
	% 	grid on; 
	% 	xlabel('Radial Velocity (m/s)'); 
	% 	ylabel('S(f) (arbitrary power units)'); 
	% 	title('Periodogram');
	% 
	%     if(mod(ii,4) == 0)
	% 		plot_index = 1;
	% 		figure;
	%     else
	%         plot_index = plot_index + 1 ;
	%     end
	% 
	% end
	
% ==========
% = Part 6 =
% ==========
	% ranges_to_plot = [19, 20, 52, 72];
	% 
	% % Bartlett and Boxcar windows
	% % desired azimuth
	% iaz = 120; 
	% 
	% plot_index = 1;
	% for ii=1:length(ranges_to_plot)
	% 
	% 	% desired range
	% 	% ir = 65; 
	% 	ir = ranges_to_plot(ii);
	% 
	% 	% number of data points (zero padding)
	% 	npts = 64;
	% 
	% 	if ~exist('X_h','var') & ~exist('X_v','var') 
	% 		fprintf('No data to process.\n'); 
	% 	end
	% 	X=X_h;
	% 
	% 	% % extract time series data
	% 	% 
	% 	time_series = squeeze(X(iaz,ir,:)); 
	% 	time = [1:length(time_series)]*pri; 
	% 	va = lambda/4/pri; 
	% 
	% 	% neg for vf fd neg relationship 
	% 	vel=-[-npts/2:(npts/2)-1]*2*va/npts; 
	% 
	% 	% % data window % 
	% 	d=boxcar(num_pulses); 
	% 	% calculate psd % 
	% 	S=periodogramse(time_series,d,npts); 
	% 	S=(pri*abs(fftshift(S))); 
	% 
	% 	% % data window % 
	% 	d=boxcar(num_pulses); 
	% 	% calculate psd % 
	% 	S=periodogramse(time_series,d,npts); 
	% 	S=(pri*abs(fftshift(S))); 
	% 
	% 	% % plot % 
	% 	subplot(4,2,2*plot_index);
	% 	plot(vel,S); 
	% 	grid on; 
	% 	xlabel('Radial Velocity (m/s)'); 
	% 	ylabel('S(f) (arbitrary power units)'); 
	% 	title('Periodogram, Boxcar window');
	% 
	% 	% % data window % 
	% 	d=bartlett(num_pulses); 
	% 	% calculate psd % 
	% 	S=periodogramse(time_series,d,npts); 
	% 	S=(pri*abs(fftshift(S)));
	% 
	% 	% % plot % 
	% 	subplot(4,2,2*plot_index-1);
	% 	plot(vel,S); 
	% 	grid on; 
	% 	xlabel('Radial Velocity (m/s)'); 
	% 	ylabel('S(f) (arbitrary power units)'); 
	% 	title('Periodogram, Bartlett Window');
	% 
	%     if(mod(ii,4) == 0)
	% 		plot_index = 1;
	% 		figure;
	%     else
	%         plot_index = plot_index + 1 ;
	%     end
	% end

	% Bartlett and Boxcar windows
	% desired azimuth
	iaz = 120; 

	plot_index = 1;
	for ii=1:length(ranges_to_plot)

		% desired range
		% ir = 65; 
		ir = ranges_to_plot(ii);

		% number of data points (zero padding)
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

		% % data window % 
		d=barthannwin(num_pulses); 
		% calculate psd % 
		S=periodogramse(time_series,d,npts); 
		S=(pri*abs(fftshift(S))); 

		% % plot % 
		subplot(4,2,2*plot_index);
		plot(vel,S); 
		grid on; 
		xlabel('Radial Velocity (m/s)'); 
		ylabel('S(f) (arbitrary power units)'); 
		title('Periodogram, Bartlett-Hanning window');

		% % data window % 
		d=blackmanharris(num_pulses); 
		% calculate psd % 
		S=periodogramse(time_series,d,npts); 
		S=(pri*abs(fftshift(S)));

		% % plot % 
		subplot(4,2,2*plot_index-1);
		plot(vel,S); 
		grid on; 
		xlabel('Radial Velocity (m/s)'); 
		ylabel('S(f) (arbitrary power units)'); 
		title('Periodogram, Blackman-Harris window');

	    if(mod(ii,4) == 0)
			plot_index = 1;
			figure;
	    else
	        plot_index = plot_index + 1 ;
	    end
	end