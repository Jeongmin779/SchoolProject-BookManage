<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="input-container">
	<form action="../action/book-insert.jsp">
	  <div class="form-floating mb-3">
		  <input type="text" class="form-control" id="floatingInput" placeholder="name@example.com" name="bookname">
		  <label for="floatingInput">책 이름</label>
		</div>
		<div class="form-floating mb-3">
		  <input type="text" class="form-control" id="floatingPassword" placeholder="Password" name="author">
		  <label for="floatingPassword">저자</label>
		</div>
		<div class="form-floating mb-3">
		  <input type="text" class="form-control" id="floatingPassword" placeholder="Password" name="publisher">
		  <label for="floatingPassword">출판사</label>
		</div>
		<div class="form-floating mb-3">
		  <input type="text" class="form-control" id="floatingPassword" placeholder="Password" name="bookimg">
		  <label for="floatingPassword">도서이미지이름</label>
		</div>
		<div class="form-floating mb-3">
			<input type="text" class="selector" placeholder="날짜를 선택하세요." name="date">
			<a class="input-button" title="toggle" data-toggle><i class="icon-calendar"></i></a>
		</div>
	    <button type="submit" class="btn btn-primary">도서 입력</button>
	  </div>
	</form>
</div>
<script type="text/javascript"> 
	$(function () { $('#datetimepicker1').datetimepicker({ format: 'L'});
	$('#datetimepicker2').datetimepicker({ format: 'L', useCurrent: false });
	$("#datetimepicker1").on("change.datetimepicker", function (e) { $('#datetimepicker2').datetimepicker('minDate', e.date); });
	$("#datetimepicker2").on("change.datetimepicker", function (e) { $('#datetimepicker1').datetimepicker('maxDate', e.date); }); }); 
	$(".selector").flatpickr({ 
		dateFormat: "Y-m-d"
		});
</script>