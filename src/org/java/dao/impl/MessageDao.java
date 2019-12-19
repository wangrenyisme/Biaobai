package org.java.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.java.dao.IMessageDao;
import org.java.pojo.BiaobaiMessage;
import org.java.util.DBUtil;


public class MessageDao implements IMessageDao{

	@Override
	public void add(BiaobaiMessage biaobai) {
		Connection connection = null;
		PreparedStatement preparedStatement= null;
		try {
			connection = DBUtil.getConnection();
			String sql = "insert into t_biaobai(id,type,message_id,post_date,readed,from_uid,to_uid) values (?,?,?,?,?,?,?)";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, biaobai.getId());
			preparedStatement.setInt(2, biaobai.getMessage_id());
			preparedStatement.setInt(3, biaobai.getMessage_id());
			preparedStatement.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
			preparedStatement.setInt(5, biaobai.getReaded());
			preparedStatement.setString(6, biaobai.getFrom_uid());
			preparedStatement.setString(7, biaobai.getTo_uid());
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
		String sql = "delete from t_biaobai where id=?";
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
	public void update(BiaobaiMessage biaobai) {
		Connection connection = DBUtil.getConnection();
		PreparedStatement preparedStatement = null;
		
		try{
			connection = DBUtil.getConnection();
			String sql = "update t_biaobai set readed=? where id=?";
			
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, biaobai.getReaded());
			preparedStatement.setInt(2, biaobai.getId());
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
	}

	@Override
	public BiaobaiMessage load(int id) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<BiaobaiMessage> list(String username) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		List<BiaobaiMessage> biaobais = new ArrayList<BiaobaiMessage>(); 
		BiaobaiMessage message = null;
		try {
			connection = DBUtil.getConnection();
			String sql = "select * from t_biaobai where to_uid = ? order by id desc";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1,username);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				message = new BiaobaiMessage();
				message.setId(resultSet.getInt("id"));
				message.setType(resultSet.getInt("type"));
				message.setMessage_id(resultSet.getInt("message_id"));
				message.setPost_date(new Date(resultSet.getTimestamp("post_date").getTime()));
				message.setReaded(resultSet.getInt("readed"));
				message.setFrom_uid(resultSet.getString("from_uid"));
				message.setTo_uid(resultSet.getString("to_uid"));
				biaobais.add(message);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return biaobais;
	}

	@Override
	public List<BiaobaiMessage> list() {
		// TODO Auto-generated method stub
		return null;
	}
}
