package cosmo.utility;

import java.io.FileInputStream;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import cosmo.common.controller.SuperController;


public class MyUtility {

	public static Map<String, SuperController> getTodoList(String configFilePath) {
		Map<String, SuperController> todolists = null ;
		todolists = new HashMap<String, SuperController>(); 
		
		Properties prop = new Properties() ;
		FileInputStream fis = null ;
		
		try {
			fis = new FileInputStream(configFilePath) ;
			prop.load(fis); 
			
		} catch (Exception e) {
			e.printStackTrace(); 
		} finally {
			try {
				if(fis != null) {fis.close();}	
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		// 현재 prop에는 <String, String> 형태로 데이터가 들어 있습니다.
		// 아래 코드는 이것을 <String, SuperController> 형태로 바꿔 줍니다.
		
		Enumeration<Object> enu = prop.keys() ;
		while(enu.hasMoreElements()) {
			String command = enu.nextElement().toString() ;
			String className = prop.getProperty(command) ;
			
			try {
				Class<?> handleClass = Class.forName(className) ;
				
				SuperController handleInstance 
				 = (SuperController)handleClass.newInstance() ;
				
				todolists.put(command, handleInstance) ;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return todolists ;
	}

	public static MultipartRequest getMultipartRequest(HttpServletRequest request, String realPath) {
		// 파일 업로드를 위한 mr 객체를 만들어 줍니다.
		MultipartRequest mr = null ;
		int maxPostSize = 10 * 1024 * 1024 ;
		try {
			mr = new MultipartRequest(
					request, 
					realPath, 
					maxPostSize,
					"UTF-8",
					new DefaultFileRenamePolicy()); 
		} catch (Exception e) {
			e.printStackTrace(); 
		}
		
		return mr ;
	}
}