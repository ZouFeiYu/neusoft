package org.gdpi.neusoft.bean;

import java.io.Serializable;
import java.util.Date;

public class Author implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer createdUser;//creater_id
	private Date createdTime;//creater_date
	private Integer modifyUser;//modify_id
	private Date modifyTime;//modify_date
	public Integer getCreatedUser() {
		return createdUser;
	}
	public void setCreatedUser(Integer createdUser) {
		this.createdUser = createdUser;
	}
	public Date getCreatedTime() {
		return createdTime;
	}
	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}
	public Integer getModifyUser() {
		return modifyUser;
	}
	public void setModifyUser(Integer modifyUser) {
		this.modifyUser = modifyUser;
	}
	public Date getModifyTime() {
		return modifyTime;
	}
	public void setModifyTime(Date modifyTime) {
		this.modifyTime = modifyTime;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Author [createdUser=" + createdUser + ", createdTime=" + createdTime + ", modifyUser=" + modifyUser
				+ ", modifyTime=" + modifyTime + "]";
	}
}
