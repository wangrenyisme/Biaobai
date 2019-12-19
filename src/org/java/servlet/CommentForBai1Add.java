package org.java.servlet;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.java.dao.impl.DaoFactory;
import org.java.pojo.Biaobai1;
import org.java.pojo.Biaobai2;
import org.java.pojo.Biaobai3;
import org.java.pojo.Biaobai4;
import org.java.pojo.Biaobai5;
import org.java.pojo.Reply;
import org.java.pojo.User;
@WebServlet("/CommentForBai1Add")
public class CommentForBai1Add extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		int messageId=Integer.parseInt(request.getParameter("messageId"));
		int kind=Integer.parseInt(request.getParameter("kind"));
		int type=Integer.parseInt(request.getParameter("type"));
		Reply reply=new Reply();
		reply.setType(type);
		reply.setMessage_id(messageId);
		//������׶�Ӧ�����ۻظ���һ
		if(type==1){
			Biaobai1 biaobai1=DaoFactory.getBiaobai1Dao().getById(messageId);
			biaobai1.setComtimes(biaobai1.getComtimes()+1);
			DaoFactory.getBiaobai1Dao().updateComs(messageId);
		}else if(type==2){
			Biaobai2 biaobai2=DaoFactory.getBiaobai2Dao().getById(messageId);
			biaobai2.setComtimes(biaobai2.getComtimes()+1);
			DaoFactory.getBiaobai2Dao().updateComs(messageId);
		}else if(type==3){
			Biaobai3 biaobai3=DaoFactory.getBiaobai3Dao().getById(messageId);
			biaobai3.setComtimes(biaobai3.getComtimes()+1);
			DaoFactory.getBiaobai3Dao().updateComs(messageId);
		}else if(type==4){
			Biaobai4 biaobai4=DaoFactory.getBiaobai4Dao().getById(messageId);
			biaobai4.setComtimes(biaobai4.getComtimes()+1);
			DaoFactory.getBiaobai4Dao().updateComs(messageId);
		}else if(type==5){
			Biaobai5 biaobai5=DaoFactory.getBiaobai5Dao().getById(messageId);
			biaobai5.setComtimes(biaobai5.getComtimes()+1);
			DaoFactory.getBiaobai5Dao().updateComs(messageId);
			
		}
		reply.setKind(kind);
		reply.setFrom_uid(request.getParameter("fromUId"));
		reply.setTo_uid(request.getParameter("toUId"));
		//给目标用户发消息
		User toUser=DaoFactory.getUserDao().getByUserName(request.getParameter("toUId"));
		toUser.setMessage(toUser.getMessage()+1);
		DaoFactory.getUserDao().updateMessage(toUser);
		
		reply.setReply_id(Integer.parseInt(request.getParameter("replyId")));//
		reply.setContent(request.getParameter("content"));
		reply.setPostDate(new Timestamp(System.currentTimeMillis()));
		reply.setReaded(0);
		DaoFactory.getReplyDao().add(reply);
		response.sendRedirect(request.getContextPath()+"/biaobai/biaobai"+type+"Show.jsp?id="+messageId);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
