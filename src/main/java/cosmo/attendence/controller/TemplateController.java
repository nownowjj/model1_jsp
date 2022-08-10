package cosmo.attendence.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cosmo.attendence.bean.Attendence;
import cosmo.attendence.dao.AttendenceDao;
import cosmo.common.controller.SuperClass;


public class TemplateController extends SuperClass {
	AttendenceDao adao = null;
	Attendence bean = null;
	public TemplateController() {
		
		this.adao = new AttendenceDao();
		this.bean = new Attendence();
	}
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doProcess(request,response);
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doProcess(request,response);
		String id = request.getParameter("id");
		int salary = Integer.parseInt(request.getParameter("salary"));
		
		request.setAttribute("DDD", null);
		super.session.setAttribute("DDD", null);
		
		// 로그인 성공이라 가정하고
		String gotopage="/product/meList.jsp";
		super.GotoPage(gotopage);
	}
}
