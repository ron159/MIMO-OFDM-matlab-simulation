function H = Ric_model(K_dB,L)
%莱斯信道模型
%K_dB:K因子
%L：信道实现数
%H：信道向量    
K=10^(K_dB/10);
H=sqrt(K/(K+1)+sqrt(1/(K+1))*Ray_model(L));
end