package app.postAc;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionTo;

public class FileDownloadAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String postFileSystem = req.getParameter("postFileSystem");
		String postFileOrigin = req.getParameter("postFileOrigin");
		
		String rootPath = req.getSession().getServletContext().getRealPath("/");
		String saveFolder = rootPath+"media/post";
		
		String filename = saveFolder+"\\"+postFileSystem;
		
		InputStream is = null;
		OutputStream os = null;
		
		File file = new File(filename);
		is = new FileInputStream(file);
		
		String client = req.getHeader("User-Agent");
		
		resp.reset();
		
		resp.setContentType("application/octet-stream");//이진데이터
		resp.setHeader("Content-Description", "JSP Generated Data");
		
		String dwName = "";
		
		try {
			//이름 인코딩
			try {
				dwName = URLEncoder.encode(postFileOrigin,"UTF-8").replaceAll("\\+", "%20");
			} catch (Exception e) {
				dwName = URLEncoder.encode(file.getName(),"UTF-8").replaceAll("\\+", "%20");
			}
			//클라이언트의 로컬 정보를 담은 client 변수 안에 MSIE 문자열이 포함되어 있는지를 비교(없으면 -1, 있으면 ??)
			if(client.indexOf("MSIE") != -1) {
				//MSIE 인 경우
				resp.setHeader("Content-Disposition", "attachment; fileName="+dwName);
			}
			else {
				//그 외
				resp.setHeader("Content-Disposition", "attachment; fileName=\""+dwName+"\"");
				resp.setHeader("Content-Type", "application/octet-stream; charset=utf-8");
			}
			resp.setHeader("Content-Length", file.length()+"");
			//응답 준비 완료
			//파일을 응답하기 위한 통로 개설(사용자의 컴퓨터에 써주기 위한 통로)
			os = resp.getOutputStream();
			
			//파일을 바이트단위로 쪼개서 담아줄 배열
			byte[] b = new byte[(int)file.length()];
			int len = 0;
			//while문 반복때마다 is.read() 수행해서 len에 대입
			//그 len이 -1이 아니라면 반복
			//len은 파일의 끝이 왔다면 -1이 담긴다.
			while((len = is.read(b,0,b.length)) != -1) {
				os.write(b,0,len);			
			}
		} catch (Exception e) {
			System.out.println("FileDownloadAction : "+e);
		} finally {
			if(is != null) {
				is.close();
			}
			if(os != null) {
				os.close();
			}
		}
		return null;
	}
}
