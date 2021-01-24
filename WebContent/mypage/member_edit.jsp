<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/mypage/member_edit.css" type="text/css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="./js/sign_up.js"></script>
<script>
	$(function(){
		//중복 이메일 체크 ajax
		var mem_email = $('#mem_email').val();
		
		$("#mem_email").keyup(function() {
			$.ajax({
				url: "${pageContext.request.contextPath }/edit_email_check.do",
				dataType: "text",
				data: {
					"mem_email" : $('#mem_email').val()
				},
				success: function(data) {
					$("#email_check").text(data);
				},
				error: function() {
					alert('에러 발생');
				}
			});
		});
	});
	
	function edit_check() {
		if($("#pwd").val() == ""){
			alert("비밀번호를 입력해주세요.");
			$("#pwd").focus();
			return false;
		}
		if($("#mem_name").val() == ""){
			alert("이름을 입력해주세요.");
			$("#mem_name").focus();
			return false;
		}
		if($("#mem_nickname").val() == ""){
			alert("닉네임을 입력해주세요.");
			$("#mem_nickname").focus();
			return false;
		}
		if($("#mem_email").val() == ""){
			alert("이메일을 입력해주세요.");
			$("#mem_email").focus();
			return false;
		}
	}
</script>
</head>
<body>
	
	<jsp:include page="../include/top.jsp" />
	<div class="container">
		<div id="main">
			<div class = "cont_box">
				<jsp:include page="../include/mypage_side.jsp" />

				<div class = "main_box">
					<h2>회원정보 수정</h2>
					<hr width = "65%">
				
				<form class="form-horizontal" method = "post"
					action="<%=request.getContextPath() %>/member_edit_ok.do" onsubmit="return edit_check()">
						<c:set var = "dto" value = "${edit }"/>
						
						<div class ="form-group">
							<label for="mem_id" class = "col-lg-2 control-label">아이디</label>
							<div class = "col-lg-10 " >
							<input type = "text" class = "form-control" name = "mem_id" readonly
							value = "${dto.getMem_id() }">
							</div>
						</div>	
						
						<div class ="form-group">
							<label for="mem_pwd" class = "col-lg-2 control-label">비밀번호</label>
								<div class = "col-lg-10">	
							<input type = "password" class = "form-control" name = "mem_pwd" id = "pwd"> 
								</div>
						</div>	
				
						
							<div class ="form-group">
							<label for="mem_name" class = "col-lg-2 control-label">이름</label>
							<div class = "col-lg-10">	
							<input type = "text" class = "form-control" id = "mem_name" name = "mem_name" 
							value = "${dto.getMem_name() }">	
							</div>
						</div>	
							
							<div class ="form-group">
							<label for="mem_age" class = "col-lg-2 control-label">나이</label>
							<div class = "col-lg-10">	
							<input type = "text" min = "1" max ="999" class = "form-control"
							name = "mem_age" value ="${dto.getMem_age() }">
							</div>
						</div>	
						
						
							<div class ="form-group">
							<label for="mem_nickname" class = "col-lg-2 control-label">닉네임</label>
							<div class = "col-lg-10">
							<input type = "text" class = "form-control" name = "mem_nickname" id = "mem_nickname"
							value = "${dto.getMem_nickname() }">
								
							</div>
						</div>	
							
						
								<div class ="form-group">
							<label for="mem_gender" class = "col-lg-2 control-label">성별</label>
							 <div class = "col-lg-10">	
							 <select class = "form-control" name="mem_gender">
									<option value="M"
									<c:if test="${dto.getMem_gender() == 'M' }">selected</c:if>>남자</option>
									<option value="F"
									<c:if test="${dto.getMem_gender() == 'F' }">selected</c:if>>여자</option>
								</select>
							</div>
							</div>
			
								
							<div class ="form-group">
							<label for="mem_birth" class = "col-lg-2 control-label">생일</label>
								<div class = "col-lg-10">	
								<c:set var = "birth" value = "${dto.getMem_birth() }" />
								<c:set var = "birthArr" value = "${fn:split(birth, '-')}"></c:set>
								<div class = "col-lg-5">
								<select id = "mem_birth_morth" name="mem_birth_month" class ="form-control" >
									<c:forEach begin="1" end="12" var="i">
										<option value='<fmt:formatNumber value="${i }" pattern="00"/>'
										<c:if test = "${birthArr[0] == i}">selected</c:if>><fmt:formatNumber value="${i }" pattern="00월"/></option>
									</c:forEach>
								</select>
								</div>
								
								<div class = "col-lg-5">
								<c:set var ="birth" value = "${dto.getMem_birth() }"/>
								<c:set var = "birthArr" value = "${fn:split(birth,'-')}"></c:set>
								<select id ="mem_birth_day" name="mem_birth_day" class = "form-control">
									<c:forEach begin="1" end="31" var="i">
										<option value='<fmt:formatNumber value="${i }" pattern="00"/>'
										<c:if test = "${birthArr[1] == i}">selected</c:if>><fmt:formatNumber value="${i }" pattern="00일"/></option>
									</c:forEach>
								</select>
									</div>
								</div>
							</div>
							
							<div class ="form-group">
								<c:set var = "addr" value = "${dto.getMem_addr() }" />
								<c:set var = "addrArr" value = "${fn:split(addr, '|')}" />
								<label for="mem_addr" class="col-md-2 control-label">주소</label>
								<div class = "col-lg-10">
									<div class = "input-group">	
									<input type="text" class = "form-control" id="sample4_postcode" placeholder="우편번호" name="mem_addr_1" value = "${addrArr[0] }">
									<span class ="input-group-btn">
										<button type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class ="btn btn-info">우편번호 찾기</button>
									</span>
									</div>
									<br>
								
									<input type="text" class = "form-control" id="sample4_roadAddress" placeholder="도로명주소"><br>
									<input type="text" class = "form-control" id="sample4_jibunAddress" placeholder="지번주소" name="mem_addr_2" value = "${addrArr[1] }"><br>
									<span id="guide" style="color:#999;display:none"></span><br>
									<input type="text" class = "form-control" id="sample4_detailAddress" placeholder="상세주소" name="mem_addr_3" value = "${addrArr[2] }"><br>
									<input type="text" class = "form-control" id="sample4_extraAddress" placeholder="참고항목" name="mem_addr_4"><br>
								</div>
							</div>
							
							
					<div class ="form-group">
							<label for="mem_phone" class = "col-lg-2 control-label">전화번호</label>
							<div class = "col-lg-10">	
							<input type = "text" class = "form-control" name = "mem_number" 
							value = "${dto.getMem_number() }">
							</div>
						</div>	
						
						<div class ="form-group">
							<label for="mem_email" class = "col-lg-2 control-label">이메일</label>
							<div class = "col-lg-10">	
							<input type = "text" class = "form-control" name = "mem_email" id = "mem_email"
							value = "${dto.getMem_email() }">
							</div>
						</div>	
							<div class = "form-group">
								<div class = "col-lg-offset-2 col-lg-10"></div>
								<input type ="submit" class ="btn_blue" value = "수정">
									&nbsp;
								<button onclick = "javascript:history.back()" class ="btn_white">취소</button>
						  </div>
					</form>
					
				</div>
			</div>
		</div>
	</div>

<jsp:include page="../include/bottom.jsp" />