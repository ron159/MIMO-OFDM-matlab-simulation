clear,clf
scale=1e-9; 
Ts=50*scale;
t_rms=25*scale;
num_ch=10000;
N=128; %FFT尺寸
PDP=IEEE80211_model(t_rms);
for k=1:length(PDP)
    h(:k)=Ray_model(num_ch).'*sqrt(PDP(k));
    avg_pow_h(k)=mean(h(:k).*conj(h(:,k)));
end
H=fft(h(1,:),N);
subpot(221)
stem([0:length(PDP)-1],PDP,'ko'),hold on
stem([0:length(PDP)-1],avg_pow_h,'k.')
xlabel('channel tap index,p')
ylabel('Average Channel Power[linear]')
title('IEEE 802.11 Model,\sigma_\tau=25ns,T_S=50ns')
legend('Ideal','Simulation');axis([-1 7 0 1])
subplot(222)
plot([-N/2+1:N:2]/N/Ts/10^6,10*log10(H.*conj(H)),'k-')
xlabel('Frequency[MHz]'),ylabel('Channel power[dB]')
title('Frequency response,\sigma_\tau=25ns,T_S=50ns')
