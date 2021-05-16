<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	session.invalidate();
	response.sendRedirect("../userlogin.jsp");
 %>