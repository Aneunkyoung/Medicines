package com.medicines.dto;

public class DrugSearch {
	private String entpName;
	private String itemName;
	private String img;
	private String url;
	
	public DrugSearch() {
		// TODO Auto-generated constructor stub
	}

	public DrugSearch(String entpName, String itemName, String img, String url) {
		super();
		this.entpName = entpName;
		this.itemName = itemName;
		this.img = img;
		this.url = url;
	}

	public String getEntpName() {
		return entpName;
	}

	public void setEntpName(String entpName) {
		this.entpName = entpName;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
}
