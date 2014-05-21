<%@ page import="java.sql.*"%>
<%
	
	
	
	String userid = request.getParameter("uname");
	String pwd = request.getParameter("pass");
	Cookie cookie = new Cookie("usercookie", userid);
	cookie.setMaxAge(7 * 24 * 60 * 60);
	response.addCookie(cookie);
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(
			"jdbc:mysql://localhost:3306/simple_jdbc", "root", "root");
	Statement st = con.createStatement();
	ResultSet rs;
	rs = st.executeQuery("select * from members where uname='" + userid
			+ "' and pass='" + pwd + "'");
	
	
	if (rs.next()) {
		session.setAttribute("userid", userid);
		//out.println("welcome " + userid);
		//out.println("<a href='logout.jsp'>Log out</a>");
		response.sendRedirect("/CouponFinal/ServletDemo/Success");
	} else {
		out.println("Invalid password <a href='FirstPage.jsp'>Plz Try Again</a>");
	}
%>