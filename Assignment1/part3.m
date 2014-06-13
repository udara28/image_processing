img = imread('images/hgrgbsmall.png');
%calculate pdf and cdf
[h w c] = size(img);
L = 256;
histo = zeros(L,c);
cumhisto = zeros(L,c);
for cc = 1 : c
    for k = 0 : L - 1
        histo(k+1,cc) = sum(sum(img(:,:,cc) == k));
        cumhisto(k+1,cc) = sum(sum(img(:,:,cc) <= k));
    end
end
histo = histo/(h*w);
cumhisto = cumhisto / (h*w);

%histogram equalization
hisequ = zeros(L,c);
imgequ = uint8(zeros(h,w,c));
for i = 1 : h
    for j = 1 : w
        for k = 1 : c
            imgequ(i,j,k) = uint8((L-1)*cumhisto(img(i,j,k)+1,k));
            hisequ(imgequ(i,j,k)+1) = hisequ(imgequ(i,j,k)+1) + 1;
        end
    end
end
%display the results
subplot(2,1,1);     subimage(img); axis off;    title('Original');
subplot(2,1,2);     subimage(imgequ);   axis off;   title('Histogram Equalized');
figure;
subplot(1,2,1);     plot(histo);    title('Original');
hisequ = hisequ/(h*w);
subplot(1,2,2);plot(hisequ(:,1));   title('After Equalization');