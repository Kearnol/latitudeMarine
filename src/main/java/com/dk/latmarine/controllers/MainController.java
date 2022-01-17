package com.dk.latmarine.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dk.latmarine.models.Photo;
import com.dk.latmarine.models.Sellable;
import com.dk.latmarine.services.AdminUserService;
import com.dk.latmarine.services.PhotoService;
import com.dk.latmarine.services.SellableService;

@Controller
public class MainController {
	@Autowired
	SellableService sellServ;
	
	@Autowired
	PhotoService photoServ;
	
	@Autowired
	AdminUserService adminUserServ;
	
// ======================
// Index
// ======================	
	
	@GetMapping("/")
	public String index() {
		return "index.jsp";
	}
	
// ======================
// Add Sell-able | Render & Processing
// ======================
	
	@GetMapping("/admin/market")
	public String addToMarket(
			@ModelAttribute("sellable") Sellable sellable,
			Model model,
			HttpSession session) {
		Iterable<Sellable> sellables = sellServ.getAllSellables();
		model.addAttribute("sellables", sellables);
		return "addSellable.jsp";
	}
	
	@PostMapping("/addItem")
	public String saveSellable(
			RedirectAttributes flash,
			@Valid @ModelAttribute("sellable") Sellable sellable,
			BindingResult result,			
			@RequestParam("imageFiles") List<MultipartFile> imageFiles,
			Model model
			) {		
		Iterable<Sellable> sellables = sellServ.getAllSellables();
		model.addAttribute("sellables", sellables);				
		String endPoint = "";
		if(result.hasErrors()) {
			System.out.println("Errors occured");
			endPoint = "addSellable.jsp";
		} else {			
			if(imageFiles != null && !imageFiles.get(0).isEmpty()) {
				System.out.println("It came back true" + "....." + imageFiles.size() + "....." + imageFiles.get(0) + "....." + imageFiles);
				for(MultipartFile mpfile: imageFiles) {
					String fileName = photoServ.sanitzieFileName(mpfile.getOriginalFilename());
					Photo photo = new Photo();
					photo.setFileName(fileName);
					
					//ATTEMPT TO SAVE EACH PHOTO IN AWS S3
					
					try {
						/* 
						@param mpfile = multi-part file received from form input;
						@param photo = photo class
						@param flash = redirect attribute object 
						*/
						sellServ.saveImage(mpfile, photo, flash); 					
					} catch (Exception e) {
						e.printStackTrace();
						System.out.println(e);
						return "addSellable.jsp";
					}
					sellServ.saveSellable(sellable);					
					photo.setSellable(sellable);
					photoServ.save(photo);
					flash.addFlashAttribute("success", "Images successfully uploaded");
				}				
			 }
			flash.addFlashAttribute("success", "Item successfully added");
			endPoint = "redirect:/admin/market";
		}
		return endPoint;
	}
	
	
// ======================
// MarketPlace Views
// ======================	
	
	@GetMapping("/market")
	public String viewMarket(
			Model model) {
		Iterable<Sellable> sellables = sellServ.getAllSellables();
		model.addAttribute("sellables", sellables);
		return "market.jsp";
	}
	
	@GetMapping("/market/boats")
	public String viewMarketBoats(
			Model model) {
		Iterable<Sellable> boats = sellServ.getAllBoats();
		for(Sellable b: boats) {
			System.out.println(b.getTitle());
		}
		model.addAttribute("sellables", boats);
		return "market.jsp";
	}
	
	@GetMapping("/market/motors")
	public String viewMarketMotors(
			Model model) {
		Iterable<Sellable> motors = sellServ.getAllMotors();
		for(Sellable s: motors) {
			System.out.println(s.getTitle());
		}
		model.addAttribute("sellables", motors);
		return "market.jsp";
	}
		
	@GetMapping("/market/parts")
	public String viewMarketParts(
			Model model) {
		Iterable<Sellable> parts = sellServ.getAllParts();
		for(Sellable s: parts) {
			System.out.println(s.getTitle());
		}
		model.addAttribute("sellables", parts);
		return "market.jsp";
	}
	
	@GetMapping("/market/trailers")
	public String viewMarketTrailers(
			Model model) {
		Iterable<Sellable> trailers = sellServ.getAllTrailers();
		for(Sellable s: trailers) {
			System.out.println(s.getTitle());
		}
		model.addAttribute("sellables", trailers);
		return "market.jsp";
	}
	
// ======================
// Update Sell-able | Render & Processing
// ======================	
	
	
	@GetMapping("/admin/edit/{id}")
	public String editSellable(
			@ModelAttribute("sellable") Sellable sellable,
			Model model,
			@PathVariable("id") Long id) {
			Sellable item = sellServ.getSellable(id);
			model.addAttribute("sellable", item);
			model.addAttribute("title", item.getTitle());
			return"editSellable.jsp";
		}
	
	@PutMapping("/updateItem")
	public String saveEdit(
			@Valid @ModelAttribute("sellable") Sellable sellable,
			BindingResult result,
			Model model,
			RedirectAttributes flash) {
		model.addAttribute("title", sellable.getTitle());
		if(result.hasErrors()) {
			return "editSellable.jsp";
		} else {
			flash.addFlashAttribute("success", "Item successfully updated");
			return "redirect:/editItem/" + sellable.getId();
		}
		
	}
	
// ======================
// Show Item
// ======================
	@GetMapping("/market/{id}")
	public String viewSellable(
			@PathVariable("id") Long id,
			Model model) {
		Sellable sellable = sellServ.getSellable(id);
		model.addAttribute("sellable", sellable);
		return "viewSellable.jsp";
	}
	
	
// ======================
// Delete
// ======================	
	@DeleteMapping("admin/delete")
	public String destroySellable(
			@RequestParam("id") Long id) {
		sellServ.destroySellable(id);
		return "redirect:/admin/market";
	}
}
