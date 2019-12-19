package org.java.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Timestamp;
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
@WebServlet("/Biaobai4Add")
public class Biaobai4Add extends HttpServlet {
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
        String savePath = this.getServletContext().getRealPath("/fileUpload");
        String tempPath = this.getServletContext().getRealPath("/WEB-INF/temp");
        File tmpFile = new File(tempPath);
        if (!tmpFile.exists()) {
            tmpFile.mkdir();
        }
        Biaobai4 biaobai4=new Biaobai4();
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
            for(FileItem item : list){
                if(item.isFormField()){
                    String name = item.getFieldName();
                    String value = item.getString("UTF-8");
                    if(name.equals("name")) {
                    	biaobai4.setName(value);
					}
					if(name.equals("gender")) {
						biaobai4.setGender(value);
					}
                    if(name.equals("department")) {
                    	biaobai4.setDepartment(value); 
					}
					if(name.equals("grade")) {
						biaobai4.setGrade(value);
					}
                    if(name.equals("contact")) {
                    	biaobai4.setContact(value);
					}
					if(name.equals("character")) {
						biaobai4.setCharacter(value);
					}
                    if(name.equals("preference")) {
                    	biaobai4.setPreference(value);
					}
                    if(name.equals("address")) {
                    	biaobai4.setAddress(value);
					}
					if(name.equals("favoredType")) {
						biaobai4.setFavoredType(value);
					}
                }else{
                    String filename = item.getName();
                    if(filename==null || filename.trim().equals("")){
                        continue;
                    }
                    filename = filename.substring(filename.lastIndexOf("\\")+1);
                    String fileExtName = filename.substring(filename.lastIndexOf(".")+1);//获得文件后缀名
                    InputStream in = item.getInputStream();
                    String saveFilename = makeFileName()+fileExtName;
                    String realSavePath = makePath(saveFilename, savePath);
                    FileOutputStream out = new FileOutputStream(realSavePath + "\\" + saveFilename);
                    byte buffer[] = new byte[1024];
                    int len = 0;
                    while((len=in.read(buffer))>0){
                        out.write(buffer, 0, len);
                    }
                    in.close();
                    out.close();
                    biaobai4.setPhoto(saveFilename);
                    
                    message = "";
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
        biaobai4.setComtimes(0);
        biaobai4.setLiketimes(0);
        biaobai4.setUsername(user.getUsername());
        if(biaobai4.getPhoto()==null)
        	biaobai4.setPhoto("");
        biaobai4.setIssuedate(new Timestamp(System.currentTimeMillis()));
        DaoFactory.getBiaobai4Dao().addBiaobai4(biaobai4);
        request.setAttribute("success", "表白成功");
		request.getRequestDispatcher("/onload2.jsp").forward(request, response);
		return;
	}
	private String makeFileName(){
		return UUID.randomUUID().toString().replace("-", "");
	}
	
	private String makePath(String filename,String savePath){
		int hashcode = filename.hashCode();
		int dir1 = hashcode&0xf;  //0--15
		int dir2 = (hashcode&0xf0)>>4;  //0-15
		String dir = savePath + "\\" + dir1 + "\\" + dir2;  //upload\2\3  upload\3\5
		File file = new File(dir);
		if(!file.exists()){
		    file.mkdirs();
		}
		return dir;
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
