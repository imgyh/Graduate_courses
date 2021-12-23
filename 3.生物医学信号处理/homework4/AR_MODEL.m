clc;clear all;
f1=0.1;f2=0.13;
n=1:1/0.27:70;%采样点数19
% n2=1:1/0.27:70
u=normrnd(0,10^-3);%随机噪声
x=sqrt(2)*(cos(2*pi*f1*n)+cos(2*pi*f1*n))+u;
figure(1)
Y=10*log10(periodogram(x));%dB形式
len=length(Y);
f=(0:len-1)/len; 
plot(f/2,flipud(Y))
xlabel('频率');
ylabel('单边功率谱/dB');
title('19点周期图法');
figure(2)
[xpsd,f]=pburg(x,8,1024);
xpsd=flipud(10*log10(xpsd));
% xpsd(1:5)=[];f(504:508)=[];
plot(f/pi/2,xpsd);
xlabel('频率');
ylabel('单边功率谱/dB');
title('19点AR谱估计曲线（p=8）');
n2 = 1:1/0.27:140;
x2=sqrt(2)*(cos(2*pi*f1*n2)+cos(2*pi*f1*n2))+u;
figure(3)
Y2=10*log10(periodogram(x2));%dB形式
len=length(Y2);
f=(0:len-1)/len; 
plot(f/2,flipud(Y2))
xlabel('频率');
ylabel('单边功率谱/dB');
title('38点周期图法');
figure(4)%AR模型
[xpsd2,f]=pburg(x2,8,1024);
xpsd2=flipud(10*log10(xpsd2));
plot(f/pi/2,xpsd2);
xlabel('频率');
ylabel('单边功率谱/dB');
title('38点AR谱估计曲线（p=8）');
