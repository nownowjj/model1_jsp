package cosmo.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cosmo.common.controller.SuperClass;

import cosmo.member.dao.MemberDao;

public class MemberLogoutController extends SuperClass{
	
	public MemberLogoutController() {
		
	}

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doProcess(request,response);
		
		
		super.session.invalidate();
		
		String gotopage="/common/main.jsp";
		super.GotoPage(gotopage);
	}

}
