WIDTH = 172;
PALETTE_PATH = "palette\japanese-print56-32x.jpg";
PALETTE_NAME = extractBetween(PALETTE_PATH, "palette\", ".jpg");
IMAGES_DIR_PATH = "img\";
IMAGE_PATH = "img\img (1).jpeg";
STANDALONE = true;
STANDALONE_IMAGE_PATH = "img\standalone\mountain-tree.jpg";

INPUT_NUM = 30;

% palette
palette = imread(PALETTE_PATH); 

if STANDALONE
    mkdir("output\_standalone");
    IMAGE_PATH = STANDALONE_IMAGE_PATH;
    filename = extractAfter(STANDALONE_IMAGE_PATH, "img\standalone\");
    % original image
    img = imread(IMAGE_PATH);
    
%     figure; imshow(img); title OriginalImage;
%     figure; imshow(to_pixel_art(img, palette, WIDTH)); title PixelArtResult;
    disp("WRITING STANDALONE " + filename + " using " + PALETTE_NAME)
    imwrite(to_pixel_art(img, palette, WIDTH), "output\_standalone\"+PALETTE_NAME+"_"+filename);

else
    mkdir("output\"+PALETTE_NAME);
    for i = 1:INPUT_NUM
        filename = "img ("+i+").jpeg";
        IMAGE_PATH = IMAGES_DIR_PATH+filename;
        % original image
        img = imread(IMAGE_PATH);
        
    %     figure; imshow(img); title OriginalImage;
    %     figure; imshow(to_pixel_art(img, palette, WIDTH)); title PixelArtResult;
        disp("WRITING " + filename)
        imwrite(to_pixel_art(img, palette, WIDTH), "output\"+PALETTE_NAME+"\"+filename);
    end
    imwrite(palette, "output\"+PALETTE_NAME+"\_original_palette.jpeg");
end



