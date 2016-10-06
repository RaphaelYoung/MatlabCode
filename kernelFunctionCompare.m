% close all;
clc;

figure;

dij=[1:1:2000]; 

%ָ���ͺ���
h1=20;
f1=exp(-dij/(h1^2)); 
plot(dij,f1);
hold on;
% text(35,0.9162,'\leftarrowָ���ͺ���');

%��˹�ͺ���
h2=500;
f2=exp(-dij.^2/(h2^2));
plot(dij,f2);
hold on;
% text(29,0.1222,'\leftarrow��˹�ͺ���');

%�����ͺ���
h3=2000;
f3=cos(pi*dij/(2*h3));
f3(h3:end)=0;
plot(dij,f3);
hold on;
% text(29,0.1222,'\leftarrow�����ͺ���');


% ���Ҹ�˹�ͺ���
h41=800;
h42=2000;
f4=exp(-(dij.^2)/(h41^2)).*cos(pi*dij/(2*h42));
f4(h42:end)=0;
plot(dij,f4);
hold off;


legend('ָ���ͺ���','��˹�ͺ���','�����ͺ���','���Ҹ�˹�ͺ���');
xlabel('ŷʽ����');
ylabel('��Ȩֵ');

