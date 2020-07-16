<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../views/includes/header.jsp" %>

	<div class="container">
		<div class="row">
			<h1>로그인</h1>
			<form action="/login" method="post">
				아이디 : <input type="text" name="userid" maxlength="10"><br>
				비밀번호 : <input type="password" name="password" maxlength="10">
				<input type="submit" value="로그인">
			</form>
		</div>
	</div>
	
<%@ include file="../views/includes/footer.jsp" %>