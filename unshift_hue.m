function ouput_hsv = unshift_hue(hsv_img, original_hsv, color_list_hsv)
    img_size = size(hsv_img);
    for r = 1:img_size(1)
        for c = 1:img_size(2)
            original_hue = original_hsv(r,c,1);
            original_sat = original_hsv(r,c,2);
            replacement_color_idx = 1; 
            nearest_hue = abs(original_hue - color_list_hsv(1,1,1));
            for p = 1:size(color_list_hsv,2)
                if abs(original_hue-color_list_hsv(1,p,1)) < nearest_hue
                    nearest_hue= abs(original_hue - color_list_hsv(1,p,1));
                    replacement_color_idx = p;
                end
            end
            hsv_img(r,c,1) = color_list_hsv(1,replacement_color_idx, 1);
            hsv_img(r,c,2) = original_sat;
        end
    end
    ouput_hsv = hsv_img;
end