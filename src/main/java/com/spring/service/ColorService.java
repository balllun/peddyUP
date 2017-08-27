package com.spring.service;

import java.util.List;

import com.spring.model.Color;

public interface ColorService {
	public void add(Color color);
	public void edit(Color color);
	public void delete(int colorId);
	public Color getColor(int colorId);
	public List getAllColor();
	
}
