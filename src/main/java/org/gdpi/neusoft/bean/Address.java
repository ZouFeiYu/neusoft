package org.gdpi.neusoft.bean;

/**
 * @author montreal
 *	地址实体类
 */
public class Address {
	private  Integer id;	//id
	private Integer userId;	//用户id
	private String recName; //收件人姓名	
	private String province; //省份
	private String city; //城市
	private String area; //地区
	private String town; //城镇
	private String detail; //详细地址
	private String recAddress;	//收件地址
	private String phone;	//手机号码
	private String telphone;	//电话号码
	private Integer recDefault; //默认地址
	private Author author;	//改动人
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getRecName() {
		return recName;
	}
	public void setRecName(String recName) {
		this.recName = recName;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getTown() {
		return town;
	}
	public void setTown(String town) {
		this.town = town;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getRecAddress() {
		return recAddress;
	}
	public void setRecAddress(String recAddress) {
		this.recAddress = recAddress;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getTelphone() {
		return telphone;
	}
	public void setTelphone(String telphone) {
		this.telphone = telphone;
	}
	
	public Integer getRecDefault() {
		return recDefault;
	}
	public void setRecDefault(Integer recDefault) {
		this.recDefault = recDefault;
	}
	public Author getAuthor() {
		return author;
	}
	public void setAuthor(Author author) {
		this.author = author;
	}
	
	@Override
	public String toString() {
		return "Address [id=" + id + ", userId=" + userId + ", recName=" + recName + ", province=" + province
				+ ", city=" + city + ", area=" + area + ", town=" + town + ", detail=" + detail + ", recAddress="
				+ recAddress + ", phone=" + phone + ", telphone=" + telphone + ", recDefault=" + recDefault
				+ ", author=" + author + "]";
	}
	
}
