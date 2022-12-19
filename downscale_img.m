function output_img = downscale_img(img, scale)
    img_size = size(img);
    new_height = uint8(img_size(1)/scale);
    new_width = uint8(img_size(2)/scale);
    output_img = imresize(img, [new_height, new_width], 'nearest');
end