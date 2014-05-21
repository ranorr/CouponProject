package il.ac.hit;

import java.util.Iterator;

public interface ICategoryDAO {

	public abstract Category getCategory(String wantedCategoryName)
			throws CategoryExceptionPlatrform;

	/**
	 * get list of coupon by using iterator
	 * 
	 * @throws CouponExceptionPlatrform
	 */
	public abstract Iterator<Category> getAllCategorys()
			throws CategoryExceptionPlatrform;

	/**
	 * delete coupon by give a ID from the sql table
	 * 
	 * @throws CouponExceptionPlatrform
	 */

	public abstract boolean addCategory(Category ob)
			throws CategoryExceptionPlatrform;

	public boolean CheckIfExist(String category_name)
			throws CategoryExceptionPlatrform;
}
