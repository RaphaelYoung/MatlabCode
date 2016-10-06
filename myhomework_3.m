clear; close all;clc;
% similarBox_r=0;%相似框半径
% h=0.01;%指数函数的衰减因子
% 
% rawImage=imread('lena.tif');
% % rawImage=imresize(rawImage,0.2);
% [rawImage_m, rawImage_n]=size(rawImage);
% denoisedImage=zeros(rawImage_m,rawImage_n);
% 
% figure;
% imshow(rawImage,[]);%显示原始图像
% title('raw image');
% 
% noiseImage = imnoise(rawImage,'gaussian',0,0.01);
% figure;
% imshow(noiseImage,[]);%显示加入噪声后图像
% title('noise image');
% noiseImage = padarray(noiseImage,[similarBox_r similarBox_r],'symmetric'); %将边缘对称折叠上去  similarBox_r :加宽的宽度值

% 
% %遍历像素点
% for noiseImage_i=similarBox_r+1:rawImage_m+similarBox_r
%     for noiseImage_j=similarBox_r+1:rawImage_n+similarBox_r
% %        average=0;
% %        sweight=0;
% %        NI= noiseImage(noiseImage_i-similarBox_r:noiseImage_i+similarBox_r,noiseImage_j-similarBox_r:noiseImage_j+similarBox_r);%取出搜索框中心点邻域
%        %相似框在整幅图像中遍历
%        for similarBox_i=similarBox_r+1:rawImage_m+similarBox_r
%            for similarBox_j=similarBox_r+1:rawImage_n+similarBox_r
% %                NJ= noiseImage(similarBox_i-similarBox_r:similarBox_i+similarBox_r,similarBox_j-similarBox_r:similarBox_j+similarBox_r);%取出相似框中心点邻域
% %                difMatrix=double(NI)-double(NJ);
% %                dij=sum(sum(difMatrix.^2));%代表两个矩阵的相关性,利用像素点的相关性来还原图像
% %                fk=exp(-dij/h/h);
% %                sweight=sweight+fk;%计算权重和
% %                average = average + fk*noiseImage(similarBox_i,similarBox_j);  %计算加权和                                    
%            end
%        end
% %        denoisedImage(noiseImage_i-similarBox_r,noiseImage_j-similarBox_r) = average / sweight;%求加权均值
% %        denoisedImage(noiseImage_i-similarBox_r,noiseImage_j-similarBox_r) = noiseImage(noiseImage_i,noiseImage_j);
%     end
% end

%遍历像素点
for noiseImage_i=1:512
    for noiseImage_j=1:512
       for similarBox_i=1:21
           for similarBox_j=1:21                                  
           end
       end
    end
end 
% figure
% imshow(denoisedImage,[]);%滤波后图像
% title('denoised image');

