package cosmo.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cosmo.board.bean.Testboard;
import cosmo.board.dao.TestboardDao;
import cosmo.common.controller.SuperClass;

public class BoardInsertController extends SuperClass {
		TestboardDao bdao = null; 
		Testboard bean = null;
		
		
		public BoardInsertController() {
			this.bdao = new TestboardDao();
			this.bean = new Testboard();
		}
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doProcess(request,response);
		
		String gotopage = "/board/boInsertForm.jsp";
		super.GotoPage(gotopage);
		
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doProcess(request,response);
		
		// 파라미터 챙기자
		String writer = request.getParameter("writer"); // 작성자
		String lecture_room = request.getParameter("lecture_room"); // 강의실
		String title = request.getParameter("title"); // 글제목
		String b_content = request.getParameter("b_content"); // 글 내용
		
//		this.bean.setB_date(b_date);
		this.bean.setB_no(0);
		this.bean.setLecture_room(lecture_room);
//		this.bean.setReadhit(0);
		this.bean.setTitle(title);
		this.bean.setWriter(writer);
		this.bean.setB_content(b_content);
		
		System.out.println(this.getClass() + "doPost()");
		System.out.println(bean);
		
		//dao 객체에 bean을 이용하여 데이터를 추가합니다.
		this.bdao.InsertData(bean);
		
		//게시물 목록 페이지로 이동합니다.
		new BoardAllListController().doGet(request, response);
		
		
		
		
	}
	
}






