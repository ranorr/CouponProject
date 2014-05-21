<%@ page language="java" contentType="text/html; charset=windows-1255"
	pageEncoding="windows-1255" import="il.ac.hit.*" import="java.util.* "%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1255">
<title>Add Business</title>
</head>
<body>
	<form method="post">
		<%
			Object ob = request.getAttribute("timestamp");
			ICouponsDAO couponsHibernate = CuponHibernate.getCouponsHibernate();
			IBusinessDao businessHibernate = BusinessHibernate
					.getBusinessHibernate();
		%>
		<br>Business name: <input type=text name=business_name> <br>Address:
		<input type=text name=adress> <br> <input type="submit"
			value="Add business" />
		<button type="button" name="back" onclick="history.back()">Go
			Back</button>
		<button type="button" name="main_menu"
			onclick="window.location.href='/CouponFinal/ServletDemo/AdminMenu'">Go Back to Menu</button>
		<button type="button" name="back"
			onclick="window.location.href='/CouponFinal/ServletDemo/Logout'">Logout</button>
		<%
			String businessNameStr = request.getParameter("business_name");
			String businessAdressStr = request.getParameter("adress");
			if (businessNameStr != null && businessAdressStr != null) {

				int businessID = businessHibernate.nextIDNumber();
				Business tmpBusinesss = new Business(businessID,
						businessNameStr, businessAdressStr);
				businessHibernate.addBusiness(tmpBusinesss);
				out.println("<br>Business added successfuly! <br>");
			}
		%>

	</form>
</body>
</html>