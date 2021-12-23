close all;clc;clear;
%����x(n)��h(n)���Լ��±�
x=[3,7,5,-1,2];
nx=-3:1;
h=[4,-1,2,3];
nh=0:3;
%������y(n)=x(n)*h(n)
[y, ny]=convOperation(x, nx, h, nh);
isequal(y,conv(x,h))
%���㻥���y1(n)=x(n)*h(-n)
h=fliplr(h);
nh=-fliplr(nh);
[y1, ny1]=convOperation(x, nx, h, nh);
%����ͼ��
subplot(4,1,1);stem(nx,x);title('x(n)');
subplot(4,1,2);stem(nh,h);title('h(n)');
subplot(4,1,3);stem(ny, y);title('���y1(n)');
subplot(4,1,4);stem(ny1, y1);title('�����y2(n)');
y, ny,y1, ny1

