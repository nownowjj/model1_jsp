package cosmo.records.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cosmo.common.controller.MainController;
import cosmo.common.controller.SuperClass;
import cosmo.records.bean.Grade;
import cosmo.records.dao.GrDao;



public class CosmoInsertController extends SuperClass{
	GrDao grdao = null;
	Grade bean = null;
	
	public CosmoInsertController() {
		this.grdao = new GrDao();
		this.bean = new Grade();
	}
			
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doProcess(request, response);
		
		String id = request.getParameter("id") ;
		//학생목록만 가져오는 것
		List<Grade> lists = this.grdao.selectMyList(id); 
		
		request.setAttribute("lists", lists);
		
		
		String gotopage = "/records/cosmoInsertList.jsp" ;
		super.GotoPage(gotopage);
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doProcess(request, response);
		
		
		String student_id = request.getParameter("student_id");
		String teacher_id = request.getParameter("teacher_id");
		String s_code = request.getParameter("s_code");
		int lecture_score = Integer.parseInt(request.getParameter("lecture_score")) ;
		
	
		
		bean.setStudent_id(student_id);
		bean.setTeacher_id(teacher_id);
		bean.setS_code(s_code);
		bean.setLecture_score(lecture_score);
		
	
		
		System.out.println(this.getClass() + " doPost()");
		System.out.println(bean);
		
	
		grdao.InsertData(this.bean) ;
		
		String message = "성적이 입력되었습니다." ;
		super.session.setAttribute("message", message);
		new CosmoAllListController().doGet(request, response);	
	}
}
