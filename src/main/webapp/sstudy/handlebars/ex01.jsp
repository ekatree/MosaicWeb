<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01.jsp</title>
	
	<!-- Bootstrap 3.3.4 -->
	<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	
	<!-- jQuery 2.1.4 -->
	<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
	
	<!-- Font Awesome Icons -->
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	
	<script id="mytemplate" type="text/x-handlebars-template">
		<li><i class="fa fa-backward fa-spin"></i> {{deptno}} {{dname}} {{loc}}</li>
		
	</script>
	
	
</head>
<body>
	<button id="btn1" class="btn btn-primary">append</button>
	<ol id="depts">
	</ol>
	<script type="text/javascript">
		$('#btn1').on('click', function() {
// 			alert('버튼클릭?!');
			var template = $('#mytemplate');
			var ctemplate = Handlebars.compile(template.html());
			var dept = {
					deptno : 10,
					dname : "hong",
					loc : "seoul"
			}
			var html = ctemplate(dept);
			
// 			$('#depts').html(html);
			$('#depts').append(html);
		})
	
		
	</script>
	
</body>
</html>