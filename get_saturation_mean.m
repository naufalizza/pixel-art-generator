function sat_mean = get_saturation_mean(rgb_img)
    hsv_img = rgb2hsv(rgb_img);
    img_size = size(hsv_img);
    num_pixel = img_size(1)*img_size(2);
    sat_sum = 0;
    for r=1:img_size(1)
        for c=1:img_size(2)
            sat_sum = sat_sum+hsv_img(r,c,2);
        end
    end
    sat_mean = sat_sum/num_pixel;

end