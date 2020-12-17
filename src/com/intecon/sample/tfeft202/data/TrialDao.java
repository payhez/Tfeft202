package com.intecon.sample.tfeft202.data;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.intecon.sample.tfeft202.model.Tfeft202;

public class TrialDao {
	
	SessionFactory factory = new Configuration()
								.configure()
								.addAnnotatedClass(Tfeft202.class)
								.buildSessionFactory();
	
	Session session = factory.getCurrentSession();
	
	
	public List<Tfeft202> fetch() {
		
		List<Tfeft202> objectList = new ArrayList<>();
		try {
			session.beginTransaction();
			objectList = session.createQuery("from Tfeft202").getResultList();
			session.getTransaction().commit();
		}catch (Exception e) {
			System.out.println(e);
			return null;
		}finally {
			factory.close();
		}
		
		return objectList;
	}
	
	public boolean update(Tfeft202 theObject) {
		
		try {
			session.beginTransaction();
			Tfeft202 updatedObject = session.get(Tfeft202.class, theObject.getId());
			updatedObject.setComp(theObject.getComp());
			updatedObject.setGtibCode(theObject.getGtibCode());
			updatedObject.setItemCode(theObject.getItemCode());
			updatedObject.setUpd_usr(theObject.getUpd_usr());
			updatedObject.setUpd_tst(theObject.getUpd_tst());
			session.getTransaction().commit();
			
		}catch (Exception e) {
			System.out.println(e);
			return false;
		}finally {
			factory.close();
		}
		
		return true;
	}
	public boolean delete(Tfeft202 theObject) {
		
		try {
			session.beginTransaction();
			theObject = session.get(Tfeft202.class, theObject.getId());
			session.delete(theObject);
			session.getTransaction().commit();
			
		}catch (Exception e) {
			System.out.println(e);
			return false;
		}finally {
			factory.close();
		}
		
		return true;
	}
	
	public boolean insert(Tfeft202 theObject) {
		
		try {
			session.beginTransaction();
			session.save(theObject);
			session.getTransaction().commit();
			
		}catch(Exception e){
			System.out.println(e);
			return false;
		}finally {
			factory.close();
		}
		
		return true;
	}
	
}
