<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../includes/header.jsp" %>

<div class="container">
	<table class="table table-hover">
		<thead>
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>날짜</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>1</td>
				<td><a href="/">헬로우</a></td>
				<td>hello</td>
				<td>2020/07/16</td>
				<td>23</td>
			</tr>
		</tbody>
	</table>
	
	<a class="btn btn-default pull-right">글쓰기</a>
</div>

<%@ include file="../includes/footer.jsp" %>