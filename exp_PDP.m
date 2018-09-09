function PDP = exp_PDP(tau_d,Ts,A_dB,norm_flag)
%exp_PDP - 指数PDP生成
%
% Syntax: PDP = exp_PDP(tau_d,Ts,A_dB,norm_flag)
%
% tau_d:RMS时延扩展[s]
% Ts:采样时间[s]
% A_dB:最小不可忽略的功率[dB]
% norm_flag:归一化总功率为1
% PDP：PDP向量
if nargin<4,norm_flag=1;end %归一化
if nargin<3,A_dB=-20; end %20dB以下
sigma_tau=tau_d;
A=10^(A_dB/10);
lmax=ceil(-tau_d*log(A)/Ts);
%计算功率归一化的归一化因子
if norm_flag
    p0=(1-exp(-Ts/sigma_tau))/(1-exp-(-(lmax+1)*Ts/sigma_tau));
else
    p0=1/sigma_tau;
end
%指数PDP
l=0:lmax;
PDP=p0*exp(-l*Ts/sigma_tau);
end