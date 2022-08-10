package cosmo.records.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cosmo.common.controller.SuperClass;
import cosmo.records.bean.Grade;
import cosmo.records.dao.GrDao;

public class CosmoAllListController extends SuperClass{
	GrDao gdao = null;
	Grade bean = null;
	
	public CosmoAllListController() {
		this.gdao = new GrDao();
		this.bean = new Grade();
	}
			
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doProcess(request, response);

		List<Grade> lists = this.gdao.SelectAll();
		
		request.setAttribute("lists", lists);
		
		// 로그인 성공이라고 가정하고
		String gotopage = "/records/cosmoAllListForm.jsp";
		super.GotoPage(gotopage);
	
	}
	
}
