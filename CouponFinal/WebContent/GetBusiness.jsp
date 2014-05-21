<%@page import="java.awt.Button"%>
<%@ page language="java" contentType="text/html; charset=windows-1255"
	pageEncoding="windows-1255" import="il.ac.hit.*"%>
<jsp:useBean id="user" class="il.ac.hit.Members" scope="session" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1255">
<title>Getting Business</title>
</head>
<body>
	<form method=POST>
		<br>Business ID: <input type=text name=business_id>
		<%
			Object ob = request.getAttribute("timestamp");
			IBusinessDao businessHibernate = BusinessHibernate
					.getBusinessHibernate();
		%>
		(max ID =
		<%=businessHibernate.nextIDNumber() - 1%>) <br> <input
			type="submit" value="Get My Business" />
		<button type="button" name="back" onclick="history.back()">Go
			Back</button>
		<%
			if (user.getAdmin()) {
		%>
		<button type="button" name="main_menu"
			onclick="window.location.href='/CouponFinal/ServletDemo/AdminMenu'">Go Back to Menu</button>
		<%
			} else {
		%>
		<button type="button" name="main_menu"
			onclick="window.location.href='/CouponFinal/ServletDemo/UserMenu'">Go Back to Menu</button>
		<%
			}
		%>
		<button type="button" name="logout"
			onclick="window.location.href='/CouponFinal/ServletDemo/Logout'">Logout</button>

		<%
			String businessIDStr = request.getParameter("business_id");
			int businessID = 0;
			if (businessIDStr != null) {
				businessID = Integer.parseInt(businessIDStr);

			}
			if (businessID != 0) {
				if (businessHibernate.nextIDNumber() > businessID) {
					out.println("<br>Coupon detailes: "
							+ businessHibernate.getBusiness(businessID));
				} else {
					out.println("<br>No shuch business ID!!");
				}
			}

			else if (request.getParameter("backToMenu") != null) {
		%>
		<jsp:forward page="/CouponFinal/ServletDemo/AdminMenu"></jsp:forward>
		<%
			}
		%>
	</form>
</body>
</html>