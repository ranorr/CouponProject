package il.ac.hit;

import java.util.Iterator;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

public class BusinessHibernate implements IBusinessDao {

	private static BusinessHibernate businessHibernate = null;
	SessionFactory factory;

	public static BusinessHibernate getBusinessHibernate() {
		if (businessHibernate == null) {
			businessHibernate = new BusinessHibernate();
		}
		return businessHibernate;
	}

	/**
	 * Getting Business by ID
	 */
	@Override
	public Business getBusiness(int id) throws BusinessExceptionPlatrform {
		Business business = null;
		Session session = null;
		try {
			factory = new AnnotationConfiguration().configure()
					.buildSessionFactory();
			session = factory.openSession();
			session.beginTransaction();
			business = (Business) session.get(Business.class, id);
			session.getTransaction().commit();
			return business;
		} catch (HibernateException e) {
			if (session != null) {
				session.getTransaction().rollback();
			}
			throw new BusinessExceptionPlatrform(
					"HibernateException - Cant get business", e);
		} finally {
			if (session != null) {
				session.close();
			}
		}
	}

	/**
	 * Updating Business
	 */
	@Override
	public boolean updateBusiness(Business ob)
			throws BusinessExceptionPlatrform {
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

			throw new BusinessExceptionPlatrform(
					"HibernateException - Cant update Business", e);
		} finally {
			if (session != null) {
				session.close();
			}
		}
	}

	/**
	 * getting Iterator of businesses
	 */
	@Override
	public Iterator<Business> getBusiness(int from, int numberOfBusiness)
			throws BusinessExceptionPlatrform {
		Session session = null;

		try {
			factory = new AnnotationConfiguration().configure()
					.buildSessionFactory();
			// creating a new session for adding products
			session = factory.openSession();
			session.beginTransaction();
			session.getTransaction().commit();
			if (session.getTransaction().wasCommitted()) {
				System.out.println();
			}
			@SuppressWarnings("unchecked")
			List<Business> business = session.createQuery(
					"from Business where business_id >=" + from
							+ "AND business_id <= " + numberOfBusiness).list();
			session.close();
			return business.iterator();
		} catch (HibernateException e) {
			if (session != null) {
				session.getTransaction().rollback();
			}
			throw new BusinessExceptionPlatrform(
					"HibernateException - Cant get Busines from list", e);
		}

	}

	/**
	 * delete Business by id
	 */
	@Override
	public boolean deleteBusiness(int id) throws BusinessExceptionPlatrform {
		Session session = null;
		try {
			factory = new AnnotationConfiguration().configure()
					.buildSessionFactory();
			// creating a new session for adding products
			session = factory.openSession();
			session.beginTransaction();
			session.delete(getBusiness(id));
			session.getTransaction().commit();
			// session.close();
		}

		catch (HibernateException e) {
			if (session != null) {
				session.getTransaction().rollback();
			}
			throw new BusinessExceptionPlatrform(
					"HibernateException - Cant Delet Business", e);
		} finally {
			if (session != null) {
				session.close();
			}
		}

		return true;
	}

	/**
	 * Adding new Business
	 */
	@Override
	public boolean addBusiness(Business ob) throws BusinessExceptionPlatrform {
		// TODO Auto-generated method stub
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
			throw new BusinessExceptionPlatrform(
					"HibernateException - Cant add Business", e);
		} finally {
			if (session != null) {
				session.close();
			}
		}
	}

	/**
	 * returning the next id num that should be created
	 */
	@Override
	public int nextIDNumber() throws BusinessExceptionPlatrform {
		Session session = null;
		try {
			factory = new AnnotationConfiguration().configure()
					.buildSessionFactory();
			session = factory.openSession();
			session.beginTransaction();
			session.getTransaction().commit();
			@SuppressWarnings("unchecked")
			List<Business> business = session.createQuery(
					"from Business where id >=" + 0 + "AND id <= " + 1000)
					.list();

			Iterator<Business> i = business.iterator();
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
			throw new BusinessExceptionPlatrform(
					"HibernateException - Cant get the next Id number ", e);
		}

	}
}
