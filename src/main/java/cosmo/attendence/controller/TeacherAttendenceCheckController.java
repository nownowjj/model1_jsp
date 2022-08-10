package cosmo.attendence.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cosmo.attendence.bean.Attendence;
import cosmo.attendence.dao.AttendenceDao;
import cosmo.common.controller.MainController;
import cosmo.common.controller.SuperClass;
import cosmo.member.bean.Student;
import cosmo.member.dao.MemberDao;


public class TeacherAttendenceCheckController extends SuperClass {
	AttendenceDao adao = null;
	Attendence bean = null;
	MemberDao mdao = null;
	public TeacherAttendenceCheckController() {
		
		this.adao = new AttendenceDao();
		this.bean = new Attendence();
		this.mdao = new MemberDao();
	}
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doProcess(request,response);
		String id = request.getParameter("id");
//		System.out.println(id);
//		int totalCount = mdao.GetTotalCount(id); // clear 4나옴
//		System.out.println(totalCount);
		List<Student> lists = mdao.showMyStudent(id);
		System.out.println(lists); // 4개인데 2개밖에 못뽑음
		request.setAttribute("lists", lists);
		
		String gotopage="/attendence/attCheck.jsp";
		super.GotoPage(gotopage);
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doProcess(request,response);
		List<Attendence> lists = new ArrayList<Attendence>();
		
		String[] id = request.getParameterValues("student_id");
		String[] name = request.getParameterValues("student_name");
		String[] att = request.getParameterValues("list");
		String[] reason = request.getParameterValues("reason");
		for(int i=0;i<id.length;i++) {
			Attendence atte = new Attendence();
			atte.setStudent_id(id[i]);
			atte.setStudent_name(name[i]);
			atte.setAtt(att[i]);
			atte.setReason(reason[i]);
			System.out.println(id[i]);
			System.out.println(name[i]);
			System.out.println(att[i]);
			System.out.println(reason[i]);
			lists.add(atte);
		}
		
		adao.InsertGroup(lists);
		String msg = "입력이 완료되었습니다. 메인페이지로 돌아갑니다.";
		super.session.setAttribute("message", msg);
		new MainController().doGet(request, response);
	}
}
