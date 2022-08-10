package cosmo.manager.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cosmo.common.controller.SuperClass;

import cosmo.member.bean.Teacher;
import cosmo.member.dao.MemberDao;
import cosmo.utility.FlowParameters;
import cosmo.utility.Paging;


public class ManagerTeacherController extends SuperClass {
	MemberDao mdao = null;
	Teacher bean = null;
	public ManagerTeacherController() {
		
		this.mdao = new MemberDao();
		this.bean = new Teacher();
	}
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doProcess(request,response);
		
		FlowParameters parameters = new FlowParameters(
				request.getParameter("pageNumber"), 
				request.getParameter("pageSize"), 
				request.getParameter("mode"), 
				request.getParameter("keyword"));
		
System.out.println(this.getClass() + " : " + parameters.toString() );
		
		int totalCount =this.mdao.GetTotalCount2(parameters.getMode(),parameters.getkeyword()); 
		String url=super.getUrl("manStuList");
		
		Paging pageInfo = new Paging(
				parameters.getPageNumber(),
				parameters.getPageSize(),
				totalCount,
				url,
				parameters.getMode(),
				parameters.getkeyword());
		
		List<Teacher> lists = this.mdao.showAllTeacher(parameters.getMode(),parameters.getkeyword(),pageInfo.getBeginRow(),pageInfo.getEndRow());
		request.setAttribute("lists", lists);
		//페이징 관련된 항목들
		request.setAttribute("pageInfo", pageInfo);
		//상세보기, 수정, 삭제, 답글 등의 링크에 사용될 파라미터 리스트 문자열
		request.setAttribute("parameters", parameters);
		
		String gotopage = "/manager/allTeacher.jsp";
		super.GotoPage(gotopage);
		
		
	}
}
