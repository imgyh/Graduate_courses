clc;clear all;
f1=0.1;f2=0.13;
n=1:1/0.27:70;%��������19
% n2=1:1/0.27:70
u=normrnd(0,10^-3);%�������
x=sqrt(2)*(cos(2*pi*f1*n)+cos(2*pi*f1*n))+u;
figure(1)
Y=10*log10(periodogram(x));%dB��ʽ
len=length(Y);
f=(0:len-1)/len; 
plot(f/2,flipud(Y))
xlabel('Ƶ��');
ylabel('���߹�����/dB');
title('19������ͼ��');
figure(2)
[xpsd,f]=pburg(x,8,1024);
xpsd=flipud(10*log10(xpsd));
% xpsd(1:5)=[];f(504:508)=[];
plot(f/pi/2,xpsd);
xlabel('Ƶ��');
ylabel('���߹�����/dB');
title('19��AR�׹������ߣ�p=8��');
n2 = 1:1/0.27:140;
x2=sqrt(2)*(cos(2*pi*f1*n2)+cos(2*pi*f1*n2))+u;
figure(3)
Y2=10*log10(periodogram(x2));%dB��ʽ
len=length(Y2);
f=(0:len-1)/len; 
plot(f/2,flipud(Y2))
xlabel('Ƶ��');
ylabel('���߹�����/dB');
title('38������ͼ��');
figure(4)%ARģ��
[xpsd2,f]=pburg(x2,8,1024);
xpsd2=flipud(10*log10(xpsd2));
plot(f/pi/2,xpsd2);
xlabel('Ƶ��');
ylabel('���߹�����/dB');
title('38��AR�׹������ߣ�p=8��');
