<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/admin/shopManage.css?after">
 
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/36.0.1/classic/ckeditor.js"></script>  <!--위지웍 에디터 사용  -->

</head>
</head>
<body>
 
    <div class="wrapper">
        <div class="wrap">
            <!-- gnv_area -->    
            <div class="top_gnb_area">
                <ul class="list">    
                    <li><a href="/">메인 페이지</a></li>
                    <li><a href="/member/logout">로그아웃</a></li>
                    <li>고객센터</li>            
                </ul>
            </div>
            <!-- top_subject_area -->
            <div class="admin_top_wrap">
                <span>관리자 페이지</span>
                
            </div>
            <!-- contents-area -->
            <div class="admin_wrap">
                <!-- 네비영역 -->
                <div class="admin_navi_wrap">
                  <ul>
                      <li >
                          <a class="admin_list_01" href="/admin/shopManage">상품 등록</a>
                      </li>
                      <li>
                          <a class="admin_list_02" href="/admin/shopList">상품 관리</a>
                      </li>
             
                      <lI>
                          <a class="admin_list_05">회원 관리</a>                            
                      </lI>                                                                                             
                  </ul>
                </div>
                <div class="admin_content_wrap">
                    <div class="admin_content_subject"><span>상품 등록</span></div>
                      <div class="admin_content_main">
                    	<form action="/admin/shopManage" method="post" id="enrollForm">
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>물품 이름</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="itemName">
                    				<span class="ck_warn itemName_warn">물품 이름을 입력해주세요.</span>
                    			</div>
                    		</div>
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>물품 카테고리</label>
                    			</div>
                    			<div class="form_section_content">
                    				<div class="cate_wrap">
											<span>대분류</span>
											<select class="cate1">
												<option selected value="none">선택</option>
											</select>
										</div>
										<div class="cate_wrap">
											<span>중분류</span>
											<select class="cate2">
												<option selected value="none">선택</option>
											</select>
										</div>
										<div class="cate_wrap">
											<span>소분류</span>
											<select class="cate3" name="cateCode">
												<option selected value="none">선택</option>
											</select>
										</div> 
										<span class="ck_warn cateCode_warn">카테고리를 선택해주세요.</span>
                    			</div>
                    		</div>          
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>상품 가격</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="itemPrice" value="0">
                    				<span class="ck_warn itemPrice_warn">상품 가격을 입력해주세요.</span>
                    			</div>
                    		</div>               
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>상품 재고</label>
                    				
                    			</div>
                    			<div class="form_section_content">
                    				<input name="itemStock" value="0">
                    				<span class="ck_warn itemStock_warn">상품 재고를 입력해주세요.</span>
                    			</div>
                    		</div>          
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>상품 할인율</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input id="discount_interface" maxlength="2" value="0">
                    				<input name="itemDiscount" type="hidden" value="0">
                    				<span class=discount_val>할인가격 : <span class="discount_price"></span></span>
                    				<span class="ck_warn itemDiscount_warn">상품 할인율을 입력해주세요.</span>
                    			</div>
                    		</div>          		
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>물품 소개</label>
                    			</div>
                    			<div class="form_section_content itemint">
                    				<textarea name="itemIntro" id="itemIntro_textarea"></textarea>
                    				<span class="ck_warn itemIntro_warn">물품 소개를 입력해주세요.</span>
                    			</div>
                    		</div>        		
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>물품 목차</label>
                    			</div>
                    			<div class="form_section_content itemcon" >
                    				<textarea name="itemContents" id="itemContents_textarea"></textarea>
                    				<span class="ck_warn itemContents_warn">물품 목차를 입력해주세요.</span>
                    			</div>
                    		</div>
                   		</form>
                   			<div class="btn_section">
                   				<button id="cancelBtn" class="btn">취 소</button>
	                    		<button id="enrollBtn" class="btn enroll_btn">등 록</button>
	                    	</div> 
                    </div>  
                </div>
                
                <%@include file="../includes/admin/footer.jsp" %>


<script>

	let enrollForm = $("#enrollForm")
	
/* 취소 버튼 */
$("#cancelBtn").click(function(){
	
	location.href="/admin/shopManage"
	
});

/* 상품 등록 버튼 */
$("#enrollBtn").on("click",function(e){
	
	e.preventDefault();  //?
			
	/* 체크 변수 */
	let itemNameCk = false;
	let cateCodeCk = false;
	let priceCk = false;
	let stockCk = false;
	let discountCk = false;
	let introCk = false;
	let contentsCk = false;		
	
	
	/* input태그 변수 선언  */
	let itemName = $("input[name='itemName']").val();
	let cateCode = $("select[name='cateCode']").val();
	let itemPrice = $("input[name='itemPrice']").val();
	let itemStock = $("input[name='itemStock']").val();
	let itemDiscount = $("#discount_interface").val();
	let itemIntro = $(".itemint p").html();
	let itemContents = $(".itemcon p").html();
	/* 유효성  */
	if(itemName){
		$(".itemName_warn").css('display','none');
		itemNameCk = true;
	} else {
		$(".itemName_warn").css('display','block');
		itemNameCk = false;
	}
	
	if(cateCode != 'none'){
		$(".cateCode_warn").css('display','none');
		cateCodeCk = true;
	} else {
		$(".cateCode_warn").css('display','block');
		cateCodeCk = false;
	}	
	
	if(itemPrice != 0){
		$(".itemPrice_warn").css('display','none');
		priceCk = true;
	} else {
		$(".itemPrice_warn").css('display','block');
		priceCk = false;
	}	
	
	if(itemStock != 0){
		$(".itemStock_warn").css('display','none');
		stockCk = true;
	} else {
		$(".itemStock_warn").css('display','block');
		stockCk = false;
	}		
	
	if(!isNaN(itemDiscount)){  //javascript에서 제공 , isNaN()메서드 활용 문자인 경우 true, 아니면 false
		$(".itemDiscount_warn").css('display','none');
		discountCk = true;
	} else {
		$(".itemDiscount_warn").css('display','block');
		discountCk = false;
	}	
	
	if(itemIntro != '<br data-cke-filler="true">'){
		$(".itemIntro_warn").css('display','none');
		introCk = true;
	} else {
		$(".itemIntro_warn").css('display','block');
		introCk = false;
	}	
	
	if(itemContents != '<br data-cke-filler="true">'){
		$(".itemContents_warn").css('display','none');
		contentsCk = true;
	} else {
		$(".itemContents_warn").css('display','block');
		contentsCk = false;
	}		
	if(itemNameCk &&cateCodeCk && priceCk && stockCk && discountCk && introCk && contentsCk ){
		alert('등록완료');
		enrollForm.submit();
	} else {
		return false;
	}

});

