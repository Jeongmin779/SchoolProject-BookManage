<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="../css/nav-bar.css">
<link rel="stylesheet" type="text/css" href="../css/main-container.css">
<link rel="stylesheet" type="text/css" href="../css/book-manage.css">
<script src="https://unpkg.com/ionicons@5.4.0/dist/ionicons.js"></script>
<%session.getMaxInactiveInterval(); %>
</head>
<body>
	<%@ include file="../page/nav-bar.jsp" %>
	<div class="main-container">
		<div class="row text-center" style="width: 100%">
			<h1>내 정보</h1>
		</div>
	<%@ include file="../userpage/user-mypage.jsp" %>
	</div>
</body>
</html>
<script src="//code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="../js/nav.js?ver=1"></script> 