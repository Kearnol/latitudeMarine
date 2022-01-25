package com.dk.latmarine.models;

public class Dimension {
	int height;
	int width;
	
	//Constructors
	
	public Dimension() {}
	
	public Dimension(int width, int height) {
		this.width = width;
		this.height = height;
	}
	
	// Getters & Setters
	public int getHeight() {
		return height;
	}

	public void setHeight(int height) {
		this.height = height;
	}

	public int getWidth() {
		return width;
	}

	public void setWidth(int width) {
		this.width = width;
	}

}
