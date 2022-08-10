package cosmo.attendence.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cosmo.attendence.bean.Attendence;
import cosmo.attendence.dao.AttendenceDao;
import cosmo.common.controller.SuperClass;
import cosmo.utility.FlowParameters;
import cosmo.utility.Paging;


public class TeacherAttendenceController extends SuperClass {
	AttendenceDao adao = null;
	Attendence bean = null;
	public TeacherAttendenceController() {
		
		this.adao = new AttendenceDao();
		this.bean = new Attendence();
	}
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doProcess(request,response);
		
		String id = request.getParameter("id");
		
		System.out.println(id);

		FlowParameters parameters = new FlowParameters(
			request.getParameter("pageNumber"), 
			request.getParameter("pageSize"), 
			request.getParameter("mode"), 
			request.getParameter("keyword"));
		
		System.out.println(this.getClass() + " : " + parameters.toString() );
		
		int totalCount =this.adao.GetTotalCount(id,parameters.getMode(),parameters.getkeyword()); 
		String url=super.getUrl("teaAtt");
		
		System.out.println(this.getClass()+" : "+parameters.toString());
		
		Paging pageInfo = new Paging(
				parameters.getPageNumber(),
				parameters.getPageSize(),
				totalCount,
				url,
				parameters.getMode(),
				parameters.getkeyword(),
				id);
		List<Attendence> lists = this.adao.SelectGroup(id,parameters.getMode(),parameters.getkeyword(),pageInfo.getBeginRow(),pageInfo.getEndRow());
		
		System.out.println("리스트 수 : " + lists.size());
		request.setAttribute("lists", lists);
		//페이징 관련된 항목들
		request.setAttribute("pageInfo", pageInfo);
		//상세보기, 수정, 삭제, 답글 등의 링크에 사용될 파라미터 리스트 문자열
		request.setAttribute("parameters", parameters);
		request.setAttribute("teacher_id",id);
		
		String gotopage = "/attendence/mystdnow.jsp";
		super.GotoPage(gotopage);
	}
	
}
