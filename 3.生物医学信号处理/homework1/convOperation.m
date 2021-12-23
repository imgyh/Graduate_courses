function [y, ny] = convOperation(x, nx, h, nh)
% ����matlab�Դ���conv�ľ������
% x: �ź�����
% nx: �ź������±�
% h: ��Ӧ����
% nh: ��Ӧ�����±�
% y: �������
% ny: ��������±�

% ����������y���±�ny
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
% �źŵķ�ת
y=fliplr(x);
n=-fliplr(n);

function [y,n] = sigshift(x,m,n0)
% ʵ���źŵ���λ
n = m+n0;
y=x;

function [y,n] = sigmult(x1,n1,x2,n2)
% ʵ�����ź����
n = min( min(n1), min(n2) ) : max( max(n1), max(n2) );
y1 = zeros( 1, length(n) ); y2=y1;
y1( find( ( n >= min( n1 ) ) & ( n <= max( n1 ) ) == 1 ) ) = x1;
y2( find( ( n >= min( n2 ) ) & ( n <= max( n2 ) ) == 1 ) ) = x2;
y = y1 .* y2;