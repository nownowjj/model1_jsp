//package cosmo.records.controller;
//
//import java.io.IOException;
//
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import cosmo.common.controller.MainController;
//import cosmo.common.controller.SuperClass;
//import cosmo.records.dao.GrDao;
//
//
//
//
//public class CosmoDeleteController extends SuperClass {
//	GrDao grdao = null ; 
//	
//	public CosmoDeleteController() {
//		this.grdao = new GrDao() ;
//	}
//	
//	@Override
//	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		super.doProcess(request, response);
//		
//		String id = request.getParameter("student_id") ;
//		
//		this.grdao.DeleteData(id) ;
//		
//		
//		String message = "성적이 삭제되었습니다." ;
//		
//		super.session.setAttribute("message", message) ;
//		new CosmoAllListController().doGet(request, response) ;
//	}
//}