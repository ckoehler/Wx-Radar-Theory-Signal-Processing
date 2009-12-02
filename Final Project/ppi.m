% clear;
% load iq_OUPRIME_20090613_0328_e1.29_prt2.mat;

% =============
% = PPI plots =
% =============
for ii=1:num_gates
	for iaz=1:num_az

		% desired range
		% ir = 65;
		%ir = ranges_to_plot(ii);

		% number of data points (zero padding)
		npts = 64;

		if ~exist('X_h','var') & ~exist('X_v','var')
			fprintf('No data to process.\n');
		end
		X=X_h;

		% % extract time series data
		%
		time_series = squeeze(X(iaz,ii,:));
		time = [1:length(time_series)]*pri;
		va = lambda1/4/pri;

		% ===============
		% = Periodogram =
		% ===============
		% neg for vf fd neg relationship
		vel=-[-npts/2:(npts/2)-1]*2*va/npts;

		% % data window %
		d=boxcar(num_pulses);
		% calculate psd %
		S=periodogramse(time_series,d,npts);
		S=(pri*abs(fftshift(S)));
	   for t=1:npts
	       if S(t) == max(S(:))
	           Sppi(iaz,ii)=vel(t);
	       end
	   end
	
		% ======
		% = YW =
		% ======
		n=4;
		[a sig2]=yulewalker(time_series,n);

		[h,F] = freqz([1],a,npts, 'whole');
		yw = pri*fftshift(sig2*abs(h).^2);
		for t=1:npts
			if yw(t) == max(yw(:))
				ywppi(iaz,ii) = vel(t);
			end
		end
		
		% =========
		% = Capon =
		% =========
		n = 16;
		cap = capon(time_series,n,npts);
		cap = fftshift(cap/1000);
		
		for t=1:npts
			if cap(t) == max(cap(:))
				capppi(iaz,ii) = vel(t);
			end
		end
		
		% ========
		% = LSAR =
		% ========
		n=4;
		[a sig2]=lsar(time_series,n);

		[h,F] = freqz([1],a,npts, 'whole');
		lsarest = pri*fftshift(sig2*abs(h).^2);
		for t=1:npts
			if lsarest(t) == max(lsarest(:))
				lsarestppi(iaz,ii) = vel(t);
			end
		end
		
		% ==========
		% = LSARMA =
		% ==========
		n=4;
		[a b sig2]=lsarma(time_series,n,n,n);

		[h,F] = freqz(b,a,npts, 'whole');
		lsarmaest = pri*fftshift(sig2*abs(h).^2);
		for t=1:npts
			if lsarmaest(t) == max(lsarmaest(:))
				lsarmaestppi(iaz,ii) = vel(t);
			end
		end
	end
end

el_rad = el/180*pi;
[r,az_rad] = meshgrid(([0:num_gates-1]*delr+r_min)/1e3,az_set/180*pi);
x = r*cos(el_rad).*sin(az_rad);
y = r*cos(el_rad).*cos(az_rad);
z = r*sin(el_rad);

%%%%%%%%%%% Plot the Data %%%%%%%%%%%%%%%%%%%%%%
figure;
set(gcf,'render','painters');
pcolor([x;x(1,:)],[y;y(1,:)],[vp;vp(1,:)]);
shading flat
axis equal
axis([-120 120 -120 120])
colormap(redgreen);
xlabel('\bf \fontsize{11} Zonal Distance (km)')
ylabel('\bf \fontsize{11} Meridional Distance (km)')
title(['\bf \fontsize{12}' datestr(scan_time) ' El=' num2str(el) ' degrees - Periodogram']);
colorbar;


figure;
set(gcf,'render','painters');
pcolor([x;x(1,:)],[y;y(1,:)],[ywppi;ywppi(1,:)]);
shading flat
axis equal
axis([-120 120 -120 120])
colormap(redgreen);
xlabel('\bf \fontsize{11} Zonal Distance (km)')
ylabel('\bf \fontsize{11} Meridional Distance (km)')
title(['\bf \fontsize{12}' datestr(scan_time) ' El=' num2str(el) ' degrees - YW']);
colorbar;


figure;
set(gcf,'render','painters');
pcolor([x;x(1,:)],[y;y(1,:)],[capppi;capppi(1,:)]);
shading flat
axis equal
axis([-120 120 -120 120])
colormap(redgreen);
xlabel('\bf \fontsize{11} Zonal Distance (km)')
ylabel('\bf \fontsize{11} Meridional Distance (km)')
title(['\bf \fontsize{12}' datestr(scan_time) ' El=' num2str(el) ' degrees - Capon']);
colorbar;


figure;
set(gcf,'render','painters');
pcolor([x;x(1,:)],[y;y(1,:)],[lsarestppi;lsarestppi(1,:)]);
shading flat
axis equal
axis([-120 120 -120 120])
colormap(redgreen);
xlabel('\bf \fontsize{11} Zonal Distance (km)')
ylabel('\bf \fontsize{11} Meridional Distance (km)')
title(['\bf \fontsize{12}' datestr(scan_time) ' El=' num2str(el) ' degrees - LSAR']);
colorbar;

figure;
set(gcf,'render','painters');
pcolor([x;x(1,:)],[y;y(1,:)],[lsarmaestppi;lsarmaestppi(1,:)]);
shading flat
axis equal
axis([-120 120 -120 120])
colormap(redgreen);
xlabel('\bf \fontsize{11} Zonal Distance (km)')
ylabel('\bf \fontsize{11} Meridional Distance (km)')
title(['\bf \fontsize{12}' datestr(scan_time) ' El=' num2str(el) ' degrees - LSARMA']);
colorbar;