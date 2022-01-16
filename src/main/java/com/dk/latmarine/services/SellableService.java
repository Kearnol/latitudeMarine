package com.dk.latmarine.services;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dk.latmarine.models.Photo;
import com.dk.latmarine.models.Sellable;
import com.dk.latmarine.repositories.SellableRepo;

@Service
public class SellableService {
	@Autowired
	SellableRepo sellRepo;
	
	@Autowired
	PhotoService photoServ;
	
	public Sellable saveSellable(Sellable s) {
		return sellRepo.save(s);
	}
	
	public Iterable<Sellable> getAllSellables(){
		return sellRepo.findAll();
	}
	
	public Sellable getSellable(Long id) {
		Optional<Sellable> optItem = sellRepo.findById(id);
		if (optItem.isPresent()) {
			return optItem.get();
		} else { 
			return null;
		}
	}
	
	public void destroySellable(Long id) {
		sellRepo.deleteById(id);
	}
	
	public void saveImage(MultipartFile imageFile, Photo photo, RedirectAttributes flash)
	throws Exception {
		if(photoServ.savePhotoS3(photo, imageFile)){
			photoServ.save(photo);
		} else {
			flash.addFlashAttribute("img", "Problems uploading images");
			throw new Exception();
			// flash & tell client;
		}			
	}
	
	public Iterable<Sellable> getAllBoats() {
		return sellRepo.findByType("boat");
	}
	
	public Iterable<Sellable> getAllMotors() {
		return sellRepo.findByType("motor");
	}
	
	public Iterable<Sellable> getAllParts() {
		return sellRepo.findByType("part");
	}
	
	public Iterable<Sellable> getAllTrailers() {
		return sellRepo.findByType("trailer");
	}
	
}
