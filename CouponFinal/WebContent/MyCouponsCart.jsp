<%@ page language="java" contentType="text/html; charset=windows-1255"
	pageEncoding="windows-1255"%>
<jsp:useBean id="cart" class="il.ac.hit.ShoppingCart" scope="session" />

	<jsp:useBean id="user" class="il.ac.hit.Members" scope="session" /> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1255">
<title>My Coupons Cart</title>
<link rel="stylesheet" 
href="http://code.jquery.com/mobile/1.3.1/jquery.mobile-1.3.1.min.css" />
 <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
 <script src="http://code.jquery.com/mobile/1.3.1/jquery.mobile-1.3.1.min.js">
</script>
</head>
<body>
	<form action="/CouponFinal/ServletDemo/DelCoupon" method="POST">
		<fieldset data-role="controlgroup" data-mini="true">
        <legend><b>My Cart:</b></legend>
		<%
			Object ob = request.getAttribute("timestamp");
			int id = 0;
			int size;
			cart.CheckDate();
			size = cart.getSize();
			if(size == 0) {
				%>
				<h3 class="ui-bar ui-bar-a ui-corner-all">Cart Is Empty!</h3>
      <div class="ui-body"></div>
				<br>
				<%
			}
			for (id = 0; id < size; id++) {
				if (id == 0) {
					%>

					<label>  <img src="/CouponFinal/Images/<%=cart.getCouponImage(id)%>" alt='image'
							width="42" height="42"> <input type="radio" name="radios" value=<%=cart.getCouponID(id)%>
						checked="checked" > <%
	 	} else {
		%>
		<label>
		<img src="/CouponFinal/Images/<%=cart.getCouponImage(id)%>" alt='image'
							width="42" height="42"> <input type="radio" name="radios" value=<%=cart.getCouponID(id)%>></input>
		<%
	 	}
			out.println(cart.toString(id));
		%>
		</label><br>
		<%
			}
		%>
		</fieldset>
		<%
		if (size != 0) {
		%>
		<input type="submit" value="Delete Coupon">
		<%
		}
		%>
		<button type="button" name="back" onclick="window.location.href='./ChooseCategory'">Go
			Back</button>
		<%
			if(user.getAdmin())
			{
			%>
			<button type="button" name="main_menu"
			onclick="window.location.href='/CouponFinal/ServletDemo/AdminMenu'">Go
			Back to Menu</button>
			<%
			}
			else
			{
			%>
		<button type="button" name="main_menu"
			onclick="window.location.href='/CouponFinal/ServletDemo/UserMenu'">Go
			Back to Menu</button>
			<%
			}
			%>
	</form>
</body>
</html>