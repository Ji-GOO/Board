<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="../includes/header.jsp" %>

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">게시판</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            게시글 목록
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>글번호</th>
                                        <th>제목</th>
                                        <th>작성자</th>
                                        <th>작성일</th>
                                        <th>수정일</th>
                                    </tr>
                                </thead>
                                <c:forEach items="${post}" var="post">
                                <tbody>
                                	<tr>
                                		<td><c:out value="${post.idx}" /></td>
                                		<td><a class="move" href='<c:out value="${post.idx}" />'><c:out value="${post.title}" /></a></td>
                                		<td><c:out value="${post.username}" /></td>
                                		<td><c:out value="${post.create_date}" /></td>
                                		<td><c:out value="${post.modify_date}" /></td>
                                	</tr>
                                </tbody>
                                </c:forEach>
                            </table>
                            
                            <div class="pull-right">
                            	<ul class="pagination">
                            		<c:if test="${pageMaker.prev}">
                            			<li class="paginate_button previous"><a href="${pageMaker.startPage - 1}">이전</a></li>
                            		</c:if>
                            		
                            		<c:forEach var="number" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                            			<li class="paginate_button ${pageMaker.paging.pageNumber == number ? 'active' : ''} "><a href="${number}">${number}</a></li>
                            		</c:forEach>
                            		
                            		<c:if test="${pageMaker.next}">
                            			<li class="paginate_button next"><a href="${pageMaker.endPage + 1}">다음</a></li>
                            		</c:if>
                            	</ul>
                            </div>
                            <!--  end Pagination -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            
            <form id="actionForm" action="/board/list" method="get">
            	<input type="hidden" name="pageNumber" value="${pageMaker.paging.pageNumber}">
            	<input type="hidden" name="amount" value="${pageMaker.paging.amount}">
            </form>
            
            <script type="text/javascript">
            	$(document).ready(function() {
            		var result = '<c:out value="${result}" />';
            		checkModal(result);
            		
            		history.replaceState({}, null, null);
            		
            		function checkModal(result) {
            			if(result === '' || history.state) {
            				return;
            			}
            			
            			if(parseInt(result) > 0) {
            				$(".modal-body").html(
            						"게시글 " + parseInt(result) + "번이 등록되었습니다.");
            			}
            			
            			$("#myModal").modal("show");
            		}
            		
            		$("#regBtn").on("click", function() {
            			self.location = "/board/create";	
            		});
            		
            		var actionForm = $("#actionForm");
            		
            		$(".paginate_button a").on("click", function(e) {
            			e.preventDefault();
            			console.log("click");
            			actionForm.find("input[name='pageNumber']").val($(this).attr("href"));
            			actionForm.submit();
            		});
            		
            		$(".move").on("click", function(e) {
            			e.preventDefault();
            			actionForm.append("<input type='hidden' name='idx' value='" + $(this).attr("href") + "'>");
            			actionForm.attr("action", "/board/get");
            			actionForm.submit();
            		});
            	});
            </script>

<%@ include file="../includes/footer.jsp" %>