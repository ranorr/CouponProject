<%@ page language="java" contentType="text/html; charset=windows-1255"
	pageEncoding="windows-1255" import="il.ac.hit.*" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1255">
<title>Insert title here</title>
</head>
<body>
	<form>
		<%
			Object ob = request.getAttribute("timestamp");
			IBusinessDao businessHibernate = BusinessHibernate
					.getBusinessHibernate();
			String businessIDStr = request.getParameter("business_id");
			String nameStr = request.getParameter("name");
			String addressStr = request.getParameter("address");
			int businessID;
			if (businessIDStr != null && businessIDStr != null) {
				businessID = Integer.parseInt(businessIDStr);
				Business b = businessHibernate.getBusiness(businessID);
				businessHibernate.updateBusiness(new Business(businessID, nameStr, addressStr));
		%>
		Updated Successfully.
		<%
			out.println("<br>Business detailes: "
						+ businessHibernate.getBusiness(businessID));
		%>
		<br>
		<button type="button" name="back" onclick="history.back()">Go
			Back</button>
		<button type="button" name="main_menu"
			onclick="window.location.href='/CouponFinal/ServletDemo/AdminMenu'">Go
			Back to Menu</button>
		<button type="button" name="back"
			onclick="window.location.href='/CouponFinal/ServletDemo/Logout'">Logout</button>
		<%
			}
		%>



	</form>

</body>
</html>