package il.ac.hit;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name="coupontable")
public class Coupon
{
	
	@Column(name="image")
	private String image;
	@Id
	@Column(name="id")
	private int id;
	@Column(name="detailes")
	private String detail;
	@ManyToOne
	@JoinColumn(name="business_id", nullable=false)
	private Business business;
	@ManyToOne
	@JoinColumn(name="category", nullable=false)
	private Category category;
	
	
	public Coupon() 
	{
		super();
	}
	/**
	 * 
	 * @param id - Primary Key of Coupon Table
	 * @param business - Primary Key of Business Table	
	 * @param image - name of an image that shows the coupon
	 * @param detail - details about the coupon
	 * @param cat - Category of coupon
	 */
	public Coupon(int id, Business business, String image, String detail, Category cat) 
	{
		this.id = id;
		this.business = business;
		this.image = image;
		this.detail = detail;
		this.category = cat;
		
	}
	@ManyToOne
	public Category getCategory() {
		return category;
	}
	@ManyToOne
	public void setCategory(Category category) {
		this.category = category;
	}
	@ManyToOne
	public Business getBusiness() {
		return business;
	}
	@ManyToOne
	public void setBusiness(Business business) {
		this.business = business;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	@Id
	public int getId() {
		return id;
	}
	@Id
	public void setId(int id) {
		this.id = id;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	@Override
	public String toString() {
		return "Coupon [business=" + business.getName() + ", coupon id="
				+ id + ", detail=" + detail + ", category=" + category.getCategoryName() + "]";
	}
}	