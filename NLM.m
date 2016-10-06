% ԭʼ�Ǿֲ���ֵ(Original Non-local Means, ONLM)�㷨������˼��������ͼ���д���������Ϣ����ͼ���������������������صĻҶ�ֵ
% ����Ȩ��ϵ�������Ȩƽ���õ�����Ⱦ���صĻҶȹ���ֵ������Ȩ��ϵ���ɼ�Ȩ�˺�������������֮��ļ�Ȩŷʽ�������������NLM �㷨
% �������ǳ���Ϊ����㷨��Ч�ʣ������޶�����������Χ�� NLM �㷨,���������С 7��7������������Χ 21��21�����ҵ����˺�������
% ������ʹȥ�����ܴﵽ���

clear; 
% close all;
clc;
searchBox_r=10;%������뾶
similarBox_r=3;%���ƿ�뾶
h=20;%ָ��������˥������

rawImage=imread('barbara512.bmp');
%  rawImage=imresize(rawImage,0.2);
[rawImage_m, rawImage_n]=size(rawImage);
denoisedImage=zeros(rawImage_m,rawImage_n);

% figure
% imshow(rawImage,[]);%��ʾԭʼͼ��
% title('raw image')

% noise=wgn(rawImage_m,rawImage_n,25);
% noiseImage=double(rawImage)+double(noise);
noiseImage=imnoise(rawImage,'gaussian', 0, 10^2/255^2);
H1=figure;
imshow(noiseImage,[]);%��ʾ����������ͼ��
title('noise image');

padNoiseImage = padarray(noiseImage,[searchBox_r searchBox_r],'symmetric'); %����Ե�Գ��۵���ȥ
padNoiseImage = double(padNoiseImage);

%�����˹��
alpha=1;%��˹��Ȩŷ�Ͼ���ı�׼��
gaussMat = repmat(-similarBox_r:similarBox_r,2*similarBox_r+1,1);
gaussWeight = exp(-((gaussMat).^2+(gaussMat').^2)/(2*alpha*alpha));

%���ص���������ص��������������ģ�
for pixel_i=searchBox_r+1:rawImage_m+searchBox_r
    for pixel_j=searchBox_r+1:rawImage_n+searchBox_r
       average=0;
       sweight=0;
       NI= padNoiseImage(pixel_i-similarBox_r:pixel_i+similarBox_r,pixel_j-similarBox_r:pixel_j+similarBox_r);%ȡ�����ص�����
       %���ƿ����������б���
       for similarBox_i=pixel_i-searchBox_r+similarBox_r:pixel_i+searchBox_r-similarBox_r
           for similarBox_j=pixel_j-searchBox_r+similarBox_r:pixel_j+searchBox_r-similarBox_r       
               NJ= padNoiseImage(similarBox_i-similarBox_r:similarBox_i+similarBox_r,similarBox_j-similarBox_r:similarBox_j+similarBox_r);%ȡ�����ƿ����ĵ�����
               difMatrix=(NI-NJ).*gaussWeight;%©���˸�˹��Ȩ����
               dij=sum(sum(difMatrix.^2));%������������������,�������ص�����������ԭͼ��
               fk=exp(-dij/(h^2));             
               sweight=sweight+fk;%����Ȩ�غ�
               average = average + fk*padNoiseImage(similarBox_i,similarBox_j);  %�����Ȩ��                                    
           end
       end
       denoisedImage(pixel_i-searchBox_r,pixel_j-searchBox_r) = average / sweight;%���Ȩ��ֵ
    end
end
H2=figure;
imshow(denoisedImage,[]);%�˲���ͼ��
title('NLM denoised image');

figure(H1);
text(0,0,sprintf('PSNR:%f',my_psnr(double(rawImage),double(noiseImage))));
figure(H2);
text(0,0,sprintf('PSNR:%f',my_psnr(double(rawImage),double(denoisedImage))));