package com.spring.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.dao.ReportDao;
import com.spring.model.Report;
import com.spring.model.SearchDate;
import com.spring.service.ReportService;
@Service
public class ReportServiceImpl implements ReportService {
	@Autowired
	private ReportDao reportDao;
	
	@Transactional
	public void add(Report report) {
		reportDao.add(report);
	}

	@Transactional
	public void edit(Report report) {
		reportDao.edit(report);
	}

	@Transactional
	public void delete(int reportId) {
		reportDao.delete(reportId);
	}

	@Transactional
	public Report getReport(int reportId) {
		return reportDao.getReport(reportId);
	}

	@Transactional
	public List getAllReport() {
		return reportDao.getAllReport();
	}
	
	@Transactional
	public List getAllReportSh(SearchDate searchDate) {
		// TODO Auto-generated method stub
		return reportDao.getAllReportSh(searchDate);
	}

	

}
