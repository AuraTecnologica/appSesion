<%@page import="com.auratecnologica.appSession.UsuarioController"%>
<%@page import="com.auratecnologica.appSession.Usuario"%>
<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
 <%
 	if(request.getParameter("submit")!=null){
 		String login = request.getParameter("login");
 		String password = request.getParameter("password");
 		Usuario user=UsuarioController.login(login, password);
 		if(user!=null){
 			
 			session.setAttribute("user", user.getId());
 			response.sendRedirect("sesion.jsp");
 		}
 	}
 %>
 <% session.getId(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Login</title>
</head>
<body>
<form action="#" method="post">
	<p>
		<label for="login">Login:</label>
		<input type="text" id="login" name="login">
	</p>
	<p>
		<label for="password">Password:</label>
		<input type="password" id="password" name="password">
	</p>
	<p>
		<input type="submit" name="submit">
	</p>
</form>
</body>
</html>