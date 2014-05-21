<%@ page language="java" contentType="text/html; charset=windows-1255"
	pageEncoding="windows-1255" import="il.ac.hit.*" import="java.util.*"%>
<jsp:useBean id="cart" class="il.ac.hit.ShoppingCart" scope="session" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	Object ob = request.getAttribute("timestamp");
	ICouponsDAO couponsHibernate = CuponHibernate.getCouponsHibernate();
	Iterator<Coupon> couponList = couponsHibernate.getCoupons(1, 1000);
	//ShoppingCart cart = new ShoppingCart();
	String s = "";
	s = request.getParameter("radios");
	if (request.getParameter("radios") != null) {
		String idStr = request.getParameter("radios");
		int id = Integer.parseInt(idStr);
		Coupon tmp = couponsHibernate.getCoupon(id);
		cart.addCouponToCart(tmp);
	} else if (cart.getSize() == 0){
%>
<h3 class="ui-bar ui-bar-a ui-corner-all">No coupon was selected!!!</h3>
      <div class="ui-body"></div>
<br>
<%
	}
%>
<jsp:include page="./MyCouponsCart.jsp"></jsp:include>
<button type="button" name="back"
	onclick="window.location.href='/CouponFinal/ServletDemo/ChooseCoupons'">Go
	Back to all coupons</button>
<button type="button" name="back"
	onclick="window.location.href='/CouponFinal/ServletDemo/UserMenu'">Main
	Menu</button>
<button type="button" name="logout"
	onclick="window.location.href='/CouponFinal/ServletDemo/Logout'">Logout</button>