<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <div class="container-fluid">
    <a class="navbar-brand" href="mainpage.jsp">세명 e-book</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarScroll">
      <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="mainpage.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="../user/user-booklist.jsp">도서 목록</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="../user/user-loan-list.jsp">대여 목록</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="../user/user-loan-list.jsp">대여했던 책 목록</a>
        </li>
      </ul>
      	<form class="d-flex" action="search.jsp">
          <input class="form-control me-2" type="text" placeholder="Search" aria-label="Search" name="search">
          <button class="btn btn-outline-light" type="submit">Search</button>
        </form>
	      <ul class="nav navbar-nav navbar-right">
	      <button class="navbar-toggler" type="text" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
	      <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarScrollingDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            <ion-icon name="person-outline"></ion-icon>
          </a>
          <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarScrollingDropdown" data-bs-popper="none" style="margin-top: 0px;">
            <li><a class="dropdown-item" href="../user/user-mypage.jsp"><%=session.getAttribute("id") %>님의 정보</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="../action/userlogout.jsp">로그아웃</a></li>
          </ul>
        </li>
	  </ul>
    </div>
  </div>
</nav>