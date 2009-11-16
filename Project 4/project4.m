lambda1 = lambda/100;

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
	% va = lambda1/4/pri;
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
%%
%  %storm samples
% %%%
%  % az: 120
%  % ranges: 72,52, 50(alias), 45
%  	ranges_to_plot = [45, 50, 52, 72]
%
%  	% first, storm data
%  	% desired azimuth
%  	iaz = 120;
%
%  for ii=1:4
%
%  	% desired range
%  	% ir = 65;
%  	ir = ranges_to_plot(ii);
%
%  	% number of data points (zero padding)
%  	npts = 64;
%
%  	if ~exist('X_h','var') & ~exist('X_v','var')
%  		fprintf('No data to process.\n');
%  	end
%  	X=X_h;
%
%  	% % extract time series data
%  	%
%  	time_series = squeeze(X(iaz,ir,:));
%  	time = [1:length(time_series)]*pri;
%  	va = lambda1/4/pri;
%
%  	% neg for vf fd neg relationship
%  	vel=-[-npts/2:(npts/2)-1]*2*va/npts;
%
%  	% % data window %
%  	d=boxcar(num_pulses);
%  	% calculate psd %
%  	S=periodogramse(time_series,d,npts);
%  	S=(pri*abs(fftshift(S)));
%
%  	% plot time data I/Q also
%  	subplot(4,2,ii*2-1);
%  	plot(time, real(time_series), time, imag(time_series));
%  	xlabel('time (s)');
%  	ylabel('Voltage (V)');
%  	title_str = sprintf('I / Q data @ gate %i', ranges_to_plot(ii));
%  	title(title_str);
%  	legend('I', 'Q');
%
%  	% % plot %
%  	subplot(4,2,2*ii);
%  	plot(vel,S);
%  	grid on;
%  	xlabel('Radial Velocity (m/s)');
%  	ylabel('S(f) (arbitrary power units)');
%  	title('Periodogram');
%  end
% %
%ground clutter samples
%
%az 120
% %%rages: 17-20 for ground clutter
% 	 ranges_to_plot = [17:20];
%
% 	 % first, storm data
% 	 % desired azimuth
% 	 iaz = 120;
%
% 	 plot_index = 1;
% 	 for ii=1:length(ranges_to_plot)
%
% 	 	% desired range
% 	 	% ir = 65;
% 	 	ir = ranges_to_plot(ii);
%
% 	 	% number of data points (zero padding)
% 	 	npts = 64;
%
% 	 	if ~exist('X_h','var') & ~exist('X_v','var')
% 	 		fprintf('No data to process.\n');
% 	 	end
% 	 	X=X_h;
%
% 	 	% % extract time series data
% 	 	%
% 	 	time_series = squeeze(X(iaz,ir,:));
% 	 	time = [1:length(time_series)]*pri;
% 	 	va = lambda1/4/pri;
%
% 	 	% neg for vf fd neg relationship
% %	 	vel=-[-npts/2:(npts/2)-1]*2*va/npts;
%
% 	 	% % data window %
% 	 	d=boxcar(num_pulses);
% 	 	% calculate psd %
% 	 	S=periodogramse(time_series,d,npts);
% 	 	S=(pri*abs(fftshift(S)));
%
% 	 	% plot time data I/Q also
% 	 	subplot(4,2,plot_index*2-1);
% 	 	plot(time, real(time_series), time, imag(time_series));
% 	 	xlabel('time (s)');
% 	 	ylabel('Voltage (V)');
% 	 	title_str = sprintf('I / Q data @ gate %i', ranges_to_plot(ii));
% 	 	title(title_str);
% 	 	legend('I', 'Q');
%
% 	 	% % plot %
% 	 	subplot(4,2,2*plot_index);
% 	 	plot(vel,S);
% 	 	grid on;
% 	 	xlabel('Radial Velocity (m/s)');
% 	 	ylabel('S(f) (arbitrary power units)');
% 	 	title('Periodogram');
%
% 	     if(mod(ii,4) == 0)
% 	 		plot_index = 1;
% 	 		figure;
% 	     else
% 	         plot_index = plot_index + 1 ;
% 	     end
%
% 	 end
	%  %noise samples
