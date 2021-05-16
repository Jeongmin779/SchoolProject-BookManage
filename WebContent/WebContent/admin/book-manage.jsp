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
<script src="https://unpkg.com/ionicons@5.4.0/dist/ionicons.js"></script>
<%session.getMaxInactiveInterval(); %>
</head>
<body>
	<%@ include file="../page/admin-nav-bar.jsp" %>
	<div class="main-container">
	<%@ include file="../page/book-list.jsp" %>
	</div>
</body>
</html>
<script type="text/javascript" src="../js/nav.js"></script> 
<script>

//very simple to use!
$(".nav-link.dropdown-toggle").hover( function () {
 // Open up the dropdown
 $(this).removeAttr('data-toggle'); // remove the data-toggle attribute so we can click and follow link
 $(this).parent().addClass('show'); // add the class show to the li parent
 $(this).next().addClass('show'); // add the class show to the dropdown div sibling
}, function () {
 // on mouseout check to see if hovering over the dropdown or the link still
 var isDropdownHovered = $(this).next().filter(":hover").length; // check the dropdown for hover - returns true of false
 var isThisHovered = $(this).filter(":hover").length;  // check the top level item for hover
 if(isDropdownHovered || isThisHovered) {
     // still hovering over the link or the dropdown
 } else {
     // no longer hovering over either - lets remove the 'show' classes
     $(this).attr('data-toggle', 'dropdown'); // put back the data-toggle attr
     $(this).parent().removeClass('show');
     $(this).next().removeClass('show');
 }
});
//Check the dropdown on hover
$(".dropdown-menu").hover( function () {
}, function() {
 var isDropdownHovered = $(this).prev().filter(":hover").length; // check the dropdown for hover - returns true of false
 var isThisHovered= $(this).filter(":hover").length;  // check the top level item for hover
 if(isDropdownHovered || isThisHovered) {
     // do nothing - hovering over the dropdown of the top level link
 } else {
     // get rid of the classes showing it
     $(this).parent().removeClass('show');
     $(this).removeClass('show');
 }
});
</script>