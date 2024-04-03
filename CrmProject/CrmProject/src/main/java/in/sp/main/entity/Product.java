package in.sp.main.entity;

import org.springframework.web.multipart.MultipartFile;

import in.sp.main.urls.OtherUrls;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "product")
public class Product 
{
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@Column(name = "course_name")
	private String coursename;
	
	@Column(name = "syllabus")
	private String syllabus;
	
	@Column(name = "original_price")
	private String originalprice;
	
	@Column(name = "discounted_price")
	private String discountedprice;
	
	@Column(name = "course_validity")
	private String coursevalidity;
	
	@Column(name = "course_img_url")
	private String courseimage;
	
	@Column(name = "trainers_name")
	private String trainersname;
	
	@Column(name = "trainers_details")
	private String trainersdetails;
	
	@Column(name = "trainers_img_url")
	private String trainersimage;
	
	@Column(name = "other_details")
	private String otherdetails;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCoursename() {
		return coursename;
	}
	public void setCoursename(String coursename) {
		this.coursename = coursename;
	}
	public String getSyllabus() {
		return syllabus;
	}
	public void setSyllabus(String syllabus) {
		this.syllabus = syllabus;
	}
	public String getOriginalprice() {
		return originalprice;
	}
	public void setOriginalprice(String originalprice) {
		this.originalprice = originalprice;
	}
	public String getDiscountedprice() {
		return discountedprice;
	}
	public void setDiscountedprice(String discountedprice) {
		this.discountedprice = discountedprice;
	}
	public String getCoursevalidity() {
		return coursevalidity;
	}
	public void setCoursevalidity(String coursevalidity) {
		this.coursevalidity = coursevalidity;
	}
	public String getCourseimage() {
		return courseimage;
	}
	public void setCourseimage(MultipartFile file) {
		this.courseimage = OtherUrls.IMAGE_UPLOAD_URL + file.getOriginalFilename();
	}
	public String getTrainersname() {
		return trainersname;
	}
	public void setTrainersname(String trainersname) {
		this.trainersname = trainersname;
	}
	public String getTrainersdetails() {
		return trainersdetails;
	}
	public void setTrainersdetails(String trainersdetails) {
		this.trainersdetails = trainersdetails;
	}
	public String getTrainersimage() {
		return trainersimage;
	}
	public void setTrainersimage(MultipartFile file) {
		this.trainersimage = OtherUrls.IMAGE_UPLOAD_URL + file.getOriginalFilename();
	}
	public String getOtherdetails() {
		return otherdetails;
	}
	public void setOtherdetails(String otherdetails) {
		this.otherdetails = otherdetails;
	}
}
