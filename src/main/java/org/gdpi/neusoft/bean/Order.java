package org.gdpi.neusoft.bean;

import java.io.Serializable;
import java.util.List;

public class Order implements Serializable{
	private static final long serialVersionUID = 1L;
	private String id;//id
	private Integer userId;//user_id
	private String consignee;//consignee
	private String address;//address
	private String phone;//phone
	private Integer state;//state
	private List<Good> goods;
 	private Author author;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getConsignee() {
		return consignee;
	}
	public void setConsignee(String consignee) {
		this.consignee = consignee;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public List<Good> getGoods() {
		return goods;
	}
	public void setGoods(List<Good> goods) {
		this.goods = goods;
	}
	public Author getAuthor() {
		return author;
	}
	public void setAuthor(Author author) {
		this.author = author;
	}
	@Override
	public String toString() {
		return "Order [id=" + id + ", userId=" + userId + ", consignee=" + consignee + ", address=" + address
				+ ", phone=" + phone + ", state=" + state + ", goods=" + goods + ", author=" + author + "]";
	}

}
