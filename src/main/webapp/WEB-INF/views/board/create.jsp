<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="../includes/header.jsp" %>

			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">게시글 등록</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
					
						<div class="panel-heading">게시글 등록</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							
							<form role="form" action="/board/postcreate" method="post">
								<div class="form-group">
									<label>제목</label>
									<input class="form-control" name="title">
								</div>
								
								<div class="form-group">
									<label>내용</label>
									<textarea class="form-control" rows="3" name="content"></textarea>
								</div>
								
								<div class="form-group">
									<label>작성자</label>
									<input class="form-control" name="username">
								</div>
								
								<button type="submit" class="btn btn-default">등록</button>
								<button type="button" class="btn btn-info" onclick="location.href='/board/list'">취소</button>
							</form>
							
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->

<%@ include file="../includes/footer.jsp" %>