close all;clc;clear;
%定义x(n)与h(n)，以及下标
x=[3,7,5,-1,2];
nx=-3:1;
h=[4,-1,2,3];
nh=0:3;
%计算卷积y(n)=x(n)*h(n)
[y, ny]=convOperation(x, nx, h, nh);
isequal(y,conv(x,h))
%计算互相关y1(n)=x(n)*h(-n)
h=fliplr(h);
nh=-fliplr(nh);
[y1, ny1]=convOperation(x, nx, h, nh);
%绘制图像
subplot(4,1,1);stem(nx,x);title('x(n)');
subplot(4,1,2);stem(nh,h);title('h(n)');
subplot(4,1,3);stem(ny, y);title('卷积y1(n)');
subplot(4,1,4);stem(ny1, y1);title('互相关y2(n)');
y, ny,y1, ny1

