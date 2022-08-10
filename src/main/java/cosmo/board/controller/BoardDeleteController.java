package cosmo.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cosmo.board.bean.Testboard;
import cosmo.board.dao.TestboardDao;
import cosmo.common.controller.SuperClass;

public class BoardDeleteController extends SuperClass {
		TestboardDao bdao = null; 
		Testboard bean = null;
		
		
		public BoardDeleteController() {
			this.bdao = new TestboardDao();
		}
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doProcess(request,response);
		
		int b_no = Integer.parseInt(request.getParameter("b_no"));
		this.bdao.DeleteData(b_no);
		
		new BoardAllListController().doGet(request, response);
	}
	
}






