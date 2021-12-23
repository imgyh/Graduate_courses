clear,close,clc;
%������
seq='cgggcaaaaagcgatggcggtgctgcgtctgcaagatggcagttatccgccgtttggcgcggaagtgaaaaacgacagcgcgcagaacgtcggtctggttgacgatgacggcaacgtctacctcgcgggcgtaaaacctggcgagcatatgatcgtttcatggggcggtgtggcccactgcgatattcatctgcctgacccgctgccagccgatctgttcaatggcctgttattaccatgccagcaaacaggggcgatatctccttcgatgcctcatgaaattaagccggtgatccaggagcagacccagcaggtgatgccaacggaagcgccagtatcggtatcagccaattaataacgtgattaaggaatgatccatgacgaatctattttgctctgccagaacggccgcaacgacgctggcgttactgataactgccgccagcctgtcagtacaggcctctgtcacgccggaccgtacacgcctgatttttaacgaaagtgataaatcaatcagcgtcacgctgcgcaataacgacccgaaaatgccgtatctggcacaaagctggatggaagatggacagggtaacaggattagctcgccactgacggtcctgccgccagtgcagcgcatcgattccatgatgaacggtcaggtgaaggtacagggcatgccggatatcaacaagctgcctgccgaccgcgagagcgtgttctatttcaacgtgcgtgagatcccgccgaaatcgaacaaacctaacacgctacagatagcgctgcagacgcgcattaagttgttctggcgaccaaaggcgctggaaaacgtcagcatgaaaaacc';
%�Ǳ���Ա�
seq2='CTTGCCCACTCTGTTTTAAAACTCTCTTGGCCGGGCGCAGTGGCTCATGCCTGTAATCCCAGCACTTTGGGAGGCCAAGGTGGGCAGATCACAAGGTCAGGAGTTCGAGACCAGCCTGGCCAATATGATGAACCCCCCATCTCTACTAAAAAAATACAAAAAAATTAGCCGGGTGTGT';                               

len1=length(seq);           %DNA���г���
len2=length(seq2);
%% ����������ӳ��Ϊ�����ź�
xa=zeros(1,len1);                   %��ʼ��
xt=zeros(1,len1);
xc=zeros(1,len1);
xg=zeros(1,len1);
for i=1:len1                     %ת��ΪATCG���ź�����
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
%% �Ǳ���������ӳ��Ϊ�����ź�
xa1=zeros(1,len2);              %��ʼ��
xt1=zeros(1,len2);
xc1=zeros(1,len2);
xg1=zeros(1,len2);
for i=1:len2                   %ת��ΪATCG���ź�����
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
%% �������й�����
g=periodogram(xa)+periodogram(xt)+periodogram(xc)+periodogram(xg);          %�õ��������й�����
g1=periodogram(xa1)+periodogram(xt1)+periodogram(xc1)+periodogram(xg1);
g(1:5)=[];                     %ȥֱ��
g1(1:5)=[];
leng=length(g);           %�õ��������г���
leng1=length(g1);
f=(0:leng-1)/leng/2;          %���������׶�Ӧ��Ƶ��
f1=(0:leng1-1)/leng1/2;
%% ��ӡ������������ͼ���Լ������
subplot(2,1,1);
plot(f,g);                     %���ƹ���������
title('������������');
ave=sum(g)/leng;              %����ƽ���������ܶ�
sn=max(g)/ave;                 %���������
disp('�����������Ϊ��');
disp(sn);
%% ��ӡ�Ǳ������������Լ������
subplot(2,1,2);
plot(f1,g1);
title('�Ǳ�����������');
ave1=sum(g1)/leng1;                  %����ƽ���������ܶ�
sn1=g1(int8(2.*leng1/3))/ave1;         %���������
disp('�Ǳ����������Ϊ��');
disp(sn1);
    
