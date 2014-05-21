<%@ page language="java" contentType="text/html; charset=windows-1255"
	pageEncoding="windows-1255"%>
	<jsp:useBean id="user" class="il.ac.hit.Members" scope="session" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1255">
<title>User Menu</title>
<link rel="stylesheet" 
href="http://code.jquery.com/mobile/1.3.1/jquery.mobile-1.3.1.min.css" />
 <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
 <script src="http://code.jquery.com/mobile/1.3.1/jquery.mobile-1.3.1.min.js">
</script>
</head>
<body>
	<form method=POST>
		<h1>User Menu:</h1>
		<input type="button" value="Get Coupon"
			onclick="window.location.href='/CouponFinal/ServletDemo/GetCoupon'" /> <input
			type="button" value="Show Coupons"
			onclick="window.location.href='/CouponFinal/ServletDemo/ChooseCategory'" /> <input
			type="button" value="My Coupons"
			onclick="window.location.href='/CouponFinal/ServletDemo/MyCouponsCart'" /> <br>
		<button type="button" name="back"
			onclick="window.location.href='/CouponFinal/ServletDemo/Logout'">Logout</button>
		<%
			Object ob = request.getAttribute("timestamp");
		user.setAdmin(false);
		%>
	</form>
</body>
</html>