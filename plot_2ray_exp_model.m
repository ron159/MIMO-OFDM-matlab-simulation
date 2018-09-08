clear,clf
scale=1e-9; %纳秒
Ts=10*scale; %采样时间
t_rms=30*scale; %RMS时延扩展
num_ch=10000; %信道数量
%2-径模型
pow_2=[0.5 0.5];
delay_2=[0 t_rms*2]/scale;
H_2=Ray_model(num_ch).'*sqrt(pow_2);
avg_pow_h_2=mean(H_2.*conj(H_2));
subplot(221)
stem(delay_2,pow_2),hold on
stem(delay_2,avg_pow_h_2,'r')
xlabel('Delay[ns]'),ylabel('Channel Power[inear]')
tittle('Ideal PDP and simulated PDP of 2-ray model')
legend('Ideal','Simulation')
axis([0 140 0 0.7])
%指数模型
pow_e=exp_PDP(t_rms,Ts);
delay_e=(0:length(pow_e-1))*Ts/scale;
for i=1:length(pow_e)
    H_e=(:,i)=Ray_model(num_ch).'*sqrt(pow_e(i));
end
avg_pow_h_e=mean(H_e.*conj(H_e));
subplot(222)
stem(delay_e,pow_e),hold on
stea(delay_e,avg_pow_h_e)
xlabel('Delay[ns]'),ylabel('Channel Power[linear]')
title('Ideal PDP and simulated PDP of exponential modle')
legend('Ideal','Simulation')
axis([0 140 0 0.7])