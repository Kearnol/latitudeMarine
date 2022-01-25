package com.dk.latmarine.models;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="sellables")
public class Sellable {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@NotNull
	@Size(min= 1, max = 255, message="Title required")
 	private String title;
	
	@NotNull (message="Selection required")
	@Size(min=1, message="Selection required")
	private String type;
	
	@Size(max=4, message="Errorrr")
	private String year;
	
	
	@Size(max = 255, message = "Make cannot exceed 255 characters")
	private String make;
	

	@Size(max = 255, message = "Model must be less than 255 characters")
	private String model;
	
	@NotNull (message="Price required")
	@Min(value=0, message="Price may not be null or less than 0")
	private Double price;
	
	@NotNull
	@Size(min= 3, message = "Description must be 3 or more characters - or \"No Description\"")
	private String description;
	
	@Size(min= 3, message="Condition required or \"n/a\"")
	//"Condition" - (reserved keyword)
	private String state;
	
	@NotNull (message="quantity required or \"0\"")
	@Min(value= 0, message="Qauntity cannot be less than 0")
	private Integer quantity;

// ======================
// Methods to update Created at & Updated at
// ======================
	
	@Column(updatable=false)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date createdAt;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date updatedAt;
	
	@PrePersist
	protected void onCreate(){
		this.createdAt = new Date();
	}
	@PreUpdate
	protected void onUpdate(){
		this.updatedAt = new Date();
	}
	
// ======================
// Related Data
// ======================
	@OneToMany(mappedBy="sellable", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	
    private List<Photo> photos;
	
// ======================
// Constructors
// ======================
	public Sellable() {}
	
// ======================
// Getters & Setters
// ======================
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getMake() {
		return make;
	}
	public void setMake(String make) {
		this.make = make;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	public List<Photo> getPhotos() {
		return photos;
	}
	public void setPhotos(List<Photo> photos) {
		this.photos = photos;
	}
	
	
}
