package org.java.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadBase;
import org.apache.commons.fileupload.ProgressListener;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.java.dao.impl.DaoFactory;
import org.java.pojo.Biaobai4;
import org.java.pojo.User;
//更新头像
@WebServlet("/UpdateHeadPhoto")
public class UpdateHeadPhoto extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user=null;
		user=(User) request.getSession().getAttribute("loginUser");
		if(user==null)
		{
			request.setAttribute("error", "请您先登录之后再继续操作！");
			request.getRequestDispatcher("/onload.jsp").forward(request, response);
			return;
		}
        String savePath = this.getServletContext().getRealPath("/headphoto");
        String tempPath = this.getServletContext().getRealPath("/WEB-INF/temp");
        File tmpFile = new File(tempPath);
        if (!tmpFile.exists()) {
            tmpFile.mkdir();
        }
        String message = "";
        try{
            DiskFileItemFactory factory = new DiskFileItemFactory();
            factory.setSizeThreshold(1024*100);
            factory.setRepository(tmpFile);
            ServletFileUpload upload = new ServletFileUpload(factory);
            upload.setProgressListener(new ProgressListener(){
                public void update(long pBytesRead, long pContentLength, int arg2) {
                    System.out.println("" + pContentLength + "," + pBytesRead);
                }
            });
            upload.setHeaderEncoding("UTF-8"); 
            if(!ServletFileUpload.isMultipartContent(request)){
                return;
            }
            upload.setFileSizeMax(1024*1024*5);
            upload.setSizeMax(1024*1024*20);
            List<FileItem> list = upload.parseRequest(request);
            for(FileItem fileItem : list){
                if(fileItem.isFormField()){
                	//没有非文件内容
                }else{
                	String fileName = fileItem.getName();
					if(fileName!=null&&!"".equals(fileName.trim())) {
						String suffix = fileName.substring(fileName.lastIndexOf('.'));
						String newFileName = new Date().getTime() + suffix;
						System.out.println(savePath);
						File file = new File(savePath + "/" + newFileName);
						
						System.out.println(file.getAbsolutePath());
						//fileItem.write(file1);
						fileItem.write(file);
						user.setHeadphoto(newFileName);
						// 6. 调用FileItem的delete()方法，删除临时文件
						fileItem.delete();               
						message = "";
					}
                }
            }
        }catch (FileUploadBase.FileSizeLimitExceededException e) {
            e.printStackTrace();
            request.setAttribute("message", "");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
            return;
        }catch (FileUploadBase.SizeLimitExceededException e) {
            e.printStackTrace();
            request.setAttribute("message", "");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
            return;
        }catch (Exception e) {
            message= "";
            e.printStackTrace();
        }
        DaoFactory.getUserDao().updateHeadPhoto(user);
        request.setAttribute("success", "修改成功");
		//request.getRequestDispatcher("/onload2.jsp").forward(request, response);
        request.getSession().setAttribute("loginUser", user);
		response.sendRedirect(request.getContextPath()+"/info/biaobaiinfo.jsp?type=1");
		//return;
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
