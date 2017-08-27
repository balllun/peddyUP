package com.spring.repository;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.dao.ReportDao;
import com.spring.model.Bank;
import com.spring.model.Pedigree;
import com.spring.model.Report;
import com.spring.model.SearchDate;

@Repository
public class ReportDaoImpl implements ReportDao {
	@Autowired  //มันจะค้นหา auto ใน .xml
	private SessionFactory session;
	
	@Override
	public void add(Report report) {
		session.getCurrentSession().save(report);
	}

	@Override
	public void edit(Report report) {
		session.getCurrentSession().update(report);
	}

	@Override
	public void delete(int reportId) {		
		session.getCurrentSession().delete(getReport(reportId));
	}

	@Override
	public Report getReport(int reportId) {
		return (Report)session.getCurrentSession().get(Report.class, reportId);
	}

	@Override
	public List getAllReport() {
		return session.getCurrentSession().createQuery("from Report").list();
	}
	
	/*ค้นหาในหน้าแสดงรายละเอียด*/
	@Override
	public List getAllReportSh(SearchDate searchDate) {
		Criteria criteria = session.getCurrentSession().createCriteria(Report.class);
       
		if(searchDate.getDate1() != null && searchDate.getDate2() != null  ){
				criteria.add(Restrictions.between("date", searchDate.getDate1() , searchDate.getDate2()));
		}
		
		return  criteria.list();
	}

	

}
