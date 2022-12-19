function pixel_art_img = to_pixel_art(img, palette_img, output_width)
    SATURATION_OFFSET = 0.2;

    % color palette
    palette_hsv = rgb2hsv(palette_img);
    palette_size = size(palette_hsv);
    new_palette_width = palette_size(1) * ceil(palette_size(2)/palette_size(1));
    palette = imresize(palette_img,[palette_size(1), new_palette_width]);
    palette_color_num = round(size(palette,2)/size(palette,1));
    palette_size_unit = size(palette,1);
    color_list_hsv = zeros(1,palette_color_num,3);
    r = round(size(palette_hsv,1)/2);
    for c_num = 1:palette_color_num
        c = c_num*palette_size_unit - round(palette_size_unit/2);
        color_list_hsv(1,c_num,1) = palette_hsv(r,c,1);
        color_list_hsv(1,c_num,2) = palette_hsv(r,c,2);
        color_list_hsv(1,c_num,3) = palette_hsv(r,c,3);
    end


    % original image
    img_size = size(img);
    
    % get hsv color space
    original_hsv = rgb2hsv(img);
    hsv_img = rgb2hsv(img);
    
    SATURATION_OFFSET = 0.2;

    % saturate image
    for r = 1:img_size(1)
        for c = 1:img_size(2)
            hsv_img(r,c,2) = max(min(hsv_img(r,c,2)+SATURATION_OFFSET, 1), 0);
        end
    end
    
    % pixelate image
    scale = uint8(img_size(2)/output_width);
    downscaled_img = downscale_img(img, scale);

    
    % transform color
    transformed_img = transform_color(downscaled_img, palette_img);

    pixel_art_img = upscale_img(transformed_img, scale);
end