<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>


<html>
<head>
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
* {font-family: 'Nanum Gothic', sans-serif;}


.main-sidebar, .main-footer {	display: none;}
.content-wrapper {	margin: 0px;}
</style>

<title>list.jsp</title>
</head>
<body>
	<!-- Main content -->
		<div class="row">
			<!-- left column -->


			<div class="col-md-12">
				<!-- general form elements -->
				<div class='box'>
					<div class="box-header with-border">
						<h3 class="box-title">FREE BOARD</h3>
					</div>


					<div class='box-body'>

						<select name="searchType">
							<option value="n"
								<c:out value="${cri.searchType == null?'selected':''}"/>>
								---</option>
							<option value="t"
								<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
								Title</option>
							<option value="c"
								<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
								Content</option>
							<option value="w"
								<c:out value="${cri.searchType eq 'w'?'selected':''}"/>>
								Writer</option>
							<option value="tc"
								<c:out value="${cri.searchType eq 'tc'?'selected':''}"/>>
								Title OR Content</option>
							<option value="cw"
								<c:out value="${cri.searchType eq 'cw'?'selected':''}"/>>
								Content OR Writer</option>
							<option value="tcw"
								<c:out value="${cri.searchType eq 'tcw'?'selected':''}"/>>
								Title OR Content OR Writer</option>
						</select> <input type="text" name='keyword' id="keywordInput"
							value='${cri.keyword }'>
						<button id='searchBtn'>Search</button>
						<button id='newBtn'>New Board</button>

					</div>
				</div>


				<div class="box">
					<div class="box-header with-border">
						<h3 class="box-title">LIST PAGING</h3>
					</div>
					<div class="box-body">
						<table class="table table-bordered">
							<tr>
								<th style="width: 10px">BNO</th>
								<th>TITLE</th>
								<th>WRITER</th>
								<th>REGDATE</th>
								<th style="width: 40px">VIEWCNT</th>
							</tr>

							<c:forEach items="${list}" var="boardVO">

								<tr>
									<td>${boardVO.rnum}</td>
									<td><a
										href='/sboard/readPage?board_id=${cri.board_id}&${pageMaker.makeSearch(pageMaker.cri.page) }&bno=${boardVO.bno}'>
											${boardVO.title} <strong>[ ${boardVO.replycnt} ]</strong>
									</a></td>
									<td>${boardVO.writer}</td>
									<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
											value="${boardVO.regdate}" /></td>
									<td><span class="badge bg-red">${boardVO.viewcnt }</span></td>
								</tr>

							</c:forEach>

						</table>
					</div>
					<!-- /.box-body -->


					<div class="box-footer">

						<div class="text-center">
							<ul class="pagination">

								<c:if test="${pageMaker.prev}">
									<li><a
										href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
								</c:if>

								<c:forEach begin="${pageMaker.startPage }"
									end="${pageMaker.endPage }" var="idx">
									<li
										<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
										<a href="list${pageMaker.makeSearch(idx)}">${idx}</a>
									</li>
								</c:forEach>

								<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
									<li><a
										href="list${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
								</c:if>

							</ul>
						</div>

					</div>
					<!-- /.box-footer-->
				</div>
			</div>
			<!--/.col (left) -->

		</div>
		<!-- /.row -->
	<!-- /.content -->


	<script>
	var result = '${msg}';

	if (result == 'SUCCESS') {
		alert("처리가 완료되었습니다.");
		location.replace(self.location);
	}
</script>

<script>
	$(document).ready(
			function() {
				$('#searchBtn').on(
						"click",
						function(event) {
							var pageNumQuery = '${pageMaker.makeQuery(1)}';
							if (pageNumQuery.indexOf('?') > -1) {
								pageNumQuery = pageNumQuery.replace('?', '&');
							}
							self.location = "list?board_id=${cri.board_id}"
									+ pageNumQuery
									+ "&searchType="
									+ $("select option:selected").val()
									+ "&keyword=" + $('#keywordInput').val();

						});

				$('#newBtn').on("click", function(evt) {
					self.location = "register?board_id=${cri.board_id}";
				});

			});
</script>
</body>
</html>
