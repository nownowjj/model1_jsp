package cosmo.teacher.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import cosmo.common.controller.SuperClass;
import cosmo.member.bean.Student;
import cosmo.member.bean.Teacher;
import cosmo.member.dao.MemberDao;


public class TeacherStudentController extends SuperClass {
	MemberDao mdao = null;
	Teacher bean = null;
	public TeacherStudentController() {
		
		this.mdao = new MemberDao();
		this.bean = new Teacher();
	}
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doProcess(request,response);
		String id = request.getParameter("id");
//		int totalCount =mdao.GetTotalCount(id);
//		int pagenum=1;
//		if(request.getParameter("pagenum") != null) {
//			System.out.println(request.getParameter("pagenum"));
//			pagenum =Integer.parseInt(request.getParameter("pagenum")); 
//		}
//		int beginRow=(pagenum-1)*5+1;
//		int endRow=(pagenum)*5;
//		int totalPage = (int) Math.ceil(totalCount/5.0);
		List<Student> lists = mdao.showMyStudent(id);
		request.setAttribute("lists", lists);
//		request.setAttribute("totalPage",totalPage);
		String gotopage="/member/myStudentList.jsp";
		super.GotoPage(gotopage);
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doProcess(request,response);
		String id = request.getParameter("id");
		int salary = Integer.parseInt(request.getParameter("salary"));
		
		String gotopage="/member/myStudentList.jsp";
		super.GotoPage(gotopage);
	}
}