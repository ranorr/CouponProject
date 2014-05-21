package il.ac.hit;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ShoppingCart implements Serializable {

	private static final long serialVersionUID = 1L;
	private List<Coupon> userCoupons;
	private Date deadLine;
	private Date currectDate;

	// private SimpleDateFormat dateFormatUCT;
	// private String deadline;

	public ShoppingCart() {
		super();
		this.userCoupons = new ArrayList<Coupon>();
	}
/**
 * 
 * @param userCoupons	-	list of coupons purchased by user
 */
	public ShoppingCart(List<Coupon> userCoupons) {
		super();
		this.userCoupons = userCoupons;
	}

	public List<Coupon> getUserCoupons() {
		// this.userCoupons.CheckDate;
		return userCoupons;
	}

	public void setUserCoupons(List<Coupon> userCoupons) {
		this.userCoupons = userCoupons;
	}
	/**
	 * adding Coupons to cart
	 * @param coupon	-	coupon user want to purchase
	 * @return
	 */
	public boolean addCouponToCart(Coupon coupon) {
		this.userCoupons.add(coupon);
		/*
		 * this.dateFormatUCT = new SimpleDateFormat("dd-MM-yyyy HH:mm");
		 * this.deadline = dateFormatUCT.format(new Date()); try { this.dateLeft
		 * = dateFormatUCT.parse(deadline); } catch (ParseException e) { // TODO
		 * Auto-generated catch block e.printStackTrace(); }
		 */
		this.currectDate = new Date();
		final long hours = 60L * 60L * 1000L;
		this.deadLine = new Date(this.currectDate.getTime() + (1l * hours)/20);
		return true;
	}

	public int getSize() {
		return this.userCoupons.size();
	}

	public String toString(int i) {

		return ((Coupon) userCoupons.get(i)).toString() + ", Experation time = "
				+ this.deadLine.toString();
	}
/**
 * printing coupons from cart
 * @param i
 * @throws CouponExceptionPlatrform
 */
	public void printCouponsFromCart(int i) throws CouponExceptionPlatrform {
		System.out.println(this.userCoupons.get(i));

	}
/**
 * getting coupon from cart by ID
 * @param index
 * @return
 */
	public int getCouponID(int index) {
		return ((Coupon) userCoupons.get(index)).getId();
	}
/**
 * delete coupon from cart
 * @param id	-	id of Coupon we want to delete
 */
	public void delCouponFromCart(int id) {
		for (int i = 0; i < this.userCoupons.size(); i++) {
			if (((Coupon) userCoupons.get(i)).getId() == id) {
				userCoupons.remove(i);
			}
		}
	}
/**
 * checking if the deadline does not passed
 */
	public void CheckDate() {
		for (int i = 0; i < this.userCoupons.size(); i++) {
			currectDate = new Date();
			if (currectDate.after(deadLine)) {
				userCoupons.remove(i);
			}
		}
	}	
	/**
	 * getting the name of Coupon Image by getting ID
	 * @param id
	 * @return
	 */
	public String getCouponImage(int id) {
		return userCoupons.get(id).getImage();
	}

}
