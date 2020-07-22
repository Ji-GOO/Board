<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="../includes/header.jsp" %>

			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">게시글 읽기</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
					
						<div class="panel-heading">게시글 읽기</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							
							<div class="form-group">
								<label>글번호</label>
								<input class="form-control" name="idx" value='<c:out value="${post.idx}" />' readonly="readonly">
							</div>
							
							<div class="form-group">
								<label>제목</label>
								<input class="form-control" name="title" value='<c:out value="${post.title}" />' readonly="readonly">
							</div>
							
							<div class="form-group">
								<label>내용</label>
								<textarea class="form-control" name="content" rows="3" readonly="readonly"><c:out value="${post.content}" /></textarea>
							</div>
							
							<div class="form-group">
								<label>작성자</label>
								<input class="form-control" name="username" value='<c:out value="${post.username}"/>' readonly="readonly">
							</div>
							
							<div class="form-group">
									<label>작성일</label>
									<input class="form-control" name="create_date" value='<c:out value="${post.create_date}"/>' readonly="readonly">
								</div>
							
							<button data-oper="modify" class="btn btn-default">수정</button>
							<button data-oper="list" class="btn btn-info">돌아가기</button>
							
							<form id="operForm" action="/board/modify" method="get">
								<input type="hidden" id="idx" name="idx" value='<c:out value="${post.idx}" />'>
								<input type="hidden" name="pageNumber" value='<c:out value="${paging.pageNumber}" />'>
								<input type="hidden" name="amount" value='<c:out value="${paging.amount}" />'>
							</form>
							
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			
			<script type="text/javascript">
				$(document).ready(function() {
					var operForm = $("#operForm");
					
					$("button[data-oper='modify']").on("click", function(e) {
						operForm.attr("action", "/board/modify").submit();
					});
					
					$("button[data-oper='list']").on("click", function(e) {
						operForm.find("#idx").remove();
						operForm.attr("action", "/board/list")
						operForm.submit();
					});
				});
			</script>

<%@ include file="../includes/footer.jsp" %>