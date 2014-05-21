package il.ac.hit;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="category")
public class Category {
	
	@Id
	@Column(name="category")
	private String categoryName;

	public Category() {
		super();
		// TODO Auto-generated constructor stub
	}
/**
 * 
 * @param categoryName - the name of the Category we want to create
 */
	public Category(String categoryName) {
		super();
		this.categoryName = categoryName;
	}
	
	@Override
	public String toString() {
		return "Category [categoryName=" + categoryName + "]";
	}

	@Id
	public String getCategoryName() {
		return categoryName;
	}

	@Id
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	
	

}
