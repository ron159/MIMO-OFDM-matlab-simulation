function H = Ray_model(L)
%Ray_model - Description
%   瑞利衰落信道模型
% Syntax: H = Ray_model(L)
%   L信道实现数 
%   H信道向量
% Long description
H=(randn(1,L)+j*randn(1,L)/sqrt(2));
end