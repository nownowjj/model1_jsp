package cosmo.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cosmo.common.controller.SuperClass;
import cosmo.member.bean.Student;
import cosmo.member.bean.Teacher;
import cosmo.member.dao.MemberDao;


public class MemberUpdateController extends SuperClass {
	MemberDao mdao = null;
	public MemberUpdateController() {
		mdao = new MemberDao();
	}
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doProcess(request,response);
		
		String id = request.getParameter("id");
		int status = Integer.parseInt(request.getParameter("status"));
		System.out.println(id+","+status);
		
		
		if(status==1) {
			Student bean = mdao.selectOneStudent(id);
			request.setAttribute("bean", bean);
			
		}else if(status==3) {
			Teacher bean = mdao.selectOneTeacher(id);
			request.setAttribute("bean", bean);
		}
			request.setAttribute("status", status);
		String gotopage="/member/meUpdateForm.jsp";
		super.GotoPage(gotopage);
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doProcess(request,response);
		String id = request.getParameter("id");
		String passowrd = request.getParameter("password");
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String birth = request.getParameter("birth");
		String lecture_room = request.getParameter("lecture_room");
		int status = Integer.parseInt(request.getParameter("status"));
		String gender = request.getParameter("gender");
		
		if(status == 1) {
			Student bean = new Student();
			bean.setLecture_room(lecture_room);
			bean.setStatus(status);
			bean.setStudent_address(address);
			bean.setStudent_birth(birth);
			bean.setStudent_gender(gender);
			bean.setStudent_id(id);
			bean.setStudent_name(name);
			bean.setStudent_password(passowrd);
			
			mdao.UpdateStudent(bean);
		}else if(status == 3) {
			Teacher bean = new Teacher();
			bean.setLecture_room(lecture_room);
			bean.setStatus(status);
			bean.setTeacher_address(address);
			bean.setTeacher_birth(birth);
			bean.setTeacher_gender(gender);
			bean.setTeacher_id(id);
			bean.setTeacher_name(name);
			bean.setTeacher_password(passowrd);
			mdao.UpdateTeacher(bean);
			
		}
		
		String gotopage="/common/main.jsp";
		super.GotoPage(gotopage);
	}
}
