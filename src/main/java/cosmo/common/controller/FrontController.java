package cosmo.common.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import cosmo.utility.MyUtility;

@WebServlet(
		urlPatterns = {"/cosmo"}, 
		initParams = {
				@WebInitParam(name = "configFile", value = "/WEB-INF/todolist.txt")
		})
public class FrontController extends HttpServlet {
	
	// 서브 컨트롤러들의 모음집
	private Map<String, SuperController> todolists = new HashMap<String, SuperController>() ;
	private ServletContext application = null ;
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		this.application = config.getServletContext() ;
		
		String configFile = config.getInitParameter("configFile") ;
		System.out.println("configFile : " + configFile);
		
		String configFilePath = config.getServletContext().getRealPath(configFile) ;
		System.out.println("configFilePath : " + configFilePath);
		
		this.todolists = MyUtility.getTodoList(configFilePath) ;
		System.out.println("todolists.size() : " + this.todolists.size()); 
	}
	private void doProcess(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String command = request.getParameter("command") ;
		System.out.println(this.getClass() + " command : [" + command + "]");
		
		if(command==null) {
			System.out.println("file upload event");
			String realPath = this.application.getRealPath("/upload") ;
			System.out.println("realPath : " + realPath);
			
			MultipartRequest mr = MyUtility.getMultipartRequest(request, realPath) ;
			if(mr != null) {
				command = mr.getParameter("command") ;
				request.setAttribute("mr", mr) ;
				request.setAttribute("realPath", realPath) ;
			}
		}
		
		String method = request.getMethod().toLowerCase() ;
		
		SuperController controller = this.todolists.get(command) ;
		
		if (controller != null) {
			if (method.equals("get")) {
				System.out.println(controller.toString() + " get method called");
				controller.doGet(request, response);
			} else {
				System.out.println(controller.toString() + " post method called");
				controller.doPost(request, response);
			}
		} else {
			System.out.println(command + " is not found");
		}
	}	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doProcess(request, response);	
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doProcess(request, response);
	}
}