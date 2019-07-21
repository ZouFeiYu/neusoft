package org.gdpi.neusoft.bean;

import java.io.Serializable;

public class Category implements Serializable{
	private static final long serialVersionUID = 1L;
	private Integer id;//id
	private String name;//name
	private Integer orders;//orders
	private Integer parentId;//parent_id
	private int status;//state
	private Author author;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getOrders() {
		return orders;
	}
	public void setOrders(Integer orders) {
		this.orders = orders;
	}
	public Integer getParentId() {
		return parentId;
	}
	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public Author getAuthor() {
		return author;
	}
	public void setAuthor(Author author) {
		this.author = author;
	}
	@Override
	public String toString() {
		return "Category [id=" + id + ", name=" + name + ", orders=" + orders + ", parentId=" + parentId + ", status="
				+ status + ", author=" + author + "]";
	}


	
}
