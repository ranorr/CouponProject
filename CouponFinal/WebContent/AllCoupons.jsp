<%@ page language="java" contentType="text/html; charset=windows-1255"
	pageEncoding="windows-1255" import="il.ac.hit.*" import="java.util.*"%>
<jsp:useBean id="cart" class="il.ac.hit.ShoppingCart" scope="session" />
<jsp:useBean id="user" class="il.ac.hit.Members" scope="session" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1255">
<title>Showing all coupons</title>
<link rel="stylesheet"
	href="http://code.jquery.com/mobile/1.3.1/jquery.mobile-1.3.1.min.css" />
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script
	src="http://code.jquery.com/mobile/1.3.1/jquery.mobile-1.3.1.min.js">
	
</script>
</head>
<body>
	<form action="/CouponFinal/ServletDemo/AddToCart" method="POST">
		<%
			Object ob = request.getAttribute("timesta	mp");
			String categoryNameStr = request.getParameter("category");
			if (user.getAdmin()) {
				categoryNameStr = "All";
		%>
		<fieldset data-role="controlgroup" data-mini="true">
			<legend>
				<b><%=categoryNameStr%> Coupons: </b>
			</legend>
			<%
				ICouponsDAO couponsHibernate = CuponHibernate
							.getCouponsHibernate();
					Iterator<Coupon> couponList = couponsHibernate.getCoupons(1,
							1000);
					int id = 1;
					Coupon tmp;
					if (!categoryNameStr.equals("All")) {
						while (couponList.hasNext()) {
							tmp = couponsHibernate.getCouponFromList(couponList);
							if (tmp.getCategory().getCategoryName()
									.equals(categoryNameStr)) {
								if (id == 1) {
			%>

			<label> <img src="/CouponFinal/Images/<%=tmp.getImage()%>"
				alt='image' width="42" height="42"> <input type="radio"
				name="radios" value=<%=id%> checked="checked"> <%
 	} else {
 %> <label> <img src="/CouponFinal/Images/<%=tmp.getImage()%>"
					alt='image' width="42" height="42"> <input type="radio"
					name="radios" value=<%=id%>> <%
 	}
 					out.println(tmp.toString());
 					id++;
 %>
			</label><br> <%
 	}
 			}
 		} else {

 			while (couponList.hasNext()) {

 				tmp = couponsHibernate.getCouponFromList(couponList);
 				if (id == 1) {
 %> <label> <img src="/CouponFinal/Images/<%=tmp.getImage()%>"
					alt='image' width="42" height="42"><input type="radio"
					name="radios" value=<%=id%> checked="checked"> <%
 	} else {
 %> <label> <img src="/CouponFinal/Images/<%=tmp.getImage()%>"
						alt='image' width="42" height="42"> <input type="radio"
						name="radios" value=<%=id%>> <%
 	}
 				out.println(tmp.toString());
 				id++;
 %></label> <%
 	}
 		}
 	}
 %>
		</fieldset>
		<input type="submit" value="Add To Cart">
		<button type="button" name="main_menu"
			onclick="window.location.href='/CouponFinal/ServletDemo/UserMenu'">Go
			Back to Menu</button>
		<button type="button" name="back" onclick="history.back()">Go
			Back</button>
		<button type="button" name="logout"
			onclick="window.location.href='/CouponFinal/ServletDemo/Logout'">Logout</button>

	</form>
</body>
</html>