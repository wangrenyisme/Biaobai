package org.java.dao;

import java.util.List;

import org.java.pojo.Department;

public interface DepartmentDao {
	public List<Department> getall();
	public String getDepartmentNameById(int id);
}
