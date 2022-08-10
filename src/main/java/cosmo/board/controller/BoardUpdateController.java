package cosmo.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cosmo.board.bean.Testboard;
import cosmo.board.dao.TestboardDao;
import cosmo.common.controller.SuperClass;

public class BoardUpdateController extends SuperClass{
		TestboardDao bdao = null; 
		Testboard bean = null;
		
		
		public BoardUpdateController() {
			this.bdao = new TestboardDao();
			this.bean = new Testboard();
		}
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doProcess(request,response);
		
		int b_no = Integer.parseInt(request.getParameter("b_no"));
		this.bean = this.bdao.SelectOne(b_no);
		
		request.setAttribute("bean", this.bean);
		
		String gotopage = "/board/boUpdateForm.jsp";
		super.GotoPage(gotopage);
	}
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doProcess(request,response);
		
		//파라미터 챙기기
		// 글번호 , 조회수 , 작성 일자 , 비고 컬름은 입력 받는 대상이 아닙니다. 
		int b_no = Integer.parseInt(request.getParameter("b_no"));  // 시퀀스로 자동으로 입력됨
		String writer = request.getParameter("writer");
		String b_content = request.getParameter("b_content");
//		String b_date = request.getParameter("b_date");
		String title = request.getParameter("title");
		String lecture_room = request.getParameter("lecture_room");
		
		
		//bean 객체에 셋팅하기
		this.bean.setB_no(b_no);	// 여기 중요 *****
		this.bean.setWriter(writer);
		this.bean.setB_content(b_content);
//		this.bean.setB_date(b_date);
		this.bean.setLecture_room(lecture_room);
		this.bean.setTitle(title);
		
		System.out.println(this.getClass() + "doPost()");
		System.out.println(bean); // 잘들어 왔는지 체크해보려고
		
		//dao 객체에 bean을 이용하여 데이터를 추가합니다.
		this.bdao.UpdateData(bean);
		
		//게시물 목록 페이지로 이동합니다.
		new BoardAllListController().doGet(request, response);
	}
}






