package cosmo.attendence.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cosmo.attendence.bean.Attendence;
import cosmo.attendence.dao.AttendenceDao;
import cosmo.common.controller.SuperClass;


public class ManagerAttendenceUpdateController extends SuperClass {
	AttendenceDao adao = null;
	Attendence bean = null;
	public ManagerAttendenceUpdateController() {
		
		this.adao = new AttendenceDao();
		this.bean = new Attendence();
	}
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doProcess(request,response);
		int a_no = Integer.parseInt(request.getParameter("a_no"));	
		this.bean = this.adao.SelectOneUpdate(a_no) ;
		
		request.setAttribute("bean", this.bean);
		
		String gotopage="/attendence/attListUpdate.jsp";
		super.GotoPage(gotopage);
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doProcess(request,response);
		
		int a_no =Integer.parseInt(request.getParameter("a_no"));
		String student_name =  request.getParameter("student_name");  
		String att_date =  request.getParameter("att_date");
		String att =  request.getParameter("att");
		String reason =  request.getParameter("reason");
		String remark =  request.getParameter("remark");
		String student_id = request.getParameter("student_id");
		
		this.bean.setA_no(a_no);
		this.bean.setAtt(att);
		this.bean.setAtt_date(att_date);
		this.bean.setReason(reason);
		this.bean.setRemark(remark);
		this.bean.setStudent_id(student_id);
		this.bean.setStudent_name(student_name);
		
		System.out.println(this.getClass() + "dopost");
		System.out.println(bean);
		
		adao.UpdateData(this.bean);
		
		
		String message = "해당 학생의 출석관련 정보가 수정되었습니다";
		super.session.setAttribute("message", message);
		new ManagerAttendenceController().doGet(request, response);
		
	}
}
