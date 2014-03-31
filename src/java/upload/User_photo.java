package upload;



import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import master_itm.com.Sql;
import master_itm.com.UsersPojo;

@WebServlet ("/User_photo")
@MultipartConfig
public class User_photo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {
		uploadFile(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {
		uploadFile(request, response);
	}

	/**
	 * uploadFile method used to upload file to server.
	 *
	 ***/
	private void uploadFile(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		for(Part part : request.getParts()) {
			String name = part.getName();
			InputStream is = request.getPart(name).getInputStream();
			String fileName = getUploadedFileName(part);
			String relativeWebPath = "/user_photo";
String absoluteDiskPath = getServletContext().getRealPath(relativeWebPath);
			FileOutputStream fos = new FileOutputStream(absoluteDiskPath+"/"+fileName);
			int data = 0;
			while((data = is.read()) != -1) {
				fos.write(data);
			}
			fos.close();
			is.close();
                        HttpSession session = request.getSession();
                        Sql s = new Sql();
                        int user_id = Integer.parseInt(session.getAttribute("user_id").toString());
                    UsersPojo  pm = new UsersPojo();
                pm.setId(user_id);
                pm.setPhoto("user_photo/"+fileName);
                s.updateUserPhoto(pm);
                
			
		}
	
	}
	
	/**
	 * Method used to get uploaded file name.
	 * This will bide Vuqar dersi kecmeye bawliyiblar? ne dersi? sene praktika kecmiyeceydiler?
         * fevralin evveli yanvarin sonu bawlayacag he menede oyredersende onda olar?
         * elbetde zaten oz kompumda saxliyiram dedim komp lazim deyil eve gelince senle bakariz :) 
iyi olur saolasin :))
))* parse following string and get filename 
	 * Content-Disposition: form-data; name="content"; filename="a.txt"
	 **/
	private String getUploadedFileName(Part p) {
		String file = "", header = "Content-Disposition";
		String[] strArray = p.getHeader(header).split(";");
		for(String split : strArray) {
			if(split.trim().startsWith("filename")) {
				file = split.substring(split.indexOf('=') + 1);
				file = file.trim().replace("\"", "");
				System.out.println("File name : "+file);
			}
		}
		return file;
	}
	
}
