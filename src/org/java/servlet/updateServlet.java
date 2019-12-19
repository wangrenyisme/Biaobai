package org.java.servlet;
import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.java.dao.impl.UserDao;
import org.java.pojo.User;
@WebServlet("/updateServlet")
public class updateServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
    public updateServlet() 
    {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String name = request.getParameter("name");
		String sex = request.getParameter("sex");
		String telephone = request.getParameter("telephone");
		String qq = request.getParameter("qq");
		String school = request.getParameter("school");
		String college = request.getParameter("college");
		String grade = request.getParameter("grade");
		String birth = request.getParameter("birthday");
		Date birthday=Date.valueOf(birth);
		UserDao userDao = new UserDao();
		User user =new User();
		user=(User)request.getSession().getAttribute("loginUser");
		try 
		{
			user.setName(name);
			user.setSex(sex);
			user.setTelephone(telephone);
			user.setQq(qq);
			user.setSchool(school);
			user.setCollege(college);
			user.setGrade(grade);
			user.setBirthday(birthday);
			userDao.updateUser(user);
			request.getSession().setAttribute("loginUser", user);
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		}
		catch(Exception e) 
		{
			e.printStackTrace();
			request.setAttribute("failure",e.toString());
			request.getRequestDispatcher("/update.jsp").forward(request, response);
			return;
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
	}

}
