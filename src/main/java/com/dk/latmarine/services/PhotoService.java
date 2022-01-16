package com.dk.latmarine.services;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.AmazonServiceException;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.ListObjectsV2Result;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.amazonaws.services.s3.model.S3ObjectSummary;
import com.dk.latmarine.models.ImageResizer;
import com.dk.latmarine.models.Photo;
import com.dk.latmarine.repositories.PhotoRepo;

@Service
public class PhotoService {
	@Autowired
	PhotoRepo photoRepo;
	ImageResizer imgResize;
	
	final AmazonS3 s3 = AmazonS3ClientBuilder.standard().withRegion("us-east-2").build();
	
	public String sanitzieFileName(String name) {
		String ext;
		if (name != null && name.lastIndexOf('.') != -1) {
	          ext = name.substring(name.lastIndexOf('.'));
	     } else {
	    	  ext = "";		
	    }
		name = name.substring(0, name.lastIndexOf('.'));
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("ddMMyyhhmmss");
		String df = sdf.format(date);
		return name.replaceAll("[:\\\\/*?|<>]", "_") + df + ext;
	}
	
//	public void savePhotoImage(Photo photo, MultipartFile imageFile) throws Exception {
//		
//		//this get's us to src/main/resources without knowing the full path (i.e. hard coding)
//		Path currentPath = Paths.get(".");
//		System.out.println(currentPath);
//	    Path absolutePath = currentPath.toAbsolutePath();
//	    System.out.println(absolutePath);
//		photo.setPath(absolutePath + "/src/main/resources/static/photos/");
//		byte[] bytes = imageFile.getBytes();
//	    Path path = Paths.get(photo.getPath() + photo.getFileName());
//	    photo.setPath(path.toString());
//	    Files.write(path, bytes);	    	
//	   
//    }
	
	public Photo save(Photo photo) {
		return photoRepo.save(photo);
	}
	
// ======================
// Save Photo to AWS S3 Bucket
// ======================
	
	// @param photo - photo class
	// @param imageFile = multi-part file received from form input
	
	public boolean savePhotoS3(Photo photo, MultipartFile imageFile) throws Exception {			
		String bucket_name = "latitudemarineimgs";
		String fileName = photo.getFileName();
		
		ObjectMetadata objectMetadata = new ObjectMetadata();
        objectMetadata.setContentType(imageFile.getContentType());
        objectMetadata.setContentLength(imageFile.getSize());
        
        try {
        	s3.putObject(new PutObjectRequest(bucket_name,
                fileName,
                imageFile.getInputStream(),
                objectMetadata).withCannedAcl(CannedAccessControlList.PublicRead));
        	return true;
        } catch (AmazonServiceException e) {
			System.err.println(e.getErrorMessage());
			return false;
			//add Logger-J 
		}     
    }
	
// ======================
// Retrieve Photos from AWS S3
// ======================
	  public List<String> getBoatPhotosS3(){
		  String bucket_name = "latitudemarineimgs";  
		  ListObjectsV2Result result = s3.listObjectsV2(bucket_name);
	        List<S3ObjectSummary> objects = result.getObjectSummaries();

	        return objects.stream()
	                .map(S3ObjectSummary :: getKey).collect(Collectors.toList());
	    }

	
}	
//	System.out.format("Uploading %s to S3 bucket %s...\n", file_path, bucket_name);


//======================
//Resize an Image/update
//======================









