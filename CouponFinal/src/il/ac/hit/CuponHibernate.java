package il.ac.hit;

import java.util.List;
import java.util.Iterator;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

/**
 * in this class we can find num of methos that use Hibernate and use singelton
 * Design pattern
 */
public class CuponHibernate implements ICouponsDAO {

	private static CuponHibernate coupoHibernate = null;
	SessionFactory factory;

	/**
	 * singelton Design pattern
	 * 
	 * @return coupoHibernate
	 */
	public static CuponHibernate getCouponsHibernate() {
		if (coupoHibernate == null) {
			coupoHibernate = new CuponHibernate();
		}
		return coupoHibernate;
	}

	/**
	 * getting Coupon by ID
	 */
	@Override
	public Coupon getCoupon(int id) throws CouponExceptionPlatrform {
		Coupon coupon = null;
		Session session = null;
		try {
			factory = new AnnotationConfiguration().configure()
					.buildSessionFactory();
			session = factory.openSession();
			session.beginTransaction();
			coupon = (Coupon) session.get(Coupon.class, id);
			session.getTransaction().commit();
			return coupon;
		} catch (HibernateException e) {
			if (session != null) {
				session.getTransaction().rollback();
			}
			throw new CouponExceptionPlatrform(
					"HibernateException - Cant get Coupon", e);
		} finally {
			if (session != null) {
				session.close();
			}
		}
	}

	/**
	 * Getting specific Coupon from List of Coupons
	 */
	public Coupon getCouponFromList(Iterator<Coupon> iterator)
			throws CouponExceptionPlatrform {
		Coupon coupon = null;
		Session session = null;
		try {
			factory = new AnnotationConfiguration().configure()
					.buildSessionFactory();
			session = factory.openSession();
			session.beginTransaction();
			coupon = (Coupon) session
					.get(Coupon.class, iterator.next().getId());
			session.getTransaction().commit();
			return coupon;
		} catch (HibernateException e) {
			if (session != null) {
				session.getTransaction().rollback();
			}
			throw new CouponExceptionPlatrform(
					"HibernateException - Cant get Coupon from List", e);
		} finally {
			if (session != null) {
				session.close();
			}
		}
	}

	/**
	 * Adding Coupon to Database
	 */
	@Override
	public boolean addCoupon(Coupon ob) throws CouponExceptionPlatrform {
		Session session = null;
		try {
			factory = new AnnotationConfiguration().configure()
					.buildSessionFactory();
			// creating a new session for adding
			session = factory.openSession();
			session.beginTransaction();
			session.save(ob);
			session.getTransaction().commit();
			return true;
		} catch (HibernateException e) {
			if (session != null) {
				session.getTransaction().rollback();
			}
			throw new CouponExceptionPlatrform(
					"HibernateException - Cant add Coupon", e);
		} finally {
			if (session != null) {
				session.close();
			}
		}
	}

	/**
	 * Update Coupon to database
	 */
	@Override
	public boolean updateCoupon(Coupon ob) throws CouponExceptionPlatrform {
		Session session = null;
		try {
			factory = new AnnotationConfiguration().configure()
					.buildSessionFactory();
			// creating a new session for adding products
			session = factory.openSession();
			session.beginTransaction();
			session.update(ob);
			session.getTransaction().commit();
			return true;
		} catch (HibernateException e) {
			if (session != null) {
				session.getTransaction().rollback();
			}

			throw new CouponExceptionPlatrform(
					"HibernateException - Cant update Coupon", e);
		} finally {
			if (session != null) {
				session.close();
			}
		}
	}

	/**
	 * Getting Coupon from List
	 */
	@Override
	public Iterator<Coupon> getCoupons(int from, int numberOfCoupons)
			throws CouponExceptionPlatrform {
		Session session = null;

		try {
			factory = new AnnotationConfiguration().configure()
					.buildSessionFactory();
			// creating a new session for adding products
			session = factory.openSession();
			session.beginTransaction();
			session.getTransaction().commit();
			@SuppressWarnings("unchecked")
			List<Coupon> coupons = session.createQuery(
					"from Coupon where id >=" + from + "AND id <= "
							+ numberOfCoupons).list();

			Iterator<Coupon> i = coupons.iterator();

			while (i.hasNext()) {
				System.out.println(i.next());
			}
			session.close();
			return coupons.iterator();
		} catch (HibernateException e) {
			if (session != null) {
				session.getTransaction().rollback();
			}
			throw new CouponExceptionPlatrform(
					"HibernateException - Cant get Coupon from List", e);
		}
	}

	/**
	 * Deleting Coupon
	 */
	@Override
	public boolean deleteCoupon(int id) throws CouponExceptionPlatrform {
		Session session = null;
		try {
			factory = new AnnotationConfiguration().configure()
					.buildSessionFactory();
			// creating a new session for adding products
			session = factory.openSession();
			session.beginTransaction();
			session.delete(getCoupon(id));
			session.getTransaction().commit();
			// session.close();
		}

		catch (HibernateException e) {
			if (session != null) {
				session.getTransaction().rollback();
			}
			throw new CouponExceptionPlatrform(
					"HibernateException - Cant delete Coupon", e);
		} finally {
			if (session != null) {
				session.close();
			}
		}

		return true;
	}

	/**
	 * getting the next Id number available - help us creating new coupon
	 */
	public int nextIDNumber() throws CouponExceptionPlatrform {
		Session session = null;
		try {
			factory = new AnnotationConfiguration().configure()
					.buildSessionFactory();
			session = factory.openSession();
			session.beginTransaction();
			session.getTransaction().commit();
			@SuppressWarnings("unchecked")
			List<Coupon> coupons = session.createQuery(
					"from Coupon where id >=" + 0 + "AND id <= " + 1000).list();

			Iterator<Coupon> i = coupons.iterator();
			int num = 1;

			while (i.hasNext()) {
				System.out.println(i.next());
				num++;
			}
			session.close();
			return num;

		} catch (HibernateException e) {
			if (session != null) {
				session.getTransaction().rollback();
			}
			throw new CouponExceptionPlatrform(
					"HibernateException - Cant get next Coupon ID number", e);
		}
	}
	
	public boolean isNumeric(String str)  
	{  
	  try  
	  {  
	    @SuppressWarnings("unused")
		int num = Integer.parseInt(str); 
	  }  
	  catch(NumberFormatException nfe)  
	  {  
	    return false;  
	  }  
	  return true;  
	}
}
