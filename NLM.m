% 原始非局部均值(Original Non-local Means, ONLM)算法，基本思想是利用图像中大量冗余信息，对图像中所有相似邻域内像素的灰度值
% 根据权重系数计算加权平均得到受污染像素的灰度估计值，其中权重系数由加权核函数和像素邻域之间的加权欧式距离决定。由于NLM 算法
% 计算量非常大，为提高算法的效率，采用限定邻域搜索范围的 NLM 算法,像素邻域大小 7×7，邻域搜索范围 21×21，并且调整核函数的滤
% 波参数使去噪性能达到最佳

clear; 
% close all;
clc;
searchBox_r=10;%搜索框半径
similarBox_r=3;%相似框半径
h=20;%指数函数的衰减因子

rawImage=imread('barbara512.bmp');
%  rawImage=imresize(rawImage,0.2);
[rawImage_m, rawImage_n]=size(rawImage);
denoisedImage=zeros(rawImage_m,rawImage_n);

% figure
% imshow(rawImage,[]);%显示原始图像
% title('raw image')

% noise=wgn(rawImage_m,rawImage_n,25);
% noiseImage=double(rawImage)+double(noise);
noiseImage=imnoise(rawImage,'gaussian', 0, 10^2/255^2);
H1=figure;
imshow(noiseImage,[]);%显示加入噪声后图像
title('noise image');

padNoiseImage = padarray(noiseImage,[searchBox_r searchBox_r],'symmetric'); %将边缘对称折叠上去
padNoiseImage = double(padNoiseImage);

%计算高斯核
alpha=1;%高斯加权欧氏距离的标准差
gaussMat = repmat(-similarBox_r:similarBox_r,2*similarBox_r+1,1);
gaussWeight = exp(-((gaussMat).^2+(gaussMat').^2)/(2*alpha*alpha));

%像素点遍历（像素点在搜索区域中心）
for pixel_i=searchBox_r+1:rawImage_m+searchBox_r
    for pixel_j=searchBox_r+1:rawImage_n+searchBox_r
       average=0;
       sweight=0;
       NI= padNoiseImage(pixel_i-similarBox_r:pixel_i+similarBox_r,pixel_j-similarBox_r:pixel_j+similarBox_r);%取出像素点邻域
       %相似框在搜索框中遍历
       for similarBox_i=pixel_i-searchBox_r+similarBox_r:pixel_i+searchBox_r-similarBox_r
           for similarBox_j=pixel_j-searchBox_r+similarBox_r:pixel_j+searchBox_r-similarBox_r       
               NJ= padNoiseImage(similarBox_i-similarBox_r:similarBox_i+similarBox_r,similarBox_j-similarBox_r:similarBox_j+similarBox_r);%取出相似框中心点邻域
               difMatrix=(NI-NJ).*gaussWeight;%漏乘了高斯加权矩阵
               dij=sum(sum(difMatrix.^2));%代表两个矩阵的相关性,利用像素点的相关性来还原图像
               fk=exp(-dij/(h^2));             
               sweight=sweight+fk;%计算权重和
               average = average + fk*padNoiseImage(similarBox_i,similarBox_j);  %计算加权和                                    
           end
       end
       denoisedImage(pixel_i-searchBox_r,pixel_j-searchBox_r) = average / sweight;%求加权均值
    end
end
H2=figure;
imshow(denoisedImage,[]);%滤波后图像
title('NLM denoised image');

figure(H1);
text(0,0,sprintf('PSNR:%f',my_psnr(double(rawImage),double(noiseImage))));
figure(H2);
text(0,0,sprintf('PSNR:%f',my_psnr(double(rawImage),double(denoisedImage))));