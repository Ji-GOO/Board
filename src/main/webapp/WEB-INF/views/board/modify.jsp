<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="../includes/header.jsp" %>

			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">게시글 수정</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
					
						<div class="panel-heading">게시글 수정</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
						
							<form role="form" action="/board/modify" method="post">
								<input type="hidden" name="pageNumber" value='<c:out value="${paging.pageNumber}"/>'>
								<input type="hidden" name="amount" value='<c:out value="${paging.amount}"/>'>
								
								<div class="form-group">
									<label>글번호</label>
									<input class="form-control" name="idx" value='<c:out value="${post.idx}" />' readonly="readonly">
								</div>
								
								<div class="form-group">
									<label>제목</label>
									<input class="form-control" name="title" value='<c:out value="${post.title}" />'>
								</div>
								
								<div class="form-group">
									<label>내용</label>
									<textarea class="form-control" name="content" rows="3"><c:out value="${post.content}" /></textarea>
								</div>
								
								<div class="form-group">
									<label>작성자</label>
									<input class="form-control" name="username" value='<c:out value="${post.username}"/>' readonly="readonly">
								</div>
								
								<div class="form-group">
									<label>작성일</label>
									<input class="form-control" name="create_date" value='<c:out value="${post.create_date}"/>' readonly="readonly">
								</div>
								
								<button type="submit" data-oper="modify" class="btn btn-default">수정</button>
								<button type="submit" data-oper="delete" class="btn btn-danger">삭제</button>
								<button type="submit" data-oper="list" class="btn btn-info">돌아가기</button>
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
					var formObj = $("form");
					
					$("button").on("click", function(e) {
						e.preventDefault();
						var operation = $(this).data("oper");
						console.log(operation);
						
						if(operation === "delete") {
							formObj.attr("action", "/board/delete");
						} else if(operation === "list") {
							formObj.attr("action", "/board/list").attr("method", "get");
							var pageNumberTag = $("input[name='pageNumber']").clone();
							var amountTag = $("input[name='amount']").clone();
							
							formObj.empty();
							formObj.append(pageNumberTag);
							formObj.append(amountTag);
						}
						
						formObj.submit();
					});
				});
			</script>

<%@ include file="../includes/footer.jsp" %>