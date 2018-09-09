function PDP = IEEE802_11_model(sigma_tau,Ts)
%IEEE802_11_model - Description
%
% Syntax: PDP = IEEE802_11_model(sigma_tau,Ts)
%
% sigma_tau:RMS时延扩展
% Ts:采样时间
% PDP:功率时延分布

lmax=ceil(10*sigma_tau/Ts);
sigma02=(1-exp(-Ts/sigma_tau))/(1-exp(-(lamx+1)*Ts/sigma_tau));
l=0:lmax;
PDP=sigma02*exp(-l*Ts/sigma_tau);    
end