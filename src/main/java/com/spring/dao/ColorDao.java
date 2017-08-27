package com.spring.dao;

import java.util.List;

import com.spring.model.Color;

public interface ColorDao {
	public void add(Color color);
	public void edit(Color color);
	public void delete(int colorId);
	public Color getColor(int colorId);
	public List getAllColor();
}
