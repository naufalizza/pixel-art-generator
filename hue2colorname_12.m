function color_name = hue2colorname_12(hue)
    hue = mod(hue*360+360, 360);
    color_name = "unknown";
    if hue < 15 || hue >= 345
        color_name = "red";
    elseif 15 <= hue && hue < 45
        color_name = "orange";
    elseif 45 <= hue && hue < 75
        color_name = "yellow";
    elseif 75 <= hue && hue < 105
        color_name = "chartreuse green";
    elseif 105 <= hue && hue < 135
        color_name = "green";
    elseif 135 <= hue && hue < 165
        color_name = "spring green";
    elseif 165 <= hue && hue < 195
        color_name = "cyan";
    elseif 195 <= hue && hue < 225
        color_name = "azure";
    elseif 225 <= hue && hue < 255
        color_name = "blue";
    elseif 255 <= hue && hue < 285
        color_name = "violet";
    elseif 285 <= hue && hue < 315
        color_name = "magenta";
    elseif 315 <= hue && hue < 345
        color_name = "rose";
    end

end