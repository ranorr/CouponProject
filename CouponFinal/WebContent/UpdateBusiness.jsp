
<%@ page language="java" contentType="text/html; charset=windows-1255"
	pageEncoding="windows-1255" import="il.ac.hit.*" import="java.util.*"
	import="java.awt.Button"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1255">
<title>Insert title here</title>
</head>
<body>
	<form method=POST action="/CouponFinal/ServletDemo/UpdateBusinessDetailes">
		<%
			Object ob = request.getAttribute("timestamp");
			IBusinessDao businessHibernate = BusinessHibernate
					.getBusinessHibernate();
			String businessIDStr = request.getParameter("business_id");
			int couponID = 0;
			int businessID;
		%>
		<br> Business ID: <input type=text name=business_id> (max
		ID =
		<%=businessHibernate.nextIDNumber() - 1%>) <br> Name: <input
			type=text name=name> <br> Address: <input type=text
			name=address> <br> <input type="submit"
			value="Update Business" />
		<button type="button" name="back" onclick="history.back()">Go
			Back</button>
		<button type="button" name="main_menu"
			onclick="window.location.href='/CouponFinal/ServletDemo/AdminMenu'">Go Back to Menu</button>
		<button type="button" name="back"
			onclick="window.location.href='/CouponFinal/ServletDemo/Logout'">Logout</button>
	</form>
</body>
</html>