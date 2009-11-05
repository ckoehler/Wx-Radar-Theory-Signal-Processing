% load iq_KOUN_20030510_0331_e0.44_prt2.mat;
% load iq_KOUN_20030510_0331_e1.45_prt2.mat

% ==========
% = Part 2 =
% ==========

	% measured distance to hook echo ~38km.
	a_e = 8498700;
	range = 38000;
	el1 = 0.44;
	el2 = 1.4502;
	
	h1 = range^2 / (2 * a_e) + range * sin(el1/180*pi);
	h2 = range^2 / (2 * a_e) + range * sin(el2/180*pi);
	
	% result: 669.89 m
	hdiff = h2 - h1;


% ==========
% = Part 3 =
% ==========

	el_rad = el/180*pi; 
	[r,az_rad] = meshgrid(([0:num_gates-1]*delr+r_min)/1e3,az_set/180*pi); 
	x = r*cos(el_rad).*sin(az_rad); 
	y = r*cos(el_rad).*cos(az_rad); 
	z = r*sin(el_rad);
	
	R0=mean(X(:,:,1:num_pulses).*conj(X(:,:,1:num_pulses)),3);
	
	C = -20;
	Z = 10*log10(R0) + 20*log10(r) - C;
	figure;
	pcolor([x],[y],[abs(Z)]);
	shading flat;
	axis equal;
	axis([-120 120 -120 120]);
	colormap(jet);
	colorbar;
	title('Reflectivity factor @ 0.44 el');
	caxis([0 60]);


% ==========
% = Part 4 =
% ==========

	% Z-R relationships:
	% Z = 155R^1.88
	% Z = 300R^1.4
	% Z = 200R^1.6
	% Z = 400R^1.4
	% Z = 300R^1.5

	Z = 10.^(Z/10)
	RR1 = nthroot(Z/155, 1.88);
	figure;
	pcolor([x],[y],[abs(RR1)]);
	shading flat;
	axis equal;
	axis([-120 120 -120 120]);
	colormap(jet);
	title('RR (Z = 155*R^1.88) @ 0.44 degrees el');
	colorbar;
	caxis([0 60]);
	
	RR2 = nthroot(Z/200, 1.6);
	figure;
	pcolor([x],[y],[abs(RR2)]);
	shading flat;
	axis equal;
	axis([-120 120 -120 120]);
	colormap(jet);
	title('RR (Z = 200*R^1.6) @ 0.44 degrees el');
	colorbar;
	caxis([0 60]);
	
	% repeat for the higher elevation angle
	clear;
	load iq_KOUN_20030510_0331_e1.45_prt2.mat;
	
	el_rad = el/180*pi; 
	[r,az_rad] = meshgrid(([0:num_gates-1]*delr+r_min)/1e3,az_set/180*pi); 
	x = r*cos(el_rad).*sin(az_rad); 
	y = r*cos(el_rad).*cos(az_rad); 
	z = r*sin(el_rad);
	R0=mean(X(:,:,1:num_pulses).*conj(X(:,:,1:num_pulses)),3);
	pow = 10*log10(R0);
	C = -20;
	Z = 10*log10(R0) + 20*log10(r) - C;
	Z = 10.^(Z/10)
	
	
	RR1 = nthroot(Z/155, 1.88);
	figure;
	pcolor([x],[y],[abs(RR1)]);
	shading flat;
	axis equal;
	axis([-120 120 -120 120]);
	title('RR (Z = 155*R^1.88) @ 1.45 degrees el');
	colormap(jet);
	colorbar;
	
	caxis([0 60]);
	
	RR2 = nthroot(Z/200, 1.6);
	figure;
	pcolor([x],[y],[abs(RR2)]);
	shading flat;
	axis equal;
	axis([-120 120 -120 120]);
	title('RR (Z = 200*R^1.6) @ 1.45 degrees el');
	colormap(jet);
	colorbar;
	caxis([0 60]);

