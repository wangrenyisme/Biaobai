package org.java.servlet;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.java.dao.Biaobai1Dao;
import org.java.dao.impl.DaoFactory;
import org.java.helper.ImgUtil;
import org.java.helper.StringUtil;
import org.java.pojo.Biaobai1;
import org.java.pojo.BiaobaiMessage;
import org.java.pojo.User;

@WebServlet("/Biaobai1Add")
public class Biaobai1Add extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//防止乱码
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		User user=null;
		user=(User) request.getSession().getAttribute("loginUser");
		if(user==null)
		{
			request.setAttribute("error", "请您先登录之后再继续操作！");
			request.getRequestDispatcher("/onload.jsp").forward(request, response);
			return;
		}
		String lovename=request.getParameter("lovename");
		String gender=request.getParameter("gender");
		String department=request.getParameter("department");
		String grade=request.getParameter("grade");
		String knowtime=request.getParameter("knowtime");
		String content=request.getParameter("content");
		List list = ImgUtil.getImageSrc(content);
		String picturePath = StringUtil.listToString(list, ',');
		String withouthtml=request.getParameter("contentwithouthtml");
		String contentwithouthtml=withouthtml.length()<50?withouthtml:withouthtml.substring(0, 50);
		Biaobai1Dao biaobai1Dao=null;
		Biaobai1 biaobai1=null;
		if(lovename!=null&&!"".equals(lovename.trim())&&content!=null&&!"".equals(content.trim())){
			//如果数据正常则进行赋值
			biaobai1=new Biaobai1();
			if(list.size()>0)
				biaobai1.setImgUrl(picturePath);
			biaobai1.setUsername(user.getUsername());
			biaobai1.setLovename(lovename);
			biaobai1.setGender(gender);
			biaobai1.setDepartment(department);
			biaobai1.setGrade(grade);
			biaobai1.setKnowtime(knowtime);
			biaobai1.setContent(content);
			biaobai1.setContentwithouthtml(contentwithouthtml);
			biaobai1.setIssuedate(new Timestamp(System.currentTimeMillis()));
			
		}
		if(biaobai1!=null){
			//如果数据正常则插入并且跳转到首页
			biaobai1Dao=DaoFactory.getBiaobai1Dao();
			biaobai1Dao.addBiaobai1(biaobai1);
			request.setAttribute("success", "表白成功");
			if(lovename!=null&&!lovename.trim().isEmpty()) {
				List<User> users=DaoFactory.getUserDao().getByName(lovename);
				if(users.size()>0){
					for(User touser:users){
						touser.setMessage(touser.getMessage()+1);
						DaoFactory.getUserDao().updateMessage(touser);
						BiaobaiMessage message=new BiaobaiMessage();
						message.setMessage_id(DaoFactory.getBiaobai1Dao().getIdByUsername(lovename));
						message.setTo_uid(touser.getName());
						message.setFrom_uid(user.getUsername());
						message.setPost_date(new Timestamp((new Date().getTime())));
						message.setReaded(0);
						DaoFactory.getMessageDao().add(message);
					}
				}
			}
			request.getRequestDispatcher("/onload2.jsp").forward(request, response);
			return;
		}else{
			//如果数据正常则跳转到错误页面
			response.sendRedirect(request.getContextPath()+"/errorPage.jsp");
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
