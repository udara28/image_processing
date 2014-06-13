function z_img = zoom_nearest_neighbour(img,z_fac)
    [h w c] = size(img);
    z_img = uint8(zeros(h*z_fac,w*z_fac,c));
    for i = 1 : h*z_fac,
        for j = 1 : w*z_fac,
            z_img(i,j,:) = uint8(img(ceil(i/z_fac),ceil(j/z_fac),:));
        end
    end
end
