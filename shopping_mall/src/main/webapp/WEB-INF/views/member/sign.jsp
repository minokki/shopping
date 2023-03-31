<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/member/sign.css">

<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
  
</head>
<body>

<div class="wrapper">
	<form id="sign_form" method="post">
	<div class="wrap">
			<div class="subjecet">
				<span>회원가입</span>
			</div>
			<div class="id_wrap">
				<div class="id_name">아이디</div>
				<div class="id_input_box">
					<input class="id_input" name="memberId">
				</div>
				<span class="id_input_re_1">사용 가능한 아이디입니다.</span>
				<span class="id_input_re_2">아이디가 이미 존재합니다.</span>
				<span class="id_ck">아이디를 입력해주세요.</span>
			</div>
			<div class="pw_wrap">
				<div class="pw_name">비밀번호</div>
				<div class="pw_input_box">
					<input class="pw_input" name="memberPw" type="password">
				</div>
				<span class="pw_ck">비밀번호를 입력해주세요.</span>
			</div>
			<div class="pwck_wrap">
				<div class="pwck_name">비밀번호 확인</div>
				<div class="pwck_input_box">
					<input class="pwck_input" type="password">
				</div>
				<span class="pwck_input_re_1">비밀번호가 일치합니다.</span>
                <span class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span>
				<span class="pwck_ck">비밀번호 확인을 입력해주세요.</span>
			</div>
			<div class="user_wrap">
				<div class="user_name">이름</div>
				<div class="user_input_box">
					<input class="user_input"name="memberName">
				</div>
				<span class="name_ck">이름을 입력해주세요.</span>
			</div>
			<div class="mail_wrap">
				<div class="mail_name">이메일</div> 
				<div class="mail_input_box">
					<input class="mail_input" name="memberMail">
				</div>
				<span class="mail_ck">이메일을 입력해주세요.</span>
				<sapn class="mail_input_box_warn"></sapn>
				<div class="mail_check_wrap">
					<div class="mail_check_input_box" id="mail_check_input_box_false">
						<input class="mail_check_input" disabled="disabled">
					</div>
					<div class="mail_check_button">
						<span>인증번호 전송</span>
					</div>
					<div class="clearfix"></div>
					 <span id="mail_check_input_box_warn"></span>
				</div>
			</div>
			<div class="address_wrap">
				<div class="address_name">주소</div>
				<div class="address_input_1_wrap">
					<div class="address_input_1_box">
						<input class="address_input_1" name="memberAddr1" readonly="readonly">
					</div>
					<div class="address_button" onclick="daum_address()"> <!-- 버튼클릭시 해당 함수실행 -->
						<span>주소 찾기</span>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class ="address_input_2_wrap">
					<div class="address_input_2_box">
						<input class="address_input_2" name="memberAddr2" readonly="readonly">
					</div>
				</div>
				<div class ="address_input_3_wrap">
					<div class="address_input_3_box">
						<input class="address_input_3" name="memberAddr3" readonly="readonly">
					</div>
					<span class="addr_ck">주소를 입력해주세요.</span>
				</div>
			</div>
			<div class="sign_button_wrap">
				<input type="button" class="sign_button" value="가입하기">
			</div>
		</div>
	</form>
</div>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- 외부 스크립트 추가 ,주소록(통합로딩방식) -->
<script>
	/* 이메일 전송 인증번호 저장하기 위한코드 */
	var code = ""; 
	
	 /* 유효성 검사 통과유무 변수 false로 초기화 */
	 var idCheck = false;            // 아이디
	 var idckCheck = false;            // 아이디 중복 검사
	 var pwCheck = false;            // 비번
	 var pwckCheck = false;            // 비번 확인
	 var pwckcorCheck = false;        // 비번 확인 일치 확인
	 var nameCheck = false;            // 이름
	 var mailCheck = false;            // 이메일
	 var mailnumCheck = false;        // 이메일 인증번호 확인
	 var addressCheck = false         // 주소

