<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Coupon</title>
</head>
<body>
	<form method="post" action="/CouponFinal/ServletDemo/Login">
		<center>
			<table border="1" width="30%" cellpadding="3">
				<thead>
					<tr>
						<th colspan="2">Login Here</th>
					</tr>
				</thead>
				<%
					String username = "";
					Cookie[] vec = request.getCookies();
					for (int i = 0; vec != null && i < vec.length; i++) {
						if (vec[i].getName().equals("usercookie")) {
							username = vec[i].getValue();
						}
					}
				%>
				<tbody>
					<tr>
						<td>User Name</td>
						<td><input type="text" name="uname" value=<%=username%> /></td>
					</tr>
					<tr>
						<td>Password</td>
						<td><input type="password" name="pass" value="" /></td>
					</tr>
					<tr>
						<td><input type="submit" value="Login" /></td>
						<td><input type="reset" value="Reset" /></td>
					</tr>
					<tr>
						<td colspan="2">Not Registered? <a href="/CouponFinal/ServletDemo/RegPage">PLZ
								Register Here</a></td>
					</tr>
				</tbody>
			</table>
		</center>
	</form>
</body>
</html>