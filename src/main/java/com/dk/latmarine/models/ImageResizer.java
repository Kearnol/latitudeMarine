package com.dk.latmarine.models;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Iterator;

import javax.imageio.IIOImage;
import javax.imageio.ImageIO;
import javax.imageio.ImageWriteParam;
import javax.imageio.ImageWriter;
import javax.imageio.stream.ImageOutputStream;

import org.jboss.logging.Logger;
import org.springframework.web.multipart.MultipartFile;
public class ImageResizer {
	public static Logger log = Logger.getLogger(ImageResizer.class.getName());
	
    /**
     * Resizes an image to a absolute width and height (the image may not be
     * proportional)
     * @param multipart multipartFile of the original image uploaded through client form.
     * @param filenName the image file's name as input by the client.
     * @Return the compressed & resized file
     * @throws IOException
     */
	public  static File multipartToFile(MultipartFile multipart, String fileName) throws IllegalStateException, IOException {
	    File convFile = new File(System.getProperty("java.io.tmpdir")+"/"+fileName);
	    multipart.transferTo(convFile);
	    return convFile;
	}

	
	public static File resize(MultipartFile mpFile, String fileName)
            throws IOException {
		// convert mpFile to a file.
        File imgFile = multipartToFile(mpFile, fileName);
        System.out.println("imgfile = " + imgFile);
        
        // get the MIME type suffix
        String suffix = getSuffix(imgFile);
        System.out.println("suffix: " + suffix);
        
        // create a buffered image object to read original h x w properties
        BufferedImage inputImage = ImageIO.read(imgFile);		
       
        //compress the original input image
        CompressImage(inputImage, suffix);
		
		int orgImgWidth = inputImage.getWidth();
		int orgImgHeight = inputImage.getHeight();
		
		//Print the dimension to the console.         		
		System.out.println(String.format("Img Dimensions:[w:%d x h:%d]", orgImgWidth, orgImgHeight));
		
		// set scaled width / height based on original dimensions
		int scaledWidth; 
		int scaledHeight;

		if(orgImgWidth > orgImgHeight) {
			scaledWidth = 960;
			scaledHeight = 720;
		}
		else if (orgImgWidth == orgImgHeight){	
			scaledWidth = 720;
			scaledHeight = 720;
		}
		else{
			scaledWidth = 720;
			scaledHeight = 960;
		}
		
        // creates output image of proper size
        BufferedImage outputImage = new BufferedImage(scaledWidth,
                scaledHeight, inputImage.getType());
 
        // draws the compressed input image to the output image
        Graphics2D g2d = outputImage.createGraphics();
        g2d.drawImage(inputImage, 0, 0, scaledWidth, scaledHeight, null);
        g2d.dispose();
 
        // extracts extension of output file
//        String formatName = outputImagePath.substring(outputImagePath
//                .lastIndexOf(".") + 1);
// 
        // writes to output file
        File file = File.createTempFile("temp", "." + suffix);
        file.deleteOnExit();
        ImageIO.write(outputImage, suffix, file);
        return file;
    }
	
	// ========================================
	// Returns the format type suffix for a file
	// ========================================
	public static String getSuffix(File file) throws IOException {
		int pos = file.getName().lastIndexOf(".");
	    if (pos == -1) {
	      throw new IOException("No extension for file: " + file.getAbsolutePath());
	    }
	    String suffix = file.getName().substring(pos + 1);
	    return suffix;
		}
	
	
	// ========================================
	// Compresses an image 'inline' with a provided suffix
	// ========================================
    
	public static void CompressImage(BufferedImage image, String suffix) throws IOException {
	    File compressedImageFile = File.createTempFile("temp", null);
	    OutputStream os = new FileOutputStream(compressedImageFile);
	    
	    Iterator<ImageWriter> writers = ImageIO.getImageWritersByFormatName(suffix);
	    ImageWriter writer = (ImageWriter) writers.next();

	    ImageOutputStream ios = ImageIO.createImageOutputStream(os);
	    writer.setOutput(ios);

	    ImageWriteParam param = writer.getDefaultWriteParam();

	    param.setCompressionMode(ImageWriteParam.MODE_EXPLICIT);
	    param.setCompressionQuality(0.05f);  // Change the quality value you prefer
	    writer.write(null, new IIOImage(image, null, null), param);
	    os.close();
	    ios.close();
	    writer.dispose();
	    compressedImageFile.delete();
	  }
	}