%%%
 % az: 180
 % ranges: 600 to 603
%  	ranges_to_plot = [600:603]
%
%  	% first, storm data
%  	% desired azimuth
%  	iaz = 120;
%
%  for ii=1:4
%
%  	% desired range
%  	% ir = 65;
%  	ir = ranges_to_plot(ii);
%
%  	% number of data points (zero padding)
%  	npts = 64;
%
%  	if ~exist('X_h','var') & ~exist('X_v','var')
%  		fprintf('No data to process.\n');
%  	end
%  	X=X_h;
%
%  	% % extract time series data
%  	%
%  	time_series = squeeze(X(iaz,ir,:));
%  	time = [1:length(time_series)]*pri;
%  	va = lambda1/4/pri;
%
%  	% neg for vf fd neg relationship
%  	vel=-[-npts/2:(npts/2)-1]*2*va/npts;
%
%  	% % data window %
%  	d=boxcar(num_pulses);
%  	% calculate psd %
%  	S=periodogramse(time_series,d,npts);
%  	S=(pri*abs(fftshift(S)));
%
%  	% plot time data I/Q also
%  	subplot(4,2,ii*2-1);
%  	plot(time, real(time_series), time, imag(time_series));
%  	xlabel('time (s)');
%  	ylabel('Voltage (V)');
%  	title_str = sprintf('I / Q data @ gate %i', ranges_to_plot(ii));
%  	title(title_str);
%  	legend('I', 'Q');
%
%  	% % plot %
%  	subplot(4,2,2*ii);
%  	plot(vel,S);
%  	grid on;
%  	xlabel('Radial Velocity (m/s)');
%  	ylabel('S(f) (arbitrary power units)');
%  	title('Periodogram');
%  end
% ==========
% = Part 6 =
% ==========
% 	ranges_to_plot = [19, 20, 52, 72];
%
% 	% Bartlett and Boxcar windows
% 	% desired azimuth
% 	iaz = 120;
%
% 	plot_index = 1;
% 	for ii=1:length(ranges_to_plot)
%
% 		% desired range
% 		% ir = 65;
% 		ir = ranges_to_plot(ii);
%
% 		% number of data points (zero padding)
% 		npts = 64;
%
% 		if ~exist('X_h','var') & ~exist('X_v','var')
% 			fprintf('No data to process.\n');
% 		end
% 		X=X_h;
%
% 		% % extract time series data
% 		%
% 		time_series = squeeze(X(iaz,ir,:));
% 		time = [1:length(time_series)]*pri;
% 		va = lambda1/4/pri;
%
% 		% neg for vf fd neg relationship
% 		vel=-[-npts/2:(npts/2)-1]*2*va/npts;
%
% 		% % data window %
% 		d=boxcar(num_pulses);
% 		% calculate psd %
% 		S=periodogramse(time_series,d,npts);
% 		S=(pri*abs(fftshift(S)));
%
% 		% % data window %
% 		d=boxcar(num_pulses);
% 		% calculate psd %
% 		S=periodogramse(time_series,d,npts);
% 		S=(pri*abs(fftshift(S)));
%
% 		% % plot %
% 		subplot(4,2,2*plot_index);
% 		plot(vel,S);
% 		grid on;
% 		xlabel('Radial Velocity (m/s)');
% 		ylabel('S(f) (arbitrary power units)');
% 		title('Periodogram, Boxcar window');
%
% 		% % data window %
% 		d=bartlett(num_pulses);
% 		% calculate psd %
% 		S=periodogramse(time_series,d,npts);
% 		S=(pri*abs(fftshift(S)));
%
% 		% % plot %
% 		subplot(4,2,2*plot_index-1);
% 		plot(vel,S);
% 		grid on;
% 		xlabel('Radial Velocity (m/s)');
% 		ylabel('S(f) (arbitrary power units)');
% 		title('Periodogram, Bartlett Window');
%
% 	    if(mod(ii,4) == 0)
% 			plot_index = 1;
% 			figure;
% 	    else
% 	        plot_index = plot_index + 1 ;
% 	    end
% 	end

