<%@ page language="java" contentType="text/html; charset=windows-1255"
	pageEncoding="windows-1255" import="il.ac.hit.*"%>
<jsp:useBean id="cart" class="il.ac.hit.ShoppingCart" scope="session" />
<jsp:useBean id="user" class="il.ac.hit.Members" scope="session" />
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
			ICouponsDAO couponsHibernate = CuponHibernate.getCouponsHibernate();
			
			if (request.getParameter("radios") != null) {
				String idStr = request.getParameter("radios");
				int id = Integer.parseInt(idStr);
				

				if (user.getAdmin()) {
					couponsHibernate.deleteCoupon(id);
		%>
		<jsp:forward page="./AllCoupons.jsp"></jsp:forward>
		<%
			}
				if (!user.getAdmin()) {
					cart.delCouponFromCart(id);
					
		%>
		<jsp:forward page="./MyCouponsCart.jsp"></jsp:forward>
		<%
			}
			}
		%>
	</form>
</body>
</html>