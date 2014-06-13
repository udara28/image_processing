function z_img = zoom_bilinear(image,z_fac)
% linear transformation => P0 + (P1 - P0)x/(x1-x0)
% => (((x1-x0) - x)P0 + x.P1)/(x1-x0)

% bilinear transformation = > 
% ((y1-y0)-y)((((x1-x0) - x)P0 + x.P1)/(x1-x0)) 
%           + y((((x1-x0) - x)P0 + x.P1)/(x1-x0))/(y1-y0)
img = cast(image,'uint32');
[h w c] = size(img);
z_img = uint8(zeros(h*z_fac,w*z_fac,c));
for i = 1 : h-1,
    for j = 1 : w-1,
        
        for zh = 0 : z_fac ,
           % hu = ((z_fac-zh)*img(i,j,:) + zh*img(i+1,j,:))/z_fac;
           % hl = ((z_fac-zh)*img(i,j+1,:) + zh*img(i+1,j+1,:))/z_fac;
            hu = (z_fac-zh)*img(i,j,:) + zh*img(i+1,j,:);
            hl = (z_fac-zh)*img(i,j+1,:) + zh*img(i+1,j+1,:);
            for zv = 0 : z_fac ,
                z_img(i*z_fac+zh,j*z_fac+zv,:) = uint8( ((z_fac-zv)*hu + zv*hl)/power(z_fac,2));
            end
        end
    end
end

end