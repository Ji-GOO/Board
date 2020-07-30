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
					
						<div class="panel-heading">게시글</div>
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
									<label>작성시간</label>
									<input class="form-control" name="create_date" value='작성시간 : <c:out value="${post.create_date}"/> / 수정시간 : <c:out value="${post.modify_date}"/>' readonly="readonly">
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
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-dafault">
						<div class="panel-heading">
							<i class="fa fa-comments fa-fw"></i> 댓글
							<button id="addCommentBtn" class="btn btn-primary btn-xs pull-right">댓글 작성</button>
						</div>
						
						<div class="panel-body">
							<ul class="chat">
								<li class="left clearfix" data-rno="12">
									<div>
										<div class="header">
											<strong class="primary-font">user00</strong>
											<small class="pull-right text-muted">2020-07-30 00:52</small>
										</div>
										<p>잘하셨습니다!</p>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			
			<!-- Modal -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">댓글 작성창</h4>
						</div>
						
						<div class="modal-body">
							<div class="form-group">
								<label>댓글 내용</label>
								<input class="form-control" name="content" value="댓글 내용">
							</div>
							<div class="form-group">
								<label>작성자</label>
								<input class="form-control" name="username" value="작성자">
							</div>
							<div class="form-group">
								<label>작성일</label>
								<input class="form-control" name="create_date" value="">
							</div>
						</div>
						
						<div class="modal-footer">
							<button id="modalModifyBtn" type="button" class="btn btn-warning">수정</button>
							<button id="modalDeleteBtn" type="button" class="btn btn-danger">삭제</button>
							<button id="modalCreateBtn" type="button" class="btn btn-primary">등록</button>
							<button id="modalCloseBtn" type="button" class="btn btn-default">취소</button>
						</div>
					</div>
				</div>
			</div>
			
			<script type="text/javascript" src="/resources/js/comment.js"></script>
			
			<script>
				$(document).ready(function() {
					var idxValue = '<c:out value="${post.idx}" />';
					var commentUL = $(".chat");
					
					showList(1);
					
					function showList(page) {
						commentService.getAllComment({idx:idxValue, page:page || 1}, function(list) {
							var str = "";
							
							if(list == null || list.length == 0) {
								commentUL.html("");
								
								return;
							}
							
							for(var i = 0, len = list.length || 0; i < len; i++) {
								str += "<li class='left clearfix' data-rno='" + list[i].id + "'>";
								str += "<div><div class='header'><strong class='primary-font'>" + list[i].username + "</strong>";
								str += "<small class='pull-right text-muted'>" + list[i].create_date + "</small></div>";
								str += "<p>" + list[i].content + "</p></div></li>";
							}
							
							commentUL.html(str);
						});
					}
					
					var modal = $(".modal");
					var modalInputContent = modal.find("input[name='content']");
					var modalInputUsername = modal.find("input[name='username']");
					var modalInputCreateDate = modal.find("input[name='create_date']");
					
					var modalModifyBtn = $("#modalModifyBtn");
					var modalDeleteBtn = $("#modalDeleteBtn");
					var modalCreateBtn = $("#modalCreateBtn");
					
					$("#addCommentBtn").on("click", function(e) {
						modal.find("input").val("");
						modalInputCreateDate.closest("div").hide();
						modal.find("button[id != 'modalCloseBtn']").hide();
						
						modalCreateBtn.show();
						
						$(".modal").modal("show");
					});
					
					modalCreateBtn.on("click", function(e) {
						var comment = {
								content : modalInputContent.val(),
								username : modalInputUsername.val(),
								post_id : idxValue
						};
						
						commentService.createComment(comment, function(result) {
							alert(result);
							
							modal.find("input").val("");
							modal.modal("hide");
							
							showList(1);
						});
					});
					
					$(".chat").on("click", "li", function(e) {
						var rno = $(this).data("rno");
						
						commentService.getOneComment(rno, function(comment) {
							modalInputContent.val(comment.content);
							modalInputUsername.val(comment.username);
							modalInputCreateDate.val(comment.create_date).attr("readonly", "readonly");
							modal.data("rno", comment.id);
							
							modal.find("button[id != 'modalCloseBtn']").hide();
							modalModifyBtn.show();
							modalDeleteBtn.show();
							
							$(".modal").modal("show");
						});
					});
					
					modalModifyBtn.on("click", function(e) {
						var comment = {id : modal.data("rno"), content : modalInputContent.val()};
						
						commentService.modifyComment(comment, function(result) {
							alert(result);
							modal.modal("hide");
							showList(1);
						});
					});
					
					modalDeleteBtn.on("click", function(e) {
						var rno = modal.data("rno");
						
						commentService.deleteComment(rno, function(result) {
							alert(result);
							modal.modal("hide");
							showList(1);
						});
					});
				});
			
				/* console.log("=============");
				console.log("JS TEST");
				
				var idxValue = '<c:out value="${post.idx}" />'; */
				
				/* commentService.getOneComment(10, function(data) {
					console.log(data);
				}) */
				
				/* commentService.modifyComment({
					id : 15,
					post_id : idxValue,
					content : "자바스크립트로 수정되는 내용입니다."
				}, function(result) {
					alert("수정 완료!");
				}); */
				
				/* commentService.deleteComment(16, function(count) {
					console.log(count);
					
					if(count === "success") {
						alert("DELETE");
					}
				}, function(err) {
					alert("ERROR");
				}); */
				
				/* commentService.getAllComment({idx:idxValue, page:1}, function(list) {
					for(var i = 0, len = list.length || 0; i < len; i++) {
						console.log(list[i]);
					}
				}); */
				
				/* commentService.createComment(
						{content : "JS TEST", username : "자바스크립트 테스터", post_id : idxValue},
						function(result) {
							alert("RESULT : " + result);
						}
				); */
			</script>
			
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