<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<html>
<head>
<title>Home</title>
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="https://unpkg.com/masonry-layout@4.1/dist/masonry.pkgd.js"></script>

<style>

@import url(http://fonts.googleapis.com/earlyaccess/nanumbrushscript.css);
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
* {font-family: 'Nanum Gothic', sans-serif;}
.box {
	border: none;
	background-color: transparent;
}

.inner {
	background-color: white;
	margin: 20px 0;
	border: 1px solid #BDBDBD;
	min-width: 180px;
	}

.main-sidebar, .main-footer {	display: none;}
.content-wrapper {	margin: 0px;}
.col-md-3 {	max-width: 220px;}
img {
	width: 170px;
	height: 315px;
	padding: 10px 0 0 8px;
}
.main-header {display: none;}
.content, .container-fluid {padding :0px;}
.searchBox { background-color: white;}

.nav{margin:10px;}
.RollDiv{margin:0 auto; height:350px;overflow:hidden;}  
.RollDiv > div{overflow:hidden;height:350px;width:100%}
.RollDiv > div > a{ float:left; display:block;}  
.RollDiv > div > a > img{ height:350px;margin-right:10px;}

.contentBox{padding: 5px;}
/* .titleBox{border-bottom: 1px solid #dddddd; border-top: 1px solid #dddddd;} */
.titleBox{margin: 10px 0;}
.container {
		
		width: 100%;
		margin: 0px auto;
	}



* { box-sizing: border-box; }


/* ---- grid ---- */

.grid {
/*   max-width: 1200px; */
  
}

/* clearfix */
.grid:after {
  content: '';
  display: block;
  clear: both;
}

/* ---- grid-item ---- */

.grid-item {
  max-width: 180px;
  float: left;
  border-color: hsla(0, 0%, 0%, 0.5);
  overflow:hidden;word-wrap:break-word;
}



@media screen and (min-width:600px) and (max-width:992px){	
	.container{
		width: 90%;
	}
	
	.col-md-3{
		float:left;
		width: 50%;
		
	}

}
		
@media screen and (min-width:980px){	
	.container{
		width: 80%;
	}
	.col-md-3{
		float:left;
		width: 25%;
	}
}


</style>

</head>
<body>
	<div class="container">
		<div><a href="/"><img src="/img/main2.png" style="width: 100%; height:500px; padding: 0px;"></a>
		</div>
		

	<div class='box'>
			

			<div class='searchBox'>
				<div class="wrapSearchType">
				<select name="searchType" style="height:26px; float:left;">
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
				
				</select>
				</div>
				<div class="wrapSearch">
				 <input type="text" name='keyword' id="keywordInput"
					value='${cri.keyword }' placeholder="검색어를 입력하세요">
				<button id='searchBtn' title="검색"><i class="fa fa-search" aria-hidden="true"></i></button>
				<button id='newBtn' title="새글"><i class="fa fa-file-text-o" aria-hidden="true"></i></button>
				<button id='freeboardBtn' title="자유게시판"><i class="fa fa-list" aria-hidden="true"></i></button>
<!-- 				<button id='loginBtn' title="로그인">Login</button> -->
				</div>
			</div>
		</div>

	<div class="col-md-12">
		<!-- general form elements -->
		
		<div class="col-md-12 ">

			<div class="imageList">
				<div class="box">

					<div class="grid">
						<c:forEach items="${list}" var="boardVO">
							<div class="inner grid-item">
								<c:set var="fullName"
									value="${fn:replace(boardVO.fullName,'s_', '')}" />
								<div class="imgBox">
									<img src="/displayFile?fileName=${fullName}" class="imgGallery">
								</div>
								
								<div class="contentBox">
								<div>${boardVO.writer}</div>
								<div class="titleBox" ><a	href='/sboard/readPage?board_id=1&${pageMaker.makeSearch(pageMaker.cri.page) }&bno=${boardVO.bno}'>
										${boardVO.title} <strong>[ ${boardVO.replycnt} ]</strong>
									</a></div>
								<div>${boardVO.content}</div>
								</div>
							</div>
						</c:forEach>


					</div>
				</div>
			</div>

		</div>
	</div>
</div>


		<script id="templateAttach" type="text/x-handlebars-template">
	<li data-src='{{fullName}}'>
  		<div class="mailbox-attachment-info">
				<a href="{{getLink}}" class="mailbox-attachment-name">
  			<span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
				</a>
			</span>
  		</div>
	</li>                
	</script>


		<script>
			$(document)
					.ready(
							function() {
								$('#searchBtn')
										.on(
												"click",
												function(event) {
													var pageNumQuery = '${pageMaker.makeQuery(1)}';
													if (pageNumQuery
															.indexOf('?') > -1) {
// 														pageNumQuery = pageNumQuery
// 																.replace('?',
// 																		'&');
													}
													self.location = "/"
															+ "?searchType="
															+ $(
																	"select option:selected")
																	.val()
															+ "&keyword="
															+ $('#keywordInput')
																	.val();

												});

								$('#newBtn').on("click", function(evt) {
													self.location = "/sboard/register?board_id=1";
												});
								
								$('#freeboardBtn').on("click", function(evt) {
									self.location = "/sboard/list?board_id=2";
								});
								
								$('#loginBtn').on("click", function(evt) {
									self.location = "/user/login";
								});

							});
		</script>



		<script>
		$('.grid').masonry({
  itemSelector: '.grid-item',
  columnWidth: 100
});
  </script>
</body>
</html>