% ==========
% = Part 5 =
% ==========

	load iq_PAR_20090331_022339_e0.51_prt1.mat;
	% ground clutter
	IQ = squeeze(X(109,3,:));
	I1 = real(squeeze(X(109,3,:)));
	Q1 = imag(squeeze(X(109,3,:)));
	subplot(2,3,1);
	plot((1:15)*pri,I1,(1:15)*pri,Q1);
	% axis([0, .05, -5000, 5000]);
	xlabel('Time (sec)');
	ylabel('Voltage');
	title('Ground clutter IQ');
	
	detrend_I1 = detrend(double(I1));
	detrend_Q1 = detrend(double(Q1));
	ACF_I1 = xcorr(detrend_I1, detrend_I1);
	ACF_Q1 = xcorr(detrend_Q1, detrend_Q1);
	subplot(2,3,4);
	plot((1:29)*pri,ACF_I1,(1:29)*pri,ACF_Q1);
	% axis([0, .05, -5000, 5000]);
	xlabel('Time (sec)');
	ylabel('Voltage');
	title('Ground clutter ACF');
	
	
	
	I2 = real(squeeze(X(67,1330,:)));
	Q2 = imag(squeeze(X(67,1330,:)));
	subplot(2,3,2);
	plot((1:15)*pri,I2,(1:15)*pri,Q2);
	% axis([0, .05, -5000, 5000]);
	xlabel('Time (sec)');
	ylabel('Voltage');
	title('clear air IQ');
	
	detrend_I2 = detrend(double(I2));
	detrend_Q2 = detrend(double(Q2));
	ACF_I2 = xcorr(detrend_I2, detrend_I2);
	ACF_Q2 = xcorr(detrend_Q2, detrend_Q2);
	subplot(2,3,5);
	plot((1:29)*pri,ACF_I2,(1:29)*pri,ACF_Q2);
	% axis([0, .05, -5000, 5000]);
	xlabel('Time (sec)');
	ylabel('Voltage');
	title('clear air ACF');
	
	I3 = real(squeeze(X(5,399,:)));
	Q3 = imag(squeeze(X(5,399,:)));
	subplot(2,3,3);
	plot((1:15)*pri,I3,(1:15)*pri,Q3);
	% axis([0, .05, -5000, 5000]);
	xlabel('Time (sec)');
	ylabel('Voltage');
	title('storm IQ');
	
	detrend_I3 = detrend(double(I3));
	detrend_Q3 = detrend(double(Q3));
	ACF_I3 = xcorr(detrend_I3, detrend_I3);
	ACF_Q3 = xcorr(detrend_Q3, detrend_Q3);
	subplot(2,3,6);
	plot((1:29)*pri,ACF_I3,(1:29)*pri,ACF_Q3);
	% axis([0, .05, -5000, 5000]);
	xlabel('Time (sec)');
	ylabel('Voltage');
	title('storm ACF');
	
	
% ==========
% = Part 6 =
% ==========
	xtmp=[squeeze(X(1,100,:))
	      squeeze(X(1,101,:))
	      squeeze(X(1,102,:))
	      squeeze(X(1,103,:))
	      squeeze(X(1,104,:))
	      squeeze(X(1,105,:))
	      squeeze(X(1,105,:))
	      squeeze(X(2,100,:))
	      squeeze(X(2,101,:))
	      squeeze(X(2,102,:))
	      squeeze(X(2,103,:))
	      squeeze(X(2,104,:))
	      squeeze(X(2,105,:))
	      squeeze(X(3,100,:))
	      squeeze(X(3,101,:))
	      squeeze(X(3,102,:))
	      squeeze(X(3,103,:))
	      squeeze(X(3,104,:))
	      squeeze(X(3,105,:))
	      squeeze(X(4,100,:))
	      squeeze(X(4,101,:))
	      squeeze(X(4,102,:))
	      squeeze(X(4,103,:))
	      squeeze(X(4,104,:))
	      squeeze(X(4,105,:))
	];
	
	plot(real(xtmp), imag(xtmp), '.');
	axis([-200 200 -200 200]);
	axis square;
	xlabel('I');
	ylabel('Q');
	title('I vs Q - uncorrelated');
	
