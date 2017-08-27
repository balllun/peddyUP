package com.spring.service;

import java.util.List;

import com.spring.model.Report;
import com.spring.model.SearchDate;

public interface ReportService {
	public void add(Report report);
	public void edit(Report report);
	public void delete(int reportId);
	public Report getReport(int reportId);
	public List getAllReport();
	
	List getAllReportSh(SearchDate searchDate);
	
}
