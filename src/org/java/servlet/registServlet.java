package org.java.servlet;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.java.dao.impl.UserDao;
import org.java.pojo.User;
@WebServlet("/registServlet")
public class registServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
    public registServlet() 
    {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String repassword = request.getParameter("repassword");
		String name = request.getParameter("name");
		String sex = request.getParameter("sex");
		String headphoto="userMin.jpg";
		UserDao userDao = new UserDao();
		User user = null;
		if(!(password.equals(repassword)))
		{
			request.setAttribute("failure","输入的两次密码不一致！");
			request.getRequestDispatcher("/regist.jsp").forward(request, response);
			return;
		}
		user=new User();
		try 
		{
			user.setUsername(username);
			user.setPassword(password);
			user.setName(name);
			user.setSex(sex);
			user.setHeadphoto(headphoto);
			userDao.addUser(user);
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		}
		catch(Exception e) 
		{
			e.printStackTrace();
			request.setAttribute("failure",e.toString());
			request.getRequestDispatcher("/regist.jsp").forward(request, response);
			return;
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
	}

}
