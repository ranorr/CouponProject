package il.ac.hit;

import java.util.Iterator;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

public class CategoryHibernate implements ICategoryDAO {

	private static CategoryHibernate categoryHibernate = null;
	SessionFactory factory;

	/**
	 * singelton Design pattern
	 * 
	 * @return coupoHibernate
	 */
	public static CategoryHibernate getCategoryHibernate() {
		if (categoryHibernate == null) {
			categoryHibernate = new CategoryHibernate();
		}
		return categoryHibernate;
	}

	/**
	 * returning specific Category by name
	 */
	@Override
	public Category getCategory(String wantedCategoryName)
			throws CategoryExceptionPlatrform {
		Category category = null;
		Session session = null;
		try {
			factory = new AnnotationConfiguration().configure()
					.buildSessionFactory();
			session = factory.openSession();
			session.beginTransaction();
			category = (Category) session.get(Category.class,
					wantedCategoryName);
			session.getTransaction().commit();
			return category;
		} catch (HibernateException e) {
			if (session != null) {
				session.getTransaction().rollback();
			}
			throw new CategoryExceptionPlatrform(
					"HibernateException - Cant get Category", e);
		} finally {
			if (session != null) {
				session.close();
			}
		}
	}

	/**
	 * returning Iterator of all Category
	 */
	@Override
	public Iterator<Category> getAllCategorys()
			throws CategoryExceptionPlatrform {
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
			List<Category> category = session.createQuery("from Category")
					.list();
			session.close();
			return category.iterator();
		} catch (HibernateException e) {
			if (session != null) {
				session.getTransaction().rollback();
			}
			throw new CategoryExceptionPlatrform(
					"HibernateException - Cant Get list of Category", e);
		} 
	}

	/**
	 * adding new Category
	 */
	@Override
	public boolean addCategory(Category ob) throws CategoryExceptionPlatrform {
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
			throw new CategoryExceptionPlatrform(
					"HibernateException - Cant add Category", e);
		} finally {
			if (session != null) {
				session.close();
			}
		}
	}

	/**
	 * function check if some category already exists
	 */
	public boolean CheckIfExist(String category_name)
			throws CategoryExceptionPlatrform {
		boolean exist = false;
		Session session = null;
		try {
			factory = new AnnotationConfiguration().configure()
					.buildSessionFactory();
			// creating a new session for adding
			session = factory.openSession();
			session.beginTransaction();
			session.getTransaction().commit();
			if (session.get(Category.class, category_name) != null) {
				exist = true;
			}
			return exist;
		} catch (HibernateException e) {
			if (session != null) {
				session.getTransaction().rollback();
			}
			throw new CategoryExceptionPlatrform(
					"HibernateException - Cant check if Category Exist", e);
		} finally {
			if (session != null) {
				session.close();
			}
		}
	}
}
