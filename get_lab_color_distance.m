function distance = get_lab_color_distance(lab1,lab2)
    distance = sqrt( (lab1(1)-lab2(1))^2 + (lab1(2)-lab2(2))^2 + (lab1(3)-lab2(3))^2);
end