package com.sourav.dao;


import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.sourav.entities.Category;

public class CategoryDao {

	private SessionFactory factory;

	public CategoryDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}
	
	public int saveCategory(Category category)
	{
		Session session = this.factory.openSession();
		Transaction tx = session.beginTransaction();
		int catId = (int)session.save(category);
		tx.commit();
		session.close();
		return catId;
	}
	
	public List<Category> getAllCategories()
	{
		Session session = this.factory.openSession();
		Query query = session.createQuery("from Category");
		List<Category> catList = query.list();
		return catList;
	}
	
	public Category getCategoryById(int catId)
	{
		Category cat=null;
		try {
			Session session = this.factory.openSession();
			cat = session.get(Category.class,catId);
			session.close();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return cat;
	}
}
