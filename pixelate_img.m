function output_img = pixelate_img(img, scale, new_height, new_width)
    scaled_img = imresize(img, [new_height, new_width], 'nearest');
    output_img = imresize(scaled_img, scale, "nearest");
end