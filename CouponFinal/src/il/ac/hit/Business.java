package il.ac.hit;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="business")
public class Business {
	
	@Id
	@Column(name="business_id")
	private int business_id;
	@Column(name="business_name")
	private String name;
	@Column(name="business_adress")
	private String adress;
	
	public Business() 
	{
		super();
	}
	
	/**
	 * 
	 * @param business_id - primary key of Business table	
	 * @param name - name of the Business
	 * @param adress - adress of the Business
	 */
	public Business(int business_id, String name, String adress) {
		super();
		this.business_id = business_id;
		this.name = name;
		this.adress = adress;
	}

	@Id
	public int getBusiness_id() {
		return business_id;
	}

	@Id
	public void setBusiness_id(int business_id) {
		this.business_id = business_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAdress() {
		return adress;
	}

	public void setAdress(String adress) {
		this.adress = adress;
	}

	@Override
	public String toString() {
		return "Business [business_id=" + business_id + ", name=" + name
				+ ", adress=" + adress + "]";
	}

	
	
}
