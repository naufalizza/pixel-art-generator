function output_img = transform_color(rgb_img, rgb_palette)
    lab_img = rgb2lab(rgb_img);
    lab_palette = rgb2lab(rgb_palette);
    img_size = size(rgb_img);
    for r=1:img_size(1)
        for c=1:img_size(2)
            replacement_color_idx = 1;
            nearest_distance = get_lab_color_distance(lab_img(r,c,:), lab_palette(1,1,:));
            for p=1:size(rgb_palette,2)
                if get_lab_color_distance(lab_img(r,c,:), lab_palette(1,p,:)) < nearest_distance
                    nearest_distance = get_lab_color_distance(lab_img(r,c,:), lab_palette(1,p,:));
                    replacement_color_idx = p;
                end
            end
            rgb_img(r,c,1) = rgb_palette(1,replacement_color_idx,1);
            rgb_img(r,c,2) = rgb_palette(1,replacement_color_idx,2);
            rgb_img(r,c,3) = rgb_palette(1,replacement_color_idx,3);
        end
    end
    output_img = rgb_img;
end