clear; close all;clc;
% similarBox_r=0;%���ƿ�뾶
% h=0.01;%ָ��������˥������
% 
% rawImage=imread('lena.tif');
% % rawImage=imresize(rawImage,0.2);
% [rawImage_m, rawImage_n]=size(rawImage);
% denoisedImage=zeros(rawImage_m,rawImage_n);
% 
% figure;
% imshow(rawImage,[]);%��ʾԭʼͼ��
% title('raw image');
% 
% noiseImage = imnoise(rawImage,'gaussian',0,0.01);
% figure;
% imshow(noiseImage,[]);%��ʾ����������ͼ��
% title('noise image');
% noiseImage = padarray(noiseImage,[similarBox_r similarBox_r],'symmetric'); %����Ե�Գ��۵���ȥ  similarBox_r :�ӿ�Ŀ��ֵ

% 
% %�������ص�
% for noiseImage_i=similarBox_r+1:rawImage_m+similarBox_r
%     for noiseImage_j=similarBox_r+1:rawImage_n+similarBox_r
% %        average=0;
% %        sweight=0;
% %        NI= noiseImage(noiseImage_i-similarBox_r:noiseImage_i+similarBox_r,noiseImage_j-similarBox_r:noiseImage_j+similarBox_r);%ȡ�����������ĵ�����
%        %���ƿ�������ͼ���б���
%        for similarBox_i=similarBox_r+1:rawImage_m+similarBox_r
%            for similarBox_j=similarBox_r+1:rawImage_n+similarBox_r
% %                NJ= noiseImage(similarBox_i-similarBox_r:similarBox_i+similarBox_r,similarBox_j-similarBox_r:similarBox_j+similarBox_r);%ȡ�����ƿ����ĵ�����
% %                difMatrix=double(NI)-double(NJ);
% %                dij=sum(sum(difMatrix.^2));%������������������,�������ص�����������ԭͼ��
% %                fk=exp(-dij/h/h);
% %                sweight=sweight+fk;%����Ȩ�غ�
% %                average = average + fk*noiseImage(similarBox_i,similarBox_j);  %�����Ȩ��                                    
%            end
%        end
% %        denoisedImage(noiseImage_i-similarBox_r,noiseImage_j-similarBox_r) = average / sweight;%���Ȩ��ֵ
% %        denoisedImage(noiseImage_i-similarBox_r,noiseImage_j-similarBox_r) = noiseImage(noiseImage_i,noiseImage_j);
%     end
% end

%�������ص�
for noiseImage_i=1:512
    for noiseImage_j=1:512
       for similarBox_i=1:21
           for similarBox_j=1:21                                  
           end
       end
    end
end 
% figure
% imshow(denoisedImage,[]);%�˲���ͼ��
% title('denoised image');

