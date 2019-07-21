package org.gdpi.neusoft.bean;

import java.io.Serializable;

public class User implements Serializable{
	private static final long serialVersionUID = 1L;
	private Integer id;//id
	private String nickName;//nick_name
	private String password;//passwrod
	private String passTip;//pass_tip
	private String passTipKey;//pass_tip_key
	private String name;//name
	private String IdCard;//IDcard
	private String email;//email
	private String phone;//phone
	private Integer type;//type
	private String power;//power
	private Integer state;//state
	private Author author;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPassTip() {
		return passTip;
	}
	public void setPassTip(String passTip) {
		this.passTip = passTip;
	}
	public String getPassTipKey() {
		return passTipKey;
	}
	public void setPassTipKey(String passTipKey) {
		this.passTipKey = passTipKey;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getIdCard() {
		return IdCard;
	}
	public void setIdCard(String idCard) {
		IdCard = idCard;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public String getPower() {
		return power;
	}
	public void setPower(String power) {
		this.power = power;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
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
		return "User [id=" + id + ", nickName=" + nickName + ", password=" + password + ", passTip=" + passTip
				+ ", passTipKey=" + passTipKey + ", name=" + name + ", IdCard=" + IdCard + ", email=" + email
				+ ", phone=" + phone + ", type=" + type + ", power=" + power + ", state=" + state + ", author=" + author
				+ "]";
	}
}