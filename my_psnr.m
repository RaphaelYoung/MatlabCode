function r = my_psnr(X,XR)
% r=my_psnr(X,XR)
% the peak signal-to-noise ration (PSNR) between two images X and XR, 
% where XR is the reconstruction of X using some method


% mse=(norm(x-XR))^2/numel(x);
% graymax=max(max(x));
% r=10*log10(graymax^2/mse);

%------ PSNR computation 2--------
mse=(norm(X-XR,'fro'))^2/numel(X);
graymax=max(max(X));
r=10*log10(graymax^2/mse);

%------ PSNR computation 3--------
% MSE=mean((XR(:)-x(:)).^2);
% r=10*log10(255^2/MSE);