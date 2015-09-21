package com.auratecnologica.appSession;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.hql.ast.util.SessionFactoryHelper;
import org.hibernate.impl.SessionFactoryImpl;
import org.hibernate.impl.SessionFactoryObjectFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;



public class UsuarioController {

	final static Logger logger= LoggerFactory.getLogger(UsuarioController.class);
	
	public static Usuario login(String login, String password){
		
		
		SessionFactory session = new AnnotationConfiguration().configure().buildSessionFactory();
		Session sesion=session.openSession();
		Transaction tx = sesion.beginTransaction();
		try{
		
		String hql="select u from Usuario u";
		Query q = sesion.createQuery(hql);
		
		List<Usuario> usuarios=q.list();
		tx.commit();
		for(Usuario usuario: usuarios){
			if(usuario.getLogin().equals(login) && usuario.getPassword().equals(password)){
				return usuario;
			}
		}
		}catch(Exception e){
			tx.rollback();
		}
		
		return null;
	}
}
