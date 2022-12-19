function output_img = upscale_img(img, scale)
    output_img = imresize(img, scale, "nearest");
end