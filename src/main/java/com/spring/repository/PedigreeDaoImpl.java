package com.spring.repository;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Locale;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.annotations.FetchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.dao.PedigreeDao;
import com.spring.model.Bank;
import com.spring.model.Pedigree;
import com.spring.model.SearchDate;

@Repository
public class PedigreeDaoImpl implements PedigreeDao {
	@Autowired  //มันจะค้นหา auto ใน .xml
	private SessionFactory session;
	
	@Override
	public void add(Pedigree pedigree) {
		session.getCurrentSession().save(pedigree);
	}

	@Override
	public void edit(Pedigree pedigree) {
		session.getCurrentSession().update(pedigree);
	}

	@Override
	public void delete(int pedigreeId) {		
		session.getCurrentSession().delete(getPedigree(pedigreeId));
	}

	@Override
	public Pedigree getPedigree(int pedigreeId) {
		return (Pedigree)session.getCurrentSession().get(Pedigree.class, pedigreeId);
	}

	
	/*ค้นหาในหน้า Search*/
	@Override
	public List getAllPedigree(Pedigree pedigree) {
		Criteria criteria = session.getCurrentSession().createCriteria(Pedigree.class);
        if(pedigree.getCName() != null){
			if(pedigree.getCName() != "" && pedigree.getCName() != null)
				criteria.add(Restrictions.like("CName", "%"+pedigree.getCName()+"%"));
		} if(pedigree.getPrivateNo() != null){
			if(pedigree.getPrivateNo() != "" && pedigree.getPrivateNo() != null)
				criteria.add(Restrictions.like("privateNo", "%"+pedigree.getPrivateNo()+"%"));
		} if(pedigree.getSex() != null){
			if(pedigree.getSex()!= "" && pedigree.getSex() != null)
				criteria.add(Restrictions.like("sex", "%"+pedigree.getSex()+"%"));
		} if(pedigree.getOwnerName()!= null){
			if(pedigree.getOwnerName() != "" && pedigree.getOwnerName() != null)
				criteria.add(Restrictions.like("ownerName", "%"+pedigree.getOwnerName()+"%"));
		}
		
		return  criteria.list();
	}

	@Override
	public List getAllPedigree() {
		// TODO Auto-generated method stub
		return session.getCurrentSession().createQuery("from Pedigree").list();
	}

	/*ค้นหาในหน้าแสดงรายละเอียด*/
	@Override
	public List getAllPedigreeSh(SearchDate searchDate) {
		Criteria criteria = session.getCurrentSession().createCriteria(Pedigree.class);
       
		if(searchDate.getDate1() != null && searchDate.getDate2() != null  ){
				criteria.add(Restrictions.between("dateDelivery", searchDate.getDate1() , searchDate.getDate2()));
		}
		
		return  criteria.list();
	}
	


	


}
