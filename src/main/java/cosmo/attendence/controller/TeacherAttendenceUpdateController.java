package cosmo.attendence.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cosmo.attendence.bean.Attendence;
import cosmo.attendence.dao.AttendenceDao;
import cosmo.common.controller.MainController;
import cosmo.common.controller.SuperClass;


public class TeacherAttendenceUpdateController extends SuperClass {
	AttendenceDao adao = null;
	Attendence bean = null;
	public TeacherAttendenceUpdateController() {
		
		this.adao = new AttendenceDao();
		this.bean = new Attendence();
	}
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doProcess(request,response);
		String id = request.getParameter("id");
		String a_no = request.getParameter("a_no");
		this.bean = this.adao.selectMyStudent(id,a_no);
		
		request.setAttribute("bean", this.bean);
		
		String gotopage = "/attendence/updatemystd.jsp";
		super.GotoPage(gotopage);
		
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doProcess(request,response);
		int a_no = Integer.parseInt(request.getParameter("a_no"));
		String id = request.getParameter("id");
		String att = request.getParameter("list");
		String reason = request.getParameter("reason");
		
		this.bean.setA_no(a_no);
		this.bean.setStudent_id(id);
		this.bean.setAtt(att);
		this.bean.setReason(reason);
		
		System.out.println(this.getClass()+"doPost()");
		System.out.println(bean);
		
		this.adao.UpdateData_1(this.bean);
		String msg = "출결 수정을 완료했습니다. 메인페이지로 돌아갑니다.";
		super.session.setAttribute("message", msg);
		new MainController().doGet(request, response);
	}
}
