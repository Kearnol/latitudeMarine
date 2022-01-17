package com.dk.latmarine.models;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

import org.springframework.web.multipart.MultipartFile;
public class ImageResizer {
    /**
     * Resizes an image to a absolute width and height (the image may not be
     * proportional)
     * @param inputImagePath Path of the original image
     * @param outputImagePath Path to save the resized image
     * @param scaledWidth absolute width in pixels
     * @param scaledHeight absolute height in pixels
     * @throws IOException
     */
	public  static File multipartToFile(MultipartFile multipart, String fileName) throws IllegalStateException, IOException {
	    File convFile = new File(System.getProperty("java.io.tmpdir")+"/"+fileName);
	    multipart.transferTo(convFile);
	    return convFile;
	}

	
	public static File resize(MultipartFile mpFile,
            String fileName, int scaledWidth, int scaledHeight)
            throws IOException {
        // reads input image
//        File inputFile = new File(inputImagePath);
        File imgFile = multipartToFile(mpFile, fileName);
        System.out.println("imgfile" + imgFile);
		BufferedImage inputImage = ImageIO.read(imgFile);
 
        // creates output image
        BufferedImage outputImage = new BufferedImage(scaledWidth,
                scaledHeight, inputImage.getType());
 
        // scales the input image to the output image
        Graphics2D g2d = outputImage.createGraphics();
        g2d.drawImage(inputImage, 0, 0, scaledWidth, scaledHeight, null);
        g2d.dispose();
 
        // extracts extension of output file
//        String formatName = outputImagePath.substring(outputImagePath
//                .lastIndexOf(".") + 1);
// 
        // writes to output file
        File file = File.createTempFile("temp", ".jpg");
        ImageIO.write(outputImage, "png", file);
        return file;
    }
 
}
