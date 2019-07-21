package org.gdpi.neusoft.bean;

import java.io.Serializable;

public class Good implements Serializable{
	private static final long serialVersionUID = 1L;
	private Integer id;//id
	private Integer categoryId;
	private String name;//name
	private String details;//details
	private Double price;//price
	private Double vipPrice;//vip_price
	private String image;//image
	private Integer count;//count
	private Integer orders;//order
	private int state;//state
	private Author author;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDetails() {
		return details;
	}
	public void setDetails(String details) {
		this.details = details;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public Double getVipPrice() {
		return vipPrice;
	}
	public void setVipPrice(Double vipPrice) {
		this.vipPrice = vipPrice;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	
	public Integer getOrders() {
		return orders;
	}
	public void setOrders(Integer orders) {
		this.orders = orders;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public Author getAuthor() {
		return author;
	}
	public void setAuthor(Author author) {
		this.author = author;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Good [id=" + id + ", categoryId=" + categoryId + ", name=" + name + ", details=" + details + 
				", price=" + price + ", vipPrice=" + vipPrice + ", image=" + image + ", count=" + count
				+ ", orders=" + orders + ", state=" + state + ", author=" + author + "]";
	}
	
}
