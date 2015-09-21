<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
<%
	
	if(request.getParameter("submit")!=null){
		String cclave = request.getParameter("clave");
		String cvalor = request.getParameter("valor");
		
		session.setAttribute(cclave, cvalor);
	}
	if(request.getParameter("borrarsesion")!=null){
		session.invalidate();
		response.sendRedirect("index.jsp");
	}
	/*if(session.getAttribute("user")==null){
		response.sendRedirect("index.jsp");
	}*/
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Sesion1</title>
</head>
<body onload="writeSessionId()">
<h3>Control de Session</h3>
<p>A&ntilde;adir nuevo valor a la sesion</p>
<form action="sesion.jsp" method="post">
	<p>
	<label for="clave">Clave:</label>
	<input type="text" id="clave" name="clave">
	</p>
	<p>
	<label for="valor">Valor:</label>
	<input type="text" id="valor" name="valor">
	</p>
	<p>
	<input type="submit" name="submit">
</form>
<h3>Valores Almacenados en sesion</h3>

<p>Server Session ID: <% out.write(session.getId()); %> </p>
<p>Client side session id = <span id="sessionid"></span></p>

<script type="text/javascript">
function writeSessionId() {
    document.getElementById('sessionid').innerText = getCookie('JSESSIONID');
}
function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for(var i=0; i<ca.length; i++) {
        var c = ca[i].trim();
        if (c.indexOf(name) == 0) return c.substring(name.length,c.length);
    }
    return "";
}
</script>
<%
  Enumeration<String> atributos=session.getAttributeNames();
	while(atributos.hasMoreElements()){
		String clave = atributos.nextElement();
		String valor = session.getAttribute(clave).toString();
		out.write("<p>"+clave+" : "+ valor+"</p>");
	}
%>
<form action="sesion.jsp" method="post">
	<input type="submit" name="borrarsesion" value="borrar Sesion"/>
</form>
</body>
</html>