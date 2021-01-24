<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<jsp:include page="../include/top.jsp" />
	<div class="container">
		<div id="main">
			<div class = "cont_box">
				<jsp:include page="../include/mypage_side.jsp" />

				<div class = "main_box">
					
					<h3>회원 상세정보</h3>
				
					<form class="form-horizontal" action = "member_edit.do">
						<c:set var = "dto" value ="${cont }"/>
						<c:if test ="${!empty dto }">
						
						<div class ="form-group">
							<label for="id" class = "col-md-2 control-label">아이디</label>
							<div class = "col-md-10 " >
							<p class = "form-control-static">${dto.getMem_id() }</p>
						</div>
						</div>
						<div class ="form-group">
							<label for="pwd" class = "col-md-2 control-label">비밀번호</label>
							<div class = "col-md-10 " >
							<p class = "form-control-static" >${dto.getMem_pwd() }</p>
						</div>
						</div>
						<div class ="form-group">
							<label for="id" class = "col-md-2 control-label">나이</label>
							<div class = "col-md-10 " >
							<p class = "form-control-static">${dto.getMem_age() }</p>
						</div>
						</div>
						<div class ="form-group">
							<label for="id" class = "col-md-2 control-label">닉네임</label>
							<div class = "col-md-10 " >
							<p class = "form-control-static">${dto.getMem_nickname() }</p>
						</div>
						</div>
						<div class ="form-group">
							<label for="id" class = "col-md-2 control-label">성별</label>
							<div class = "col-md-10 " >
							<p class = "form-control-static">${dto.getMem_gender()  }</p>
						</div>
						</div>
						<div class ="form-group">
							<label for="id" class = "col-md-2 control-label">생일</label>
								<div class = "col-md-10 " >
							<p class = "form-control-static">${dto.getMem_birth() }</p>
							</div>
						</div>
						<div class ="form-group">
							<label for="id" class = "col-md-2 control-label">주소</label>
								<div class = "col-md-10 " >
							<p class = "form-control-static">${dto.getMem_addr() }</p>
							</div>
						</div>
						<div class ="form-group">
							<label for="id" class = "col-md-2 control-label">전화번호</label>
								<div class = "col-md-10 " >
							<p class = "form-control-static">${dto.getMem_number() }</p>
							</div>
						</div>
						<div class ="form-group">
							<label for="id" class = "col-md-2 control-label">이메일</label>
								<div class = "col-md-10 " >
							<p class = "form-control-static">${dto.getMem_email() }</p>
							</div>
						</div>
						<div class = "form-group">
							<div class = "col-lg-offset-2 col-lg-10"></div>
							<button type = "submit" class ="btn_blue">수정</button>
						</div>
			
					</c:if>
				</form>	
					
				</div>
			</div>
		</div>
	</div>
<jsp:include page="../include/bottom.jsp" />