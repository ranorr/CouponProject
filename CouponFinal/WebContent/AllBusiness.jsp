<%@ page language="java" contentType="text/html; charset=windows-1255"
	pageEncoding="windows-1255" import="il.ac.hit.*" import="java.util.*"%>
<jsp:useBean id="user" class="il.ac.hit.Members" scope="session" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1255">
<title>Insert title here</title>
</head>
<body>
	<form action="/CouponFinal/ServletDemo/DelBusiness" method="post">
		<h1>Businesses:</h1>
		<%
			IBusinessDao businessHibernet = BusinessHibernate
					.getBusinessHibernate();
			Iterator<Business> businessList = businessHibernet.getBusiness(1,
					1000);
			int id = 1;
			Business tmp;
			while (businessList.hasNext() && businessList.next() != null) {
				tmp = businessHibernet.getBusiness(id);
		%>
		<br> <input type="radio" name="radios" value=<%=id%>></input>
		<%
		out.println(tmp.toString());
		id++;
			}
		%>
		<br>
		<input type="submit" name="delBusiness" value="Del Business">
		<button type="button" name="main_menu"
			onclick="window.location.href='/CouponFinal/ServletDemo/AdminMenu'">Go Back to Menu</button>
		<button type="button" name="back" onclick="history.back()">Go
			Back</button>
		<button type="button" name="logout"
			onclick="window.location.href='/CouponFinal/ServletDemo/Logout'">Logout</button>

	</form>
</body>
</html>