package cosmo.attendence.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cosmo.attendence.bean.Attendence;
import cosmo.attendence.bean.SummaryAtt;
import cosmo.attendence.dao.AttendenceDao;
import cosmo.common.controller.SuperClass;


public class StudentAttendenceController extends SuperClass {
	AttendenceDao adao = null;
	SummaryAtt bean = null;
	public StudentAttendenceController() {
		
		this.adao = new AttendenceDao();
		this.bean = new SummaryAtt();
	}
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doProcess(request,response);
		
		String id = request.getParameter("id");
		System.out.println(id);
		List<SummaryAtt> lists = this.adao.SelectOneCount(id);
		System.out.println("리스트 수 : " + lists.size());
		request.setAttribute("lists", lists);
		
		String gotopage = "/attendence/studentatt.jsp";
		super.GotoPage(gotopage);
		
	}
}