% 	% Bartlett and Boxcar windows
% 	%desired azimuth
% 	iaz = 120;
%
% 	plot_index = 1;
% 	for ii=1:length(ranges_to_plot)
%
% 		% desired range
% 		% ir = 65;
% 		ir = ranges_to_plot(ii);
%
% 		% number of data points (zero padding)
% 		npts = 64;
%
% 		if ~exist('X_h','var') & ~exist('X_v','var')
% 			fprintf('No data to process.\n');
% 		end
% 		X=X_h;
%
% 		% % extract time series data
% 		%
% 		time_series = squeeze(X(iaz,ir,:));
% 		time = [1:length(time_series)]*pri;
% 		va = lambda1/4/pri;
%
% 		% neg for vf fd neg relationship
% 		vel=-[-npts/2:(npts/2)-1]*2*va/npts;
%
% 		% % data window %
% 		d=boxcar(num_pulses);
% 		% calculate psd %
% 		S=periodogramse(time_series,d,npts);
% 		S=(pri*abs(fftshift(S)));
%
% 		% % data window %
% 		d=barthannwin(num_pulses);
% 		% calculate psd %
% 		S=periodogramse(time_series,d,npts);
% 		S=(pri*abs(fftshift(S)));
%
% 		% % plot %
% 		subplot(4,2,2*plot_index);
% 		plot(vel,S);
% 		grid on;
% 		xlabel('Radial Velocity (m/s)');
% 		ylabel('S(f) (arbitrary power units)');
% 		title('Periodogram, Bartlett-Hanning window');
%
% 		% % data window %
% 		d=blackmanharris(num_pulses);
% 		% calculate psd %
% 		S=periodogramse(time_series,d,npts);
% 		S=(pri*abs(fftshift(S)));
%
% 		% % plot %
% 		subplot(4,2,2*plot_index-1);
% 		plot(vel,S);
% 		grid on;
% 		xlabel('Radial Velocity (m/s)');
% 		ylabel('S(f) (arbitrary power units)');
% 		title('Periodogram, Blackman-Harris window');
%
% 	    if(mod(ii,4) == 0)
% 			plot_index = 1;
% 			figure;
% 	    else
% 	        plot_index = plot_index + 1 ;
% 	    end
% 	end

