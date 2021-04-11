<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <div class="container-fluid">
    <a class="navbar-brand" href="../admin/book-manage.jsp">세명 e-book</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarScroll">
      <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
        <li class="nav-item">
          <a class="nav-link" href="book-manage.jsp">도서 관리</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="book-insert.jsp">도서 입력</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="user-manage.jsp">회원관리</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="user-insert.jsp">회원입력</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="book-loan-return.jsp">대출관리</a>
        </li>
      </ul>
      <form class="d-flex">
          <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
          <button class="btn btn-outline-light" type="submit">Search</button>
        </form>
	      <ul class="nav navbar-nav navbar-right">
	      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
	      <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarScrollingDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            <ion-icon name="person-outline"></ion-icon>
          </a>
          <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarScrollingDropdown" data-bs-popper="none">
            <li><a class="dropdown-item" href="../userlogin.jsp">로그아웃</a></li>
          </ul>
        </li>
	  </ul>
    </div>
  </div>
</nav>