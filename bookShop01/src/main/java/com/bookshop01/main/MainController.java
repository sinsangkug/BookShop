package com.bookshop01.main;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bookshop01.common.base.BaseController;
import com.bookshop01.goods.service.GoodsService;
import com.bookshop01.goods.vo.GoodsVO;


//@Controller("mainController"): 해당 클래스를 컨트롤러로 지정하며, 빈의 이름을 "mainController"로 설정한다.
//@EnableAspectJAutoProxy: AOP를 사용하기 위한 어노테이션으로, 이를 설정하면 자동으로 AOP 프록시를 생성하여 적용한다.
@Controller("mainController")
@EnableAspectJAutoProxy
public class MainController extends BaseController {
	
	//GoodsServiceImpl.java파일에 작성 해 놓은 
	//public class GoodsServiceImpl implements GoodsService {} 의
	//<bean>을 자동 주입 합니다.
	@Autowired
	private GoodsService goodsService;

//http://localhost:8090/bookshop01/main/main.do 주소를 입력하면  main화면을 요청!
//해당 메서드는 요청에 대한 뷰를 지정하고, 상품 목록 정보를 ModelAndView 객체에 추가하여 반환한다. 이 정보는 JSP에서 사용될 수 있다.	
	
	//메서드가 처리할 요청 URL을 "/main/main.do"로 설정하고, HTTP 메서드는 GET과 POST 둘 다 처리할 수 있도록 지정한다.
	@RequestMapping(value= "/main/main.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		HttpSession session;
		
		ModelAndView mav=new ModelAndView();
		
		//sevlet-context.xml파일에 설정한 
		//ViewNameInterceptor 객체(bean)의  preHandle메소드 내부에서 
		//http://localhost:8090/bookshop01/main/main.do 주소를 입력하면
		//요청한 전체 주소 중에서  /main/main 뷰 주소를 만들어서 request에 저장 했습니다. 
		//request에서 다시 /main/main 뷰 주소를 꺼내옵니다.
		String viewName=(String)request.getAttribute("viewName");  
		mav.setViewName(viewName); //  /main/main  뷰 주소 저장
		
		session=request.getSession();
		session.setAttribute("side_menu", "user");
		
		Map<String,List<GoodsVO>> goodsMap=goodsService.listGoods();
		mav.addObject("goodsMap", goodsMap);
		return mav;
	}
}





