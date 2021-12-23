function [y, ny] = convOperation(x, nx, h, nh)
% 不用matlab自带的conv的卷积操作
% x: 信号序列
% nx: 信号序列下标
% h: 响应序列
% nh: 响应序列下标
% y: 输出序列
% ny: 输出序列下标

% 求出输出序列y的下标ny
nyBegin = nx(1) + nh(1);
nyEnd = nx(length(x)) + nh(length(h));
ny = [nyBegin : nyEnd];

[h, nh] = sigfold(h, nh);

y = zeros(1, length(ny));
k=1;
for i = nyBegin : nyEnd
    [hTemp, nTemp] = sigshift(h, nh, i);
    [temp,nTemp] = sigmult(x, nx, hTemp, nTemp);
    y(k) = sum(temp);
    k = k + 1;
end

function [y,n]=sigfold(x,n)
% 信号的反转
y=fliplr(x);
n=-fliplr(n);

function [y,n] = sigshift(x,m,n0)
% 实现信号的移位
n = m+n0;
y=x;

function [y,n] = sigmult(x1,n1,x2,n2)
% 实现了信号相乘
n = min( min(n1), min(n2) ) : max( max(n1), max(n2) );
y1 = zeros( 1, length(n) ); y2=y1;
y1( find( ( n >= min( n1 ) ) & ( n <= max( n1 ) ) == 1 ) ) = x1;
y2( find( ( n >= min( n2 ) ) & ( n <= max( n2 ) ) == 1 ) ) = x2;
y = y1 .* y2;