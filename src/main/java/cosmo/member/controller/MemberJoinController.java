package cosmo.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cosmo.common.controller.SuperClass;
import cosmo.member.bean.Student;
import cosmo.member.bean.Teacher;
import cosmo.member.dao.MemberDao;



public class MemberJoinController extends SuperClass {
	MemberDao mdao = null;
	Student stubean = null;
	Teacher teabean = null;
	
	public MemberJoinController() {
		this.mdao = new MemberDao();
		this.stubean = new Student();
		this.teabean = new Teacher();
	}
	
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doProcess(request,response);
		
		String gotopage="/member/join.jsp";
		super.GotoPage(gotopage);
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doProcess(request,response);
		// 학생과 강사 객체 그리고 하나의 dao에서 분리하여 만들기
		// 저장은 따로 tors 학생/강사
		String tors = request.getParameter("tors");
		System.out.println(tors + "체크");
		
		
		if ("teacher".equals(tors)) {
			
			System.out.println("선생으로옴");
			String teacher_id = request.getParameter("id");
			String teacher_name = request.getParameter("name");
			String teacher_password = request.getParameter("password");
			String teacher_gender = request.getParameter("gender");
			String teacher_birth = request.getParameter("birth");
			String teacher_address = request.getParameter("address");
			String lecture_room =request.getParameter("lecture_room"); 
			
			teabean.setTeacher_id(teacher_id);
			teabean.setTeacher_name(teacher_name);
			teabean.setTeacher_password(teacher_password);
			teabean.setTeacher_gender(teacher_gender);
			teabean.setTeacher_birth(teacher_birth);
			teabean.setTeacher_address(teacher_address);
			teabean.setLecture_room(lecture_room);
			
			
			System.out.println(this.getClass() + " doPost()");
			System.out.println(teabean);
			
			mdao.InsertTeacherData(this.teabean);
			
			String message = "회원 가입 축하, 로그인을 진행하세요.";
			super.session.setAttribute("message", message);
			new MemberLoginController().doGet(request, response);
			
		} else if ("student".equals(tors)) {
			System.out.println("학생으로옴");
			String student_id = request.getParameter("id");
			System.out.println(student_id);
			String student_name = request.getParameter("name");
			String student_password = request.getParameter("password");
			String student_gender = request.getParameter("gender");
			String student_birth = request.getParameter("birth");
			String student_address = request.getParameter("address");
			String lecture_room =request.getParameter("lecture_room"); 

			
			stubean.setStudent_id(student_id);
			stubean.setStudent_name(student_name);
			stubean.setStudent_password(student_password);
			stubean.setStudent_gender(student_gender);
			stubean.setStudent_birth(student_birth);
			stubean.setStudent_address(student_address); 
			stubean.setLecture_room(lecture_room);

			
			System.out.println(this.getClass() + " doPost()");
			System.out.println(stubean);
			
			mdao.InsertStudentData(this.stubean);
			
			String message = "회원 가입 축하, 로그인을 진행하세요.";
			super.session.setAttribute("message", message);
			new MemberLoginController().doGet(request, response);
			
		}
		
			
		
	}
}
