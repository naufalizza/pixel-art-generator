function output_hsv = replace_color_by_hsv_component(hsv_img, color_list_hsv, HSV_COMPONENT)
    img_size = size(hsv_img);
    for r = 1:img_size(1)
        for c = 1:img_size(2)
            current_component= hsv_img(r,c,HSV_COMPONENT);
            replacement_color_idx = 1; 
            nearest_value = abs(current_component - color_list_hsv(1,1,HSV_COMPONENT));
            for p = 1:size(color_list_hsv,2)
                if abs(current_component - color_list_hsv(1,p,HSV_COMPONENT)) < nearest_value
                    nearest_value = abs(current_component - color_list_hsv(1,p,HSV_COMPONENT));
                    replacement_color_idx = p;
                end
            end
            disp(hsv_img(r,c,HSV_COMPONENT) + "-->" + color_list_hsv(1,replacement_color_idx,HSV_COMPONENT) + " - " + replacement_color_idx);
            hsv_img(r,c,1) = color_list_hsv(1,replacement_color_idx,1);
            hsv_img(r,c,2) = color_list_hsv(1,replacement_color_idx,2);
            hsv_img(r,c,3) = color_list_hsv(1,replacement_color_idx,3);
        end
    end
    output_hsv = hsv_img;
end