package com.sourav.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.sourav.entities.Category;
import com.sourav.entities.Product;

public class ProductDao {

	private SessionFactory factory;

	public ProductDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}
	
	public boolean saveProduct(Product product)
	{
		boolean f=false;
		
		try {
			Session session = this.factory.openSession();
			Transaction tx = session.beginTransaction();
			session.save(product);
			tx.commit();
			session.close();
			f=true;
		}
		catch (Exception e) {
			e.printStackTrace();
			f=false;
		}
		return f;
		
		
	}
	
	//get all products
	public List<Product> getAllProducts()
	{
		Session session = this.factory.openSession();
		Query q = session.createQuery("from Product");
		List<Product> products = q.list();
		return products; 
	}
	
	public List<Product> getAllProductsById(int cid)
	{
		Session session = this.factory.openSession();
		Query q = session.createQuery("from Product as p where p.category.categoryId =: id");
		q.setParameter("id", cid);
		List<Product> products = q.list();
		return products;
	}

}
