package cosmo.manager.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cosmo.common.controller.SuperClass;
import cosmo.member.bean.Student;
import cosmo.member.dao.MemberDao;
import cosmo.utility.FlowParameters;
import cosmo.utility.Paging;


public class ManagerStudentController extends SuperClass {
	MemberDao mdao = null;
	Student bean = null;
	public ManagerStudentController() {
		
		this.mdao = new MemberDao();
		this.bean = new Student();
	}
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doProcess(request,response);
		
		FlowParameters parameters = new FlowParameters(
				request.getParameter("pageNumber"), 
				request.getParameter("pageSize"), 
				request.getParameter("mode"), 
				request.getParameter("keyword"));
		
		
		int totalCount = this.mdao.GetTotalCount(parameters.getMode(),parameters.getkeyword());
		String url=super.getUrl("mamStuList");
		
		Paging pageInfo = new Paging(
				parameters.getPageNumber(),
				parameters.getPageSize(),
				totalCount,
				url,
				parameters.getMode(),
				parameters.getkeyword());
		
		List<Student> lists = this.mdao.showAllStudent(parameters.getMode(),parameters.getkeyword(),pageInfo.getBeginRow(),pageInfo.getEndRow());
		System.out.println("리스트 수 : " + lists.size());
		request.setAttribute("lists", lists);
		//페이징 관련된 항목들
		request.setAttribute("pageInfo", pageInfo);
		//상세보기, 수정, 삭제, 답글 등의 링크에 사용될 파라미터 리스트 문자열
		request.setAttribute("parameters", parameters);;
		
		String gotopage = "/manager/allStudent.jsp";
		super.GotoPage(gotopage);
		
		
	}
}
