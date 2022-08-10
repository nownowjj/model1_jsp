package cosmo.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cosmo.common.controller.SuperClass;
import cosmo.member.bean.Member;
import cosmo.member.bean.Student;
import cosmo.member.bean.Teacher;

import cosmo.member.dao.MemberDao;
import cosmo.common.controller.MainController;
public class MemberLoginController extends SuperClass {
	MemberDao mdao = new MemberDao(); 
	Member member = null;
	Student stubean = null;
	Teacher teabean = null;
	
	
	public MemberLoginController() {
	}
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doProcess(request, response);
		
		String gotopage="/member/LoginForm.jsp";
		super.GotoPage(gotopage);
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doProcess(request,response);
		String id = request.getParameter("id");
		String password  =request.getParameter("password");
		String tors = request.getParameter("ra");
		System.out.println(id+" "+password+" "+tors);
		
		String message = "로그인이 실패하였습니다";
		
		if(tors.equals("admin")) {//관리자 로그인시
			System.out.println("관리자 로그인");
			this.member = new Member();
			this.member=mdao.MemberCheck(id,password);
			
			if(member == null) { //로그인 실패함
				System.out.println(message);
				message="아이디 혹은 비밀번호가 잘못 입력되었습니다.";
				super.setErrorMessage(message);
				String gotopage="/member/LoginForm.jsp";
				super.GotoPage(gotopage);
			}else {
				//로그인 정보를 세션 영역에 바인딩합니다.
				super.session.setAttribute("loginfomem", member);  
				//메인페이지로 이동한다.
				new MainController().doGet(request, response);
			}
			
		}else if(tors.equals("student")) {// 학생 로그인 시
			System.out.println("학생 로그인");
			this.stubean = new Student();
			this.stubean=mdao.StudentCheck(id,password);
			
			if(stubean == null) { //로그인 실패함
				System.out.println(message);
				message="아이디 혹은 비밀번호가 잘못 입력되었습니다.";
				super.setErrorMessage(message);
				String gotopage="/member/LoginForm.jsp";
				super.GotoPage(gotopage);
			}else {
				//로그인 정보를 세션 영역에 바인딩합니다.
				super.session.setAttribute("loginfostu", stubean);  
				//메인페이지로 이동한다.
				new MainController().doGet(request, response);
			}
			
		}else if(tors.equals("teacher")) {//선생님 로그인시
			System.out.println("강사 로그인");
			this.teabean = new Teacher();
			this.teabean=mdao.TeacherCheck(id,password);
			
			if(teabean == null) { //로그인 실패함
				System.out.println(message);
				message="아이디 혹은 비밀번호가 잘못 입력되었습니다.";
				super.setErrorMessage(message);
				String gotopage="/member/LoginForm.jsp";
				super.GotoPage(gotopage);
			}else {
				//로그인 정보를 세션 영역에 바인딩합니다.
				super.session.setAttribute("loginfotea", teabean);  
				//메인페이지로 이동한다.
				new MainController().doGet(request, response);
			}
		}
			
				
	}
}