% ==========
% = Part 7 =
% ==========
	
	I = real(squeeze(X(5,300:500,:)));
	Q = imag(squeeze(X(5,300:500,:)));
	hist(double(I));
	xlabel('X');
	ylabel('Y');
	title('Histogram of I');
	figure;
	hist(double(Q));
	xlabel('X');
	ylabel('Y');
	title('Histogram of Q');
	
% ==========
% = Part 8 =
% ==========
	
	load iq_PAR_20090331_022339_e0.51_prt1.mat;
	figure;
	IQ = double(squeeze(X(109,1:50,:)));
	mag = abs(IQ);
	subplot(3,1,1);
	plot(mag);
	title('Magnitude of ground clutter (should be Rayleigh)');
	
	IQ = double(squeeze(X(5,300:500,:)));
	mag = abs(IQ);
	subplot(3,1,2);
	plot(mag);
	title('Magnitude of a storm (should be Rayleigh)');
	
	IQ = double(squeeze(X(67,1200:1500,:)));
	mag = abs(IQ);
	subplot(3,1,3);
	plot(mag);
	title('Magnitude of clear air (should be Rayleigh)');
	
	% now angle
	figure;
	IQ = double(squeeze(X(109,1:50,:)));
	ang = angle(IQ);
	subplot(3,1,1);
	plot(ang);
	axis([-pi pi 0 30]);
	title('Angle of ground clutter (should be uniform)');
	
	IQ = double(squeeze(X(5,300:500,:)));
	ang = angle(IQ);
	subplot(3,1,2);
	plot(mag);
	axis([-pi pi 0 30]);
	title('Angle of storm (should be uniform)');
	
	IQ = double(squeeze(X(67,1200:1500,:)));
	ang = angle(IQ);
	subplot(3,1,3);
	plot(ang);
	axis([-pi pi 0 30]);
	title('Angle of clear air (should be uniform)');
	
	% finally, power
	figure;
	IQ = double(squeeze(X(109,1:50,:)));
	pow = abs(IQ.^2);
	subplot(3,1,1);
	plot(pow);
	title('Power of ground clutter (should be exponential)');
	
	IQ = double(squeeze(X(5,300:500,:)));
	pow = abs(IQ.^2);
	subplot(3,1,2);
	plot(pow);
	title('Power of storm (should be exponential)');
	
	IQ = double(squeeze(X(67,1200:1500,:)));
	pow = abs(IQ.^2);
	subplot(3,1,3);
	plot(pow);
	title('Power of clear air (should be exponential)');
	
	
% ==========
% = Grad 1 =
% ==========
	threshold = 35;
	
	load iq_KOUN_20030510_0331_e0.44_prt2.mat;
	X = double(X);

	% get power and convert to reflectivity, as above
 	R0=mean(X(:,:,1:num_pulses).*conj(X(:,:,1:num_pulses)),3);	
	C = -20;
	Z = 10*log10(R0) + 20*log10(r) - C;
	
	% isolate the storm by a threshold
	Y = double((Z >= threshold));
	
	% get rid of all data below the threshold, then clean up
	% areas that don't belong to the storm for easier manipulation
	% later on.
	RES = Z.*Y;
	RES(:,1:100) = 0;
	RES(10:310,:) = 0;
	RES(:, 330:end) = 0;
	RES(1:40,1:200) = 0;
	RES(350:360,1:160) = 0;
	
	% until now we've worked with the reflectivity factor.
	% convert to linear scale rainfall rate:
	RES = 10.^(RES/10);
	RES = nthroot(RES/200, 1.6);
	
	% model gates as trapezoids for area. Convert range to meters
	b1 = (tan(0.5)*(r.*1000))*2;
	b2 = (tan(0.5)*((r.*1000)+delr))*2;
	Areas = delr*(b1 + b2)/2;
	
	% now convert rainfall rate into m^3
	RES = RES.*10^(-9);
	
	% then multiply area of each gate by rainfall rate
	% to get total rainfall in m^3/h
	% divide by 6 to get rainfall for 10 minutes
	total_rainfall = (RES.*Areas);
	sumup = sum(sum(total_rainfall))/6;
	% result: 323.9957 m^3
	