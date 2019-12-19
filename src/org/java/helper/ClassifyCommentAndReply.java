package org.java.helper;

import java.util.ArrayList;
import java.util.List;

import org.java.pojo.Reply;


public class ClassifyCommentAndReply {
	public static List<Reply> GetComment(List<Reply> reply){
		List<Reply> comments=new ArrayList<Reply>();
		for(Reply tmp:reply){
			if(tmp.getKind()==1)
				comments.add(tmp);
		}
		return comments;
	}
	public static List<Reply> GetReply(List<Reply> reply,int replyId){
		List<Reply> replys=new ArrayList<Reply>();
		for(Reply tmp:reply){
			if(tmp.getKind()==2)
				if(tmp.getReply_id()==replyId)
					replys.add(tmp);
		}
		return replys;
	}
}
