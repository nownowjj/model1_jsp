package cosmo.common.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SuperClass implements SuperController  {
	private HttpServletRequest request = null ;
	private  HttpServletResponse response = null ;
	protected HttpSession session = null ; // 세션 객체

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
	public void setErrorMessage(String message) {
		// request 영역에 사용자를 위한 통지를 바인딩합니다.
		this.request.setAttribute("errmsg", message); 
	}

	public void doProcess(HttpServletRequest request, HttpServletResponse response) {
		// 서브 클래스에서 호출하여 request, response를 인스턴스 변수에 대입합니다.
		this.request = request ;
		this.response = response ;
		this.session = request.getSession() ; 
	}

	public void GotoPage(String gotopage) {
		// 이동할 페이지로 포워딩을 수행합니다.
		RequestDispatcher dispatcher = this.request.getRequestDispatcher(gotopage) ;
		try {
			dispatcher.forward(this.request, this.response);	
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public String getUrl(String command) {
		// 이동할 url 문자열을 생성해준다.
		//command는 todolist.txt에 명시된 커맨드 이름이다.
		String result = this.request.getContextPath()+"/cosmo?command="+command;
		
		return result;
	}
}