% ==========
% = Part 7 =
% ==========
%
% 	% desired azimuth
% 	iaz = 123;
%
% 	% desired range
% 	ir = 60;
%
%
% 	for ii=1:8
% 		% number of data points (zero padding)
% 		npts = 8*ii;
% 		if ~exist('X_h','var') & ~exist('X_v','var')
% 			fprintf('No data to process.\n');
% 		end
% 		X=X_h;
%
% 		% % extract time series data
% 		%
% 		time_series = squeeze(X(iaz,ir,:));
% 		time = [1:length(time_series)]*pri;
% 		va = lambda1/4/pri;
%
% 		% neg for vf fd neg relationship
% 		vel=-[-npts/2:(npts/2)-1]*2*va/npts;
%
% 		% % data window %
% 		d=boxcar(num_pulses);
% 		% calculate psd %
% 		S=periodogramse(time_series,d,npts);
% 		S=(pri*abs(fftshift(S)));
%
% 		% % plot %
% 		subplot(4,2,ii);
% 		plot(vel,S);
% 		grid on;
% 		xlabel('Radial Velocity (m/s)');
% 		ylabel('S(f) (arbitrary power units)');
% 		title_str = sprintf('Periodogram - Using %i data points', npts);
% 		title(title_str);
% 	end
% %
% %===========
% %= GS Part 3
% %===========
% % az: 120
%  % ranges: 72,52, 50(alias), 45
%  	%ranges_to_plot = [45, 50, 52, 72]
%
%  	% first, storm data
%  	% desired azimuth
%  	%iaz = 180;
%
%  for ii=1:960
%  for iaz=1:720
%
%  	% desired range
%  	% ir = 65;
%  	%ir = ranges_to_plot(ii);
%
%  	% number of data points (zero padding)
%  	npts = 64;
%
%  	if ~exist('X_h','var') & ~exist('X_v','var')
%  		fprintf('No data to process.\n');
%  	end
%  	X=X_h;
%
%  	% % extract time series data
%  	%
%  	time_series = squeeze(X(iaz,ii,:));
%  	time = [1:length(time_series)]*pri;
%  	va = lambda1/4/pri;
%
%  	% neg for vf fd neg relationship
%  	vel=-[-npts/2:(npts/2)-1]*2*va/npts;
%
%  	% % data window %
%  	d=boxcar(num_pulses);
%  	% calculate psd %
%  	S=periodogramse(time_series,d,npts);
%  	S=(pri*abs(fftshift(S)));
%     for t=1:64
%         if S(t) == max(S(:))
%             vp(iaz,ii)=vel(t);
%         end
%     end
%
%  end
%  end
%  el_rad = el/180*pi;
% [r,az_rad] = meshgrid(([0:num_gates-1]*delr+r_min)/1e3,az_set/180*pi);
% x = r*cos(el_rad).*sin(az_rad);
% y = r*cos(el_rad).*cos(az_rad);
% z = r*sin(el_rad);
%
% %%%%%%%%%%%% Plot the Data %%%%%%%%%%%%%%%%%%%%%%
% figure;
% set(gcf,'render','painters');
% if length(az_set)<360
% 	pcolor([x],[y],[vp]);
% else
%     %pcolor([x],[y],[vp]);
% 	pcolor([x;x(1,:)],[y;y(1,:)],[vp;vp(1,:)]);
% end;
% shading flat
% axis equal
% axis([-120 120 -120 120])
% colormap(jet);
% xlabel('\bf \fontsize{11} Zonal Distance (km)')
% ylabel('\bf \fontsize{11} Meridional Distance (km)')
% title(['\bf \fontsize{12}' datestr(scan_time) ' El=' num2str(el) ' degrees']);
% colorbar;
%
% %%%%%%%%%%%%  Produce map layover %%%%%%%%%%%%%%%%%%
% bmapover(gca,[],radar,{'OK'});
% ==========
% = GS Part 4 =
% ==========
%
 %storm samples
%%%
 % az: 120
 % ranges: 72,52, 50(alias), 45
 	ranges_to_plot = [45, 50, 52, 72]

 	% first, storm data
 	% desired azimuth
 	iaz = 120;

 for ii=1:4

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
 	va = lambda1/4/pri;

 	% neg for vf fd neg relationship
 	vel=-[-npts/2:(npts/2)-1]*2*va/npts;

 	% % data window %
 	d=boxcar(num_pulses);
 	% calculate psd %
 	S=periodogramse(time_series,d,npts);
 	S=(pri*abs(fftshift(S)));

 	% plot time data I/Q also
 	subplot(4,2,ii*2-1);
 	plot(time, real(time_series), time, imag(time_series));
 	xlabel('time (s)');
 	ylabel('Voltage (V)');
 	title_str = sprintf('I / Q data @ gate %i', ranges_to_plot(ii));
 	title(title_str);
 	legend('I', 'Q');

 	% % plot %
 	subplot(4,2,2*ii);
 	plot(vel,S);
 	grid on;
 	xlabel('Radial Velocity (m/s)');
 	ylabel('S(f) (arbitrary power units)');
 	title('Periodogram');
 end
