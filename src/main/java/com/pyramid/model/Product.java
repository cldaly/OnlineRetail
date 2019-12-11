package com.pyramid.model;

import javax.swing.ImageIcon;

import org.springframework.web.multipart.MultipartFile;

public class Product {
	
	private String name;
	private double price;
	private String category;
	private byte[] image;
	
	public Product() {
		
	}
	public Product(String name, double price, String category, byte[] image) {
		super();
		this.name = name;
		this.price = price;
		this.category = category;
		this.image = image;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public byte[] getImage() {
		return image;
	}
	public void setImage(byte[] image) {
		this.image = image;
	}
	
	
	
	

}