$(document).ready(function(){
	
	let eResult = '<c:out value="${enroll_result}"/>';
	
	checkResult(eResult);
	
	function checkResult(result){
		
		if(result === ''){
			return;
		}
		
		alert("상품'"+ eResult +"'을 등록하였습니다.");
		
	}

});

/* 위지윅 적용 */

/* 물품 소개 */
ClassicEditor
	.create(document.querySelector('#itemIntro_textarea'))
	.catch(error=>{
		console.error(error);
	});
	
/* 물품 목차 */	
ClassicEditor
.create(document.querySelector('#itemContents_textarea'))
.catch(error=>{
	console.error(error);
});
//카테고리 리스트 확인
$(document).ready(function(){
	console.log('${cateList}');
});
//카테고리 json 데이터를 객체로 변환 JSON.parse 메서드 활용
		let cateList = JSON.parse('${cateList}');
		
		let cate1Array = new Array();
		let cate2Array = new Array();
		let cate3Array = new Array();
		let cate1Obj = new Object();
		let cate2Obj = new Object();
		let cate3Obj = new Object();
		
		let cateSelect1 = $(".cate1");		
		let cateSelect2 = $(".cate2");
		let cateSelect3 = $(".cate3");
 
		//for문 재사용, 메서드화
		function cateArray(obj,array,cateList,tier) {
			for(let i=0; i < cateList.length; i++){
			if(cateList[i].tier === tier){
				obj = new Object();
				
				obj.cateName = cateList[i].cateName;
				obj.cateCode = cateList[i].cateCode;
				obj.cateParent = cateList[i].cateParent;
				
				array.push(obj);
		}
	}
}

	
	/* 배열 초기화 */
	cateArray(cate1Obj,cate1Array,cateList,1);
	cateArray(cate2Obj,cate2Array,cateList,2);
	cateArray(cate3Obj,cate3Array,cateList,3);
	
	//중분류 추가
	$(cateSelect1).on("change",function(){
		let selectVal1 = $(this).find("option:selected").val();	
		console.log("셀렉트1==="+selectVal1);
		cateSelect2.children().remove();
		cateSelect3.children().remove();
		
		cateSelect2.append("<option value='none'>선택</option>");
		cateSelect3.append("<option value='none'>선택</option>");
		
		
		for(let i = 0; i < cate2Array.length; i++){
			if(selectVal1 === cate2Array[i].cateParent){
				cateSelect2.append("<option value='"+cate2Array[i].cateCode+"'>" + cate2Array[i].cateName + "</option>");	
			}
		}// for
	});

	/* 소분류 <option>태그 */
	$(cateSelect2).on("change",function(){
		
		let selectVal2 = $(this).find("option:selected").val();
		cateSelect3.children().remove();

		cateSelect3.append("<option value='none'>선택</option>");		

		for(let i = 0; i < cate3Array.length; i++){
			if(selectVal2 === cate3Array[i].cateParent){
				cateSelect3.append("<option value='"+cate3Array[i].cateCode+"'>" + cate3Array[i].cateName + "</option>");	
			}
		}// for		
		
	});	
	
	/* 할인률 input */
	$("#discount_interface").on("propertychange change keyup paste input", function(){
		
		let userInput = $("#discount_interface");
		let discountInput = $("input[name='itemDiscount']");
		
		let discountRate = userInput.val(); //유저가 작성한 값을 저장
		let sendDiscount = discountRate / 100; //입력한 값 /100 소수로 만듦.
		
		let costPrice = $("input[name='itemPrice']").val(); // 원가
		let discountPrice = costPrice * (1-sendDiscount); //할인가격  / 상품가격 * (1- (할인율/100))
		
		if(!isNaN(discountRate)){ //문자 입력 유효성 검사
		$(".discount_price").html(discountPrice); //discount_price내용을 discountPrice값으로 변경
		discountInput.val(sendDiscount); //소수로 변한 값을 discountInput에 저장
		}
	});
	$("input[name='itemPrice']").on("change", function () {   //할인율을 작성햇다가 상품 금액을 변경 할시 작동되는 함수
		let userInput = $("#discount_interface");
		let discountInput = $("input[name='itemDiscount']");
		
		let discountRate = userInput.val(); //유저가 작성한 값을 저장
		let sendDiscount = discountRate / 100; //입력한 값 /100 소수로 만듦.
		
		let costPrice = $("input[name='itemPrice']").val(); // 원가
		let discountPrice = costPrice * (1-sendDiscount); //할인가격  / 상품가격 * (1- (할인율/100))
		
		if(!isNaN(discountRate)){
		$(".discount_price").html(discountPrice); //discount_price내용을 discountPrice값으로 변경
	
		}
		
	});
	

</script> 	
 
</body>
</html>
