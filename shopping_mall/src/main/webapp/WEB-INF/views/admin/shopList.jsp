<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/admin/shopList.css?after">
 
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
</head>
<body>
 
    <%@include file="../includes/admin/header.jsp" %>
    
        
                <div class="admin_content_wrap">
                    <div class="admin_content_subject"><span>상품관리</span></div>
               
      			
      			<div class="shop_table_wrap">
                    	<!-- 상품 리스트 O -->
	                    <c:if test="${listcheck != 'empty'}">
	                    	<table class="shop_table">
	                    		<thead>
	                    			<tr>
										<td class="th_column_1">상품 번호</td>
	                    				<td class="th_column_2">상품 이름</td>
	                    				<td class="th_column_4">카테고리</td>
	                    				<td class="th_column_5">재고</td>
	                    				<td class="th_column_6">등록날짜</td>
	                    			</tr>
	                    		</thead>	
	                    		<c:forEach items="${list}" var="list">
	                    		<tr>
	                    			<td><c:out value="${list.itemId}"></c:out></td>
	                    			<td>
	                    			<a class="move" href='<c:out value="${list.itemId}"/>'>
	                    			<c:out value="${list.itemName}"></c:out>
	                    			</a>
	                    			</td>
	                    			<td><c:out value="${list.cateName}"></c:out></td>
	                    			<td><c:out value="${list.itemStock}"></c:out></td>
	                    			<td><fmt:formatDate value="${list.regDate}" pattern="yyyy-MM-dd"/></td>
	                    		</tr>
	                    		</c:forEach>
	                    	</table>
	                    </c:if>
	       <%--              <!-- 상품 리스트 X -->
                		<c:if test="${listCheck == 'empty'}">
                			<div class="table_empty">
                				등록된 작가가 없습니다.
                			</div>
                		</c:if>  --%>
                	</div>
                	
                	<!-- 검색 영역 -->
                	<div class="search_wrap">
                		<form id="searchForm" action="/admin/shopList" method="get">
                			<div class="search_input">
                    			<input type="text" name="keyword" value='<c:out value="${pageMaker.page.keyword}"></c:out>'>
                    			<input type="hidden" name="pageNum" value='<c:out value="${pageMaker.page.pageNum }"></c:out>'>
                    			<input type="hidden" name="amount" value='${pageMaker.page.amount}'>
                    			<input type="hidden" name="type" value="G">
                    			<button class='btn search_btn'>검 색</button>                				
                			</div>
                		</form>
                	</div>
                	
                	<!-- 페이지 이름 인터페이스 영역 -->
                	<div class="pageMaker_wrap">
                		<ul class="pageMaker">
                			
                			<!-- 이전 버튼 -->
                			<c:if test="${pageMaker.prev }">
                				<li class="pageMaker_btn prev">
                					<a href="${pageMaker.pageStart -1}">이전</a>
                				</li>
                			</c:if>
                			
                			<!-- 페이지 번호 -->
                			<c:forEach begin="${pageMaker.pageStart }" end="${pageMaker.pageEnd }" var="num">
                				<li class="pageMaker_btn ${pageMaker.page.pageNum == num ? 'active':''}">
                					<a href="${num}">${num}</a>
                				</li>	
                			</c:forEach>
                		
	                    	<!-- 다음 버튼 -->
	                    	<c:if test="${pageMaker.next}">
	                    		<li class="pageMaker_btn next">
	                    			<a href="${pageMaker.pageEnd + 1 }">다음</a>
	                    		</li>
	                    	</c:if>
	                    </ul>
                	</div>
                	
                	<form id="moveForm" action="/admin/shopList" method="get" >
 						<input type="hidden" name="pageNum" value="${pageMaker.page.pageNum}">
						<input type="hidden" name="amount" value="${pageMaker.page.amount}">
						<input type="hidden" name="keyword" value="${pageMaker.page.keyword}">
                	</form>
 
        		
        		 </div>
       <%@include file="../includes/admin/footer.jsp" %>       
      
  <script>
  let searchForm = $('#searchForm');
  let moveForm = $('#moveForm');

  /* 작거 검색 버튼 동작 */
  $("#searchForm button").on("click", function(e){
  	
  	e.preventDefault();
  	
  	/* 검색 키워드 유효성 검사 */
  	if(!searchForm.find("input[name='keyword']").val()){
  		alert("키워드를 입력하십시오");
  		return false;
  	}
  	
  	searchForm.find("input[name='pageNum']").val("1");
  	
  	searchForm.submit();
  	
  });


  /* 페이지 이동 버튼 */
  $(".pageMaker_btn a").on("click", function(e){
  	
  	e.preventDefault();
  	
  	moveForm.find("input[name='pageNum']").val($(this).attr("href"));
  	
  	moveForm.submit();
  	
  });
  
  /* 상품 조회 페이지 */
  $(".move").on("click", function(e){
  	
  	e.preventDefault();
  	
  	moveForm.append("<input type='hidden' name='itemId' value='"+$(this).attr("href") + "'>");
  	moveForm.attr("action", "/admin/view");
  	moveForm.submit();
  	
  	
  });
  
  /* 수정 성공 메세지 */
	let modify_result = '${modify_result}';
	
	if(modify_result == 1){
		alert("수정 완료");
	}
	
	/* 삭제 결과 메세지 */
	let delete_result = '${delete_result}';
	
	if(delete_result == 1){
		alert("삭제 완료");
	}
	
  </script>
</body>
</html>
