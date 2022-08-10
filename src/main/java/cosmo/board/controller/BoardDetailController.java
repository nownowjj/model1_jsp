package cosmo.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cosmo.board.bean.Testboard;
import cosmo.board.dao.TestboardDao;
import cosmo.common.controller.SuperClass;

public class BoardDetailController extends SuperClass {
		TestboardDao bdao = null; 
		Testboard bean = null;
		
		
		public BoardDetailController() {
			this.bdao = new TestboardDao();
			this.bean = new Testboard();
		}
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doProcess(request,response);
		
		int b_no = Integer.parseInt(request.getParameter("b_no"));
		this.bean = this.bdao.SelectOne(b_no); 	// 다오에서 결과를 리턴받고 bean에 담음
		request.setAttribute("bean", this.bean);	//이 결과를 bean이라는 곳에 저장
		
		String gotopage = "/board/boDetail.jsp";
		super.GotoPage(gotopage);
	}
	
}






