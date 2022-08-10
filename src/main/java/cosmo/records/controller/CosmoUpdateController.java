package cosmo.records.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cosmo.common.controller.MainController;
import cosmo.common.controller.SuperClass;
import cosmo.records.bean.Grade;
import cosmo.records.dao.GrDao;


public class CosmoUpdateController extends SuperClass {
	GrDao grdao = null;
	Grade bean = null;
	
	public CosmoUpdateController() {
		this.grdao = new GrDao();
		this.bean = new Grade();
	}
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doProcess(request, response);
		
		String id = request.getParameter("id") ;
		String s_code = request.getParameter("s_code");
		this.bean = this.grdao.SelectOne(id,s_code) ;	
		
		request.setAttribute("bean", this.bean);
		
		String gotopage = "/records/cosmoUpdateForm.jsp";
		super.GotoPage(gotopage);
	}
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doProcess(request, response);
		
		String student_id = request.getParameter("student_id");
		String teacher_id = request.getParameter("teacher_id");
		String s_code = request.getParameter("s_code");
		int lecture_score = Integer.parseInt(request.getParameter("lecture_score")) ;
//		String remark = request.getParameter("remark") ;
		
		this.bean.setStudent_id(student_id);
		this.bean.setTeacher_id(teacher_id);
		this.bean.setS_code(s_code);
		this.bean.setLecture_score(lecture_score);
//		this.bean.setRemark(remark);
		
		
		System.out.println(this.getClass() + " doPost()");
		System.out.println(bean);
		
		grdao.UpdateData(this.bean) ;

		String message = "성적이 수정되었습니다." ;
		super.session.setAttribute("message", message);
		new CosmoAllListController().doGet(request, response);		
	}
}




