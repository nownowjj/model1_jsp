package cosmo.common.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MainController extends SuperClass {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doProcess(request, response);
		// 일단 메인 페이지는 로그인하는 페이지로
		String gotopage = "/common/main.jsp";
		super.GotoPage(gotopage);
	}
}
