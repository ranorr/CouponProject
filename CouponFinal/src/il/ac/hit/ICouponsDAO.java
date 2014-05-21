package il.ac.hit;

import java.util.Iterator;

public interface ICouponsDAO {
	public abstract Coupon getCoupon(int id) throws CouponExceptionPlatrform;

	public abstract boolean updateCoupon(Coupon ob)
			throws CouponExceptionPlatrform;

	/**
	 * get list of coupon by using iterator
	 * @throws CouponExceptionPlatrform 
	 */
	public abstract Iterator<Coupon> getCoupons(int from, int numberOfCoupons)
			throws CouponExceptionPlatrform;

	/**
	 * delete coupon by give a ID from the sql table
	 * @throws CouponExceptionPlatrform 
	 */
	public abstract boolean deleteCoupon(int id)
			throws CouponExceptionPlatrform;

	public abstract boolean addCoupon(Coupon ob)
			throws CouponExceptionPlatrform;
	public abstract int nextIDNumber() 
			throws CouponExceptionPlatrform;
	public abstract Coupon getCouponFromList(Iterator<Coupon> iterator)
			throws CouponExceptionPlatrform;
	public abstract boolean isNumeric(String str)
			throws CouponExceptionPlatrform;;
}