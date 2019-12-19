package org.java.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.java.pojo.Biaobai5;
import org.java.util.DBUtil;

@WebServlet("/FindBiaobai5Object")
public class FindBiaobai5Object extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String bobject=request.getParameter("bobject");
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		StringBuilder sb = new StringBuilder("{\"list\":[");
		try {
			connection = DBUtil.getConnection();
			String sql = "select hisname from t_famous where hisname like '%"+bobject+"%'";
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				String onename=resultSet.getString(1);
				sb.append("\"").append(onename).append("\",");
			}
			int index = sb.length()-1;  
            if (sb.charAt(index)==',') {  
                sb.deleteCharAt(index);   //É¾³ý¶àÓàµÄ¶ººÅ  
            }  
            sb.append("]}");  
            PrintWriter writer = response.getWriter();  
            writer.write(sb.toString());  
            writer.flush();
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
