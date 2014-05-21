<%@ page language="java" contentType="text/html; charset=windows-1255"
	pageEncoding="windows-1255" import="il.ac.hit.*"  import="java.awt.Button"%>
<jsp:useBean id="user" class="il.ac.hit.Members" scope="session" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Get Coupon</title>

<link rel="stylesheet"
	href="http://code.jquery.com/mobile/1.3.1/jquery.mobile-1.3.1.min.css" />
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script
	src="http://code.jquery.com/mobile/1.3.1/jquery.mobile-1.3.1.min.js">
</script>
	<script type="text/javascript">	

	
function CheckInput(num,max) {
	if (!parseInt(num) || num == null || null == "") {
		alert("This in not a number!!");
		return this;
	}
	else if (num < 0 || num == 0 || num > max) {
		alert("Illigle Number!!");
		return this;
	}
	document.forms["form"].submit();	
	return true;
}
</script>

</head>
<body>
	<form method=POST name=form>
		<%
			Object ob = request.getAttribute("timestamp");
			ICouponsDAO couponsHibernate = CuponHibernate.getCouponsHibernate();
			int maxID = couponsHibernate.nextIDNumber() - 1;
		%>
		<br> <b>Coupon ID:</b> (max ID =
		<%=maxID%>) <input type=text
			name=coupon_id id=id> <input type="button"
			value="Get My Coupon" onclick="CheckInput(document.form.coupon_id.value,<%=maxID%>);"/>
		<button type="button" name="back" onclick="history.back()">Go
			Back</button>
		<%
			if (user.getAdmin()) {
		%>
		<button type="button" name="main_menu"
			onclick="window.location.href='/CouponFinal/ServletDemo/AdminMenu'">Go
			Back to Menu</button>
		<%
			} else {
		%>
		<button type="button" name="main_menu"
			onclick="window.location.href='/CouponFinal/ServletDemo/UserMenu'">Go
			Back to Menu</button>
		<%
			}
		%>
		<button type="button" name="logout"
			onclick="window.location.href='/CouponFinal/ServletDemo/Logout'">Logout</button>

		<%
			String couponIDStr = request.getParameter("coupon_id");
			int couponID = 0;
			if (couponsHibernate.isNumeric(couponIDStr)) {
				couponID = Integer.parseInt(couponIDStr);
				%>
		<br>
		<h3 class="ui-bar ui-bar-a ui-corner-all">
			Coupon details:
			<%=couponsHibernate.getCoupon(couponID)%></h3>
		<div class="ui-body">
			<img
				src="/CouponFinal/Images/<%=couponsHibernate.getCoupon(couponID).getImage()%>"
				alt='image' width="42" height="42">
		</div>
		<br>
		<%
			}
		if (request.getParameter("backToMenu") != null) {
		%>
		<jsp:forward page="/CouponFinal/ServletDemo/AdminMenu"></jsp:forward>
		<%
			}
		
		%>
	</form>

</body>
</html>