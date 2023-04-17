package com.bookshop01.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class ViewNameInterceptor extends  HandlerInterceptorAdapter{
	
	//컨트롤러 클래스 실행전 요청한 주소에 관하여  뷰주소를 얻어 request메모리에 뷰주소를 저장하는 메소드 
	  // http://localhost:8090/bookshop01/main/main.do
	  // http://localhost:8090/bookshop01/goods/goodsDetail.do
	  // http://localhost:8090/bookshop01/goods/keywordSearch.do  입력한 검색어 단어가 포함된 책제목 자동완성을 위해  검색 AJAX
	  // http://localhost:8090/bookshop01/goods/searchGoods.do 입력한 검색어 단어가 포함된 도서상품 검색 
	  //로그인 <a>를 클릭하여 요청한 주소  http://localhost:8090/bookshop01/member/loginForm.do를 받으면 로그인 요청화면이 나옴 
	  //아이디 비밀번호를 입력하고 로그인 버튼 눌렀을때.. /member/login.do 
	  //header.jsp페이지에서 로그아웃 <a>를 눌러서 로그아웃 요청 주소 /member/logout.do을 받았을때..
	  //header.jsp페이지에서 회원가입 <a>를 눌러 회원가입 요청 주소 /member/memberForm.do을 받았을때... 입력할수 있는 디자인 요청!
	  //memberForm.jsp페이지에서  회원가입시 입력한 아이디가 DB에 존재 하는지 유무 요청 주소 /member/overlapped.do을 받았을때... 
	  //memberForm.jsp페이지에서 회원가입 버튼을 눌러 회원가입 요청주소 /member/addMember.do을 받았을때...
	
	  //goodsDetail.jsp화면에서 장바구니 버튼을 클릭하여 장바구니에 상품을 추가해줘~ 라는 요청 주소 cart/addGoodsInCart.do를 받았을때....
	   
	  //goodsDetail.jsp화면에서 장바구니에 담았습니다 라는 팝업창에 포함된 
	  //장바구니목록 버튼을 클릭하여 장바구니 테이블에 담긴 상품 조회 요청 주소 /cart/myCartList.do를 받았을때...
	  //로그인을 한 상태에서 구매하기(주문하기)를 눌렀을때  구매 요청주소 /order/orderEachGoods.do를 받았을떄..
	 
	
	  //	/admin/goods/adminGoodsMain.do  <a>상품관리
	
	  //adminGoodsMain.jsp에서  상품등록하기 버튼을 클릭하여  상품을 등록할 화면 요청 주소 /admin/goods/addNewGoodsForm.do 를 받았을때
	  @Override
	   public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler){
		   try {
			
			   String viewName = getViewName(request);//  /main/main	
			   										  //  /goods/goodsDetail
 			   										  //  /goods/keywordSearch
			   									      //  /goods/searchGoods
			   										  //  /member/loginForm
			   										  //  /member/login
			   										  //  /member/logout
			   										  //  /member/memberForm
			   										  //   /member/overlapped
			   										  //  /member/addMember
			   										  //  /cart/addGoodsInCart
			   										  //  /cart/myCartList
			   										  // /order/orderEachGoods
			   										  //   /admin/goods/adminGoodsMain
			   										  //  /admin/goods/addNewGoodsForm
			   							
			   
			 //  /board/boardList.do  ->  /board/boardList
			   										  
			   
			   System.out.println("ViewNameInterceptor인터셉터 내부의 preHandle메소드가 만든 뷰주소 : " + viewName);
			
			   request.setAttribute("viewName", viewName);
			   System.out.println("request객체 메모리에 " + viewName + ".jsp 의 뷰명 저장");
		  } catch (Exception e) {
			e.printStackTrace();
		}
		   return true;
	   }

	   @Override
	   public void postHandle(HttpServletRequest request, HttpServletResponse response,
	                           Object handler, ModelAndView modelAndView) throws Exception {
	   }

	   @Override
	   public void afterCompletion(HttpServletRequest request, HttpServletResponse response,
	                                    Object handler, Exception ex)    throws  Exception {
	   }
	   
	   
	   //예) 메인 화면 요청 주소 - http://localhost:8090/bookshop01/main/main.do를 입력하면 
	   ///                  요청한 전체 주소에서 main/main 뷰 전체 주소를 얻기 위한 메소드  
	   private String getViewName(HttpServletRequest request) throws Exception {
			String contextPath = request.getContextPath();
			String uri = (String) request.getAttribute("javax.servlet.include.request_uri");
			if (uri == null || uri.trim().equals("")) {
				uri = request.getRequestURI();
			}

			int begin = 0;
			if (!((contextPath == null) || ("".equals(contextPath)))) {
				begin = contextPath.length();
			}

			int end;
			if (uri.indexOf(";") != -1) {
				end = uri.indexOf(";");
			} else if (uri.indexOf("?") != -1) {
				end = uri.indexOf("?");
			} else {
				end = uri.length();
			}

			String fileName = uri.substring(begin, end);
			if (fileName.indexOf(".") != -1) {
				fileName = fileName.substring(0, fileName.lastIndexOf("."));
			}
			if (fileName.lastIndexOf("/") != -1) {
				fileName = fileName.substring(fileName.lastIndexOf("/",1), fileName.length());
			}
			return fileName;
		}
	}
