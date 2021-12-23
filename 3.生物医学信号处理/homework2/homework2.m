clear,close,clc;
%编码区
seq='cgggcaaaaagcgatggcggtgctgcgtctgcaagatggcagttatccgccgtttggcgcggaagtgaaaaacgacagcgcgcagaacgtcggtctggttgacgatgacggcaacgtctacctcgcgggcgtaaaacctggcgagcatatgatcgtttcatggggcggtgtggcccactgcgatattcatctgcctgacccgctgccagccgatctgttcaatggcctgttattaccatgccagcaaacaggggcgatatctccttcgatgcctcatgaaattaagccggtgatccaggagcagacccagcaggtgatgccaacggaagcgccagtatcggtatcagccaattaataacgtgattaaggaatgatccatgacgaatctattttgctctgccagaacggccgcaacgacgctggcgttactgataactgccgccagcctgtcagtacaggcctctgtcacgccggaccgtacacgcctgatttttaacgaaagtgataaatcaatcagcgtcacgctgcgcaataacgacccgaaaatgccgtatctggcacaaagctggatggaagatggacagggtaacaggattagctcgccactgacggtcctgccgccagtgcagcgcatcgattccatgatgaacggtcaggtgaaggtacagggcatgccggatatcaacaagctgcctgccgaccgcgagagcgtgttctatttcaacgtgcgtgagatcccgccgaaatcgaacaaacctaacacgctacagatagcgctgcagacgcgcattaagttgttctggcgaccaaaggcgctggaaaacgtcagcatgaaaaacc';
%非编码对比
seq2='CTTGCCCACTCTGTTTTAAAACTCTCTTGGCCGGGCGCAGTGGCTCATGCCTGTAATCCCAGCACTTTGGGAGGCCAAGGTGGGCAGATCACAAGGTCAGGAGTTCGAGACCAGCCTGGCCAATATGATGAACCCCCCATCTCTACTAAAAAAATACAAAAAAATTAGCCGGGTGTGT';                               

len1=length(seq);           %DNA序列长度
len2=length(seq2);
%% 编码区序列映射为数字信号
xa=zeros(1,len1);                   %初始化
xt=zeros(1,len1);
xc=zeros(1,len1);
xg=zeros(1,len1);
for i=1:len1                     %转化为ATCG的信号序列
    if seq(i)=='a'
        xa(i)=1;
    elseif seq(i)=='t'
        xt(i)=1;
    elseif seq(i)=='c'
        xc(i)=1;
    elseif seq(i)=='g'
        xg(i)=1;
    end
end
%% 非编码区序列映射为数字信号
xa1=zeros(1,len2);              %初始化
xt1=zeros(1,len2);
xc1=zeros(1,len2);
xg1=zeros(1,len2);
for i=1:len2                   %转化为ATCG的信号序列
    if seq2(i)=='A'
        xa1(i)=1;
    elseif seq2(i)=='T'
        xt1(i)=1;
    elseif seq2(i)=='C'
        xc1(i)=1;
    elseif seq2(i)=='G'
        xg1(i)=1;
    end
end
%% 计算序列功率谱
g=periodogram(xa)+periodogram(xt)+periodogram(xc)+periodogram(xg);          %得到整个序列功率谱
g1=periodogram(xa1)+periodogram(xt1)+periodogram(xc1)+periodogram(xg1);
g(1:5)=[];                     %去直流
g1(1:5)=[];
leng=length(g);           %得到整个序列长度
leng1=length(g1);
f=(0:leng-1)/leng/2;          %给出功率谱对应的频率
f1=(0:leng1-1)/leng1/2;
%% 打印编码区功率谱图像以及信噪比
subplot(2,1,1);
plot(f,g);                     %绘制功率谱曲线
title('编码区功率谱');
ave=sum(g)/leng;              %计算平均功率谱密度
sn=max(g)/ave;                 %计算信噪比
disp('编码区信噪比为：');
disp(sn);
%% 打印非编码区功率谱以及信噪比
subplot(2,1,2);
plot(f1,g1);
title('非编码区功率谱');
ave1=sum(g1)/leng1;                  %计算平均功率谱密度
sn1=g1(int8(2.*leng1/3))/ave1;         %计算信噪比
disp('非编码区信噪比为：');
disp(sn1);
    
