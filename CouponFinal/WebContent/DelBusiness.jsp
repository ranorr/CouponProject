<%@ page language="java" contentType="text/html; charset=windows-1255"
	pageEncoding="windows-1255" import="il.ac.hit.*"%>
<jsp:useBean id="cart" class="il.ac.hit.ShoppingCart" scope="session" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1255">
<title>Delete Coupon</title>
</head>
<body>
	<form method=POST>

		<%
			Object ob = request.getAttribute("timestamp");
			IBusinessDao businessHibernate = BusinessHibernate
					.getBusinessHibernate();
			if (request.getParameter("radios") != null) {
				String idStr = request.getParameter("radios");
				int id = Integer.parseInt(idStr);
				businessHibernate.deleteBusiness(id);
			}
		%>
		Business Deleted! <br>
		<button type="button" name="backtoallbusiness"
			onclick="window.location.href='/CouponFinal/ServletDemo/AllBusiness'">Show all
			Businesses</button>
		<button type="button" name="main_menu"
			onclick="window.location.href='/CouponFinal/ServletDemo/AdminMenu'">Go Back to Menu</button>
	</form>
</body>
</html>