$(document).ready(function() {
	
	//회원가입 버튼(버튼클릭시 /member/sign 맵핑으로 이동)
	$(".sign_button").click(function () {
		
	     /* 입력값 변수 */
        var id = $('.id_input').val();                 // id 입력란
        var pw = $('.pw_input').val();                // 비밀번호 입력란
        var pwck = $('.pwck_input').val();            // 비밀번호 확인 입력란
        var name = $('.user_input').val();            // 이름 입력란
        var mail = $('.mail_input').val();            // 이메일 입력란
        var addr = $('.address_input_3').val();        // 주소 입력란
        
        //아이디 작성되었는지 유효성 검사
        if(id == ""){
        	$('.id_ck').css('display','block');
        	idcheck =false;
        }else{
        	$('.id_ck').css('display','none');
        	idCheck = true;
        }
        // 비밀번호 유효성 검사
        if(pw == ""){
            $('.pw_ck').css('display','block');
            pwCheck = false;
        }else{
            $('.pw_ck').css('display', 'none');
            pwCheck = true;
        }
        // 비밀번호 확인 유효성 검사
        if(pwck == ""){
            $('.pwck_ck').css('display','block');
            pwckCheck = false;
        }else{
            $('.pwck_ck').css('display', 'none');
            pwckCheck = true;
        }  
         // 이름 유효성 검사
        if(name == ""){
            $('.name_ck').css('display','block');
              nameCheck = false;
        }else{
            $('.name_ck').css('display', 'none');
            nameCheck = true; 
        }
        // 이메일 유효성 검사
        if(mail == ""){
            $('.mail_ck').css('display','block');
            mailCheck = false;
        }else{
            $('.mail_ck').css('display', 'none');
            mailCheck = true;
        }
        // 주소 유효성 검사
        if(addr == ""){
            $('.addr_ck').css('display','block');
            addressCheck = false;
        }else{
            $('.addr_ck').css('display', 'none');
            addressCheck = true;
        }
 		
        /* 최종 유효성 검사 */
        if(idCheck&&idckCheck&&pwCheck&&pwckCheck&&pwckcorCheck&&nameCheck&&mailCheck&&mailnumCheck&&addressCheck ){
        	$("#sign_form").attr("action","/member/sign");
    		$("#sign_form").submit();
        }  
        return false;
		
		
	});
	
});
	/* 인증번호 이메일 전송 */
	$(".mail_check_button").click(function(){
	    
	    var email = $(".mail_input").val();  //입력한 이메일
	    var mailChcBox = $(".mail_check_input"); //인증번호 입력란
	    var boxWrap= $(".mail_check_input_box"); //인증번호 입력란 박스
	    var emailMsg = $(".mail_input_box_warn"); //이메일 입력 경고글
	    
	    if(mailFormCheck(email)){
	    	emailMsg.html("이메일이 전송되었습니다. 이메일을 확인해주세요");
	    	emailMsg.css("display","inline-block");
	    	emailMsg.css("color","green");
	    }else{
	    	emailMsg.html("올바르지 못한 이메일 형식입니다.");
	    	emailMsg.css("display","inline-block");
	    	emailMsg.css("color","red");
	    	return false;
	    }
	    
	    $.ajax({
	        
	        type:"GET",
	        url:"mailCheck?email=" + email,
	        success:function(data){
	   			mailChcBox.attr("disabled",false); //disabled 풀기
	   			boxWrap.attr("id","mail_check_input_box_true"); //id가 mail_check_input_box_true 속셩변경
	   			code = data;
	        	
	      /*   	console.log("data="+data); //정상적으로 반환되었는지 확인 */
	        }
	                
	    });
	});
	    
	  /* 인증번호 비교 */
	   $(".mail_check_input").blur(function () {
		   var inputCode = $(".mail_check_input").val();        // 입력코드    
		   var checkResult = $("#mail_check_input_box_warn");    // 비교 결과 
		   
		   if(inputCode == code){ //일치할경우
			   checkResult.html("인증번호가 일치합니다");
			   checkResult.attr("class", "correct"); //클래스에 correct추가
			   mailnumCheck = true;     // 일치할 경우
		   }else{  //일치하지 않을경우
			   checkResult.html("인증번호를 다시 확인해주세요.");
		        checkResult.attr("class", "incorrect");
		        mailnumCheck = false;    // 일치하지 않을 경우
		   }
		
	});

	
	/* 다음 주소api 연동 */
	function daum_address() {
		
		 new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수

	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                 // 주소변수 문자열과 참고항목 문자열 합치기
	                   addr += extraAddr;
	                
	                } else {
	                   addr += '  ';
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	               $(".address_input_1").val(data.zonecode);
	               $(".address_input_2").val(addr);
	                // 커서를 상세주소 필드로 이동한다.
	               // 상세주소 입력란 disabled 속성 변경 및 커서를 상세주소 필드로 이동한다.
	               $(".address_input_3").attr("readonly",false);
	                $(".address_input_3").focus();
	            }
	        }).open();
}	 
	
	/* 비밀번호 확인 일치 유효성 */
	$('.pwck_input').on("propertychange change keyup paste input", function(){
		var pw = $('.pw_input').val();
		var pwck = $('.pwck_input').val();
		$('pwck_ck').css('display','none');
		if(pw == pwck){
			$('.pwck_input_re_1').css('display','block');
	        $('.pwck_input_re_2').css('display','none');
	        pwckcorCheck = true;
		}else{
			 $('.pwck_input_re_1').css('display','none');
		        $('.pwck_input_re_2').css('display','block');
		        pwckcorCheck = false;
		}
			
	});
	
	/* 아이디 중복검사 */
	$('.id_input').on("propertychange change keyup paste input", function(){

		var memberId = $('.id_input').val(); // id_input에 입력되는 값을 memberId에 저장
		var data = {memberId : memberId} //컨트롤러에 넘길 데이터 이름 : 데이터 
		
		$.ajax({
			type:"post",
			url:"/member/memberIdChk", // 컨트롤러 맵핑되어있는 곳으로 보냄
			data:data,
			success : function (result) {
			/* 	console.log("성공여부" + result); */
				if(result != "fail"){
					$('.id_input_re_1').css("display","inline-block");
					$('.id_input_re_2').css("display","none");
					idckCheck = true;
				}else{
					$('.id_input_re_2').css("display","inline-block");
					$('.id_input_re_1').css("display","none");
					idckCheck = false;
				}
			}
		}); // ajax 종료

	}); //중복검사 종료
	
	/* 이메일 형식 유효성 */
	function mailFormCheck(email) {
		var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
		return form.test(email);
	}
		 

</script>
</body>
</html>