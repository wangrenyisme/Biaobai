package org.java.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.java.dao.IReplyDao;
import org.java.pojo.Reply;
import org.java.util.DBUtil;

public class ReplyDao implements IReplyDao{

	@Override
	public void add(Reply reply) {
		Connection connection = null;
		PreparedStatement preparedStatement= null;
		try {
			connection = DBUtil.getConnection();
			String sql = "insert into t_reply(id,content,cansee,message_id,post_date,readed,from_uid,to_uid,reply_id,kind,type) values (?,?,?,?,?,?,?,?,?,?,?)";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, reply.getId());
			preparedStatement.setString(2, reply.getContent());
			preparedStatement.setInt(3, reply.getSee());
			preparedStatement.setInt(4, reply.getMessage_id());
			preparedStatement.setTimestamp(5,reply.getPostDate());
			preparedStatement.setInt(6, reply.getReaded());
			preparedStatement.setString(7, reply.getFrom_uid());
			preparedStatement.setString(8, reply.getTo_uid());
			preparedStatement.setInt(9, reply.getReply_id());
			preparedStatement.setInt(10, reply.getKind());
			preparedStatement.setInt(11, reply.getType());
			preparedStatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
	}
	@Override
	public void delete(int id) {
		Connection connection = DBUtil.getConnection();
		String sql = "delete from t_reply where id=?";
		PreparedStatement preparedStatement = null;
		
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, id);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
	}
	@Override
	public void delete(int m_id,int kind,int r_id) {
		Connection connection = DBUtil.getConnection();
		String sql = "delete from t_reply where reply_id=? and kind= ? and message_id= ?";
		PreparedStatement preparedStatement = null;
		
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, r_id);
			preparedStatement.setInt(2, kind);
			preparedStatement.setInt(3, m_id);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
	}

	@Override
	public void update(Reply reply) {
		Connection connection = DBUtil.getConnection();
		PreparedStatement preparedStatement = null;
		
		try{
			connection = DBUtil.getConnection();
			String sql = "update t_reply set content = ?,readed=? where id=?";
			
			preparedStatement = connection.prepareStatement(sql);
			//从User对象里面取得相应的值,放到sql语句中对应的位置上
			preparedStatement.setString(1, reply.getContent());
			preparedStatement.setInt(2, reply.getReaded());
			preparedStatement.setInt(3, reply.getId());
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
	}
	@Override
	public List<Reply>list(int m_id,int type){//查找评论，，，不包含 非回复
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		List<Reply> replys = new ArrayList<Reply>(); 
		Reply reply = null;
		try {
			connection = DBUtil.getConnection();
			String sql = "select * from t_reply where type = '"+ type +"' and message_id = '"+ m_id +"'";
			//查询总记录数,两个查询不相干
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				reply = new Reply();
				reply.setId(resultSet.getInt("id"));
				reply.setContent(resultSet.getString("content"));
				reply.setSee(resultSet.getInt("cansee"));
				reply.setMessage_id(resultSet.getInt("message_id"));
				reply.setPostDate(resultSet.getTimestamp("post_date"));
				reply.setReaded(resultSet.getInt("readed"));
				reply.setFrom_uid(resultSet.getString("from_uid"));
				reply.setTo_uid(resultSet.getString("to_uid"));
				reply.setReply_id(resultSet.getInt("reply_id"));
				reply.setType(resultSet.getInt("type"));
				reply.setKind(resultSet.getInt("kind"));
				replys.add(reply);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return replys;
	}
	public List<Reply>list(int m_id,int kind,int r_id,int type){
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		List<Reply> replys = new ArrayList<Reply>(); 
		Reply reply = null;
		try {
			connection = DBUtil.getConnection();
			String sqlCount = "select * from t_reply where message_id = ? and kind = ? and reply_id = ?";
			//查询总记录数,两个查询不相干
			preparedStatement = connection.prepareStatement(sqlCount);
			preparedStatement.setInt(1,m_id);
			preparedStatement.setInt(2,2);//2代表回复
			preparedStatement.setInt(3,r_id);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				reply = new Reply();
				reply.setId(resultSet.getInt("id"));
				reply.setContent(resultSet.getString("content"));
				reply.setSee(resultSet.getInt("cansee"));
				reply.setMessage_id(resultSet.getInt("message_id"));
				reply.setPostDate(resultSet.getTimestamp("post_date"));
				reply.setReaded(resultSet.getInt("readed"));
				reply.setFrom_uid(resultSet.getString("from_uid"));
				reply.setTo_uid(resultSet.getString("to_uid"));
				reply.setReply_id(resultSet.getInt("reply_id"));
				reply.setKind(resultSet.getInt("kind"));
				replys.add(reply);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return replys;
	}
	@Override
	public List<Reply> list(String to_uid) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		List<Reply> replys = new ArrayList<Reply>(); 
		Reply reply = null;
		try {
			connection = DBUtil.getConnection();
			String sql = "select * from t_reply where to_uid = ? order by id desc";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1,to_uid);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				reply = new Reply();
				reply.setId(resultSet.getInt("id"));
				reply.setContent(resultSet.getString("content"));
				reply.setSee(resultSet.getInt("cansee"));
				reply.setMessage_id(resultSet.getInt("message_id"));
				reply.setPostDate(resultSet.getTimestamp("post_date"));
				reply.setReaded(resultSet.getInt("readed"));
				reply.setFrom_uid(resultSet.getString("from_uid"));
				reply.setTo_uid(resultSet.getString("to_uid"));
				reply.setReply_id(resultSet.getInt("reply_id"));
				reply.setKind(resultSet.getInt("kind"));
				reply.setType(resultSet.getInt("type"));
				replys.add(reply);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return replys;
	}

}
