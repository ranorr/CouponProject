package il.ac.hit;

import java.util.Iterator;

public interface IBusinessDao {

	public abstract Business getBusiness(int id) throws BusinessExceptionPlatrform;

	public abstract boolean updateBusiness(Business ob)
			throws BusinessExceptionPlatrform;

	/**
	 * get list of coupon by using iterator
	 * @throws CouponExceptionPlatrform 
	 */
	public abstract Iterator<Business> getBusiness(int from, int numberOfBusiness)
			throws BusinessExceptionPlatrform;

	/**
	 * delete coupon by give a ID from the sql table
	 * @throws CouponExceptionPlatrform 
	 */
	public abstract boolean deleteBusiness(int id)
			throws BusinessExceptionPlatrform;

	public abstract boolean addBusiness(Business ob)
			throws BusinessExceptionPlatrform;
	public abstract int nextIDNumber() 
			throws BusinessExceptionPlatrform;
}
