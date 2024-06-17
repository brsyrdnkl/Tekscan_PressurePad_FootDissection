function [] = firststep(data,plotting)

fs=50;   %sampling frequency!!!!!!!!!

T=length(data)/fs;

if contains(plotting, 'help')           %YOU CAN TAKE HELP FOR INPUTS
    
    fprintf("Please be sure about the data collection frequency, so check the 3rd line of the function.\n")
    fprintf("First input must be the signal to be analyzed.\n")
    fprintf("Possible string inputs are 'PP', 'Rxx', 'NRxx', 'FFT', 'PSD', and 'RT' for the second place. \n")
    return
end

copx=detrend(data,1);

    copxmax=max(copx);
    copxmin=min(copx);

L=length(copx);

    copx_mxx=max(copxmax);
    copx_mnn=min(copxmin);

time=0:1/fs:T-1/fs;

input1=copx;
vinput1=diff(input1)/(1/fs);
%-----------------------1st figure
if contains(plotting, 'PP')
%figure
plot(input1(1,1:L-1),vinput1,'.')
xlabel('copx [cm]');
ylabel('vcopx [cm/sec]');
end
%------------------------  

%-------
%correlation function
%-------
toda[c1,lags] = xcorr(input1);

%-----------------------2nd figure
if contains(plotting, 'Rxx')
%figure
plot(lags,c1)
xlabel('lags [sec]');
ylabel('Rxx(tau)');
end
%-----------------------

[c1n,lags] = xcorr(input1,'coeff');

%-----------------------3rd figure
if contains(plotting, 'NRxx')
%figure
plot(lags,c1n)
xlabel('lags [sec]');
ylabel('Rxx(tau)');
end
%-----------------------


length_t=length(time);
freq=0:1/T:fs;
freqp=0:1/(2*T):fs;

%-------
%Power Spectral Density
%-------
var1=var(input1);
c1a = (1/(length(input1)))*c1;
psd1=(1/(length(lags)))*abs(fft(c1a));
area1=trapz(psd1);

check_result=[var1 area1];

fi=3;%frequency of interest
fpc=fi/(1/(2*T));%for 3Hz
fc=fi/(1/T);

%-----------------------4th figure
if contains(plotting, 'PSD')
%figure
plot(freqp(1:fpc),psd1(1:fpc))
xlabel('freq [Hz]');
ylabel('Gxx [cm^2/Hz]');
end
%-----------------------

mag1=(1/(length(input1)))*abs(fft(input1));

%-----------------------5th figure
if contains(plotting, 'FFT')
%figure
plot(freq(1:fc),mag1(1:fc))
xlabel('freq [Hz]');
ylabel('Gx [cm/Hz]');
end
%-----------------------
if contains(plotting, 'RT')
[h1,p1,stats1] = runstest(input1)
check_result
end

end