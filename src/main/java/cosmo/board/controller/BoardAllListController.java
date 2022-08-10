package cosmo.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cosmo.board.bean.Testboard;
import cosmo.board.dao.TestboardDao;
import cosmo.common.controller.SuperClass;

public class BoardAllListController extends SuperClass {
		TestboardDao bdao = null; 
		Testboard bean = null;
		
		
		public BoardAllListController() {
			this.bdao = new TestboardDao();
			this.bean = new Testboard();
		}
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doProcess(request,response);

		
		List<Testboard> lists = this.bdao.SelectAll();
		System.out.println("게시물 :" + lists.size());
		
		request.setAttribute("lists", lists);
		
		String gotopage = "/board/boList.jsp";
		super.GotoPage(gotopage);
	}
		
}






