package org.java.pojo;
import java.sql.Timestamp;
/**
 * 为自己脱单
 * @author DELL
 *
 */
public class Biaobai4 extends BiaobaiBase{
	private String name;//姓名
	private String gender;//年级
	private String department;//学院
	private String grade;//年级
	private String contact;//联系方式
	private String character;//性格描述
	private String address;//家庭住址
	private String favoredType;//喜欢的类型
	private String preference;//个人爱好
	private String photo;//照片

	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getCharacter() {
		return character;
	}
	public void setCharacter(String character) {
		this.character = character;
	}
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getFavoredType() {
		return favoredType;
	}
	public void setFavoredType(String favoredType) {
		this.favoredType = favoredType;
	}
	
	public String getPreference() {
		return preference;
	}
	public void setPreference(String preference) {
		this.preference = preference;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}

}
