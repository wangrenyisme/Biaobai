package org.java.servlet;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.java.dao.impl.UserDao;
import org.java.pojo.User;

@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
    public loginServlet() 
    {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{	
		//防止中文乱码
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String yanzheng = request.getParameter("yanzheng");
		String yanzhengma = request.getParameter("text_yzm");
		User user=null;
		UserDao userDao=new UserDao();
		user=userDao.login(username, password);
		if(!yanzheng.equals(yanzhengma))
		{
			request.setAttribute("error", "验证码错误！");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
			return;
		}
		if(user==null)
		{
			request.setAttribute("error", "登录出现错误，用户名或密码不正确。");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
			return;
		}
		else
		{
			if(user.getType()==0)
			{
				request.setAttribute("success", "0");
				request.getSession().setAttribute("loginUser", user);
				request.getRequestDispatcher("/admin.jsp").forward(request, response);
				return;
			}
			else 
			{
				request.setAttribute("success", "1");
				request.getSession().setAttribute("loginUser", user);
				request.getRequestDispatcher("/index.jsp").forward(request, response);
				return;
			}
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
	}
}
