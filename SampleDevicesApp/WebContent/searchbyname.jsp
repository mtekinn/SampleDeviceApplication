<%@page import="devicesapp.repository.SampleDeviceAppRepository"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="devicesapp.entity.DeviceInfo"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Find device by name</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
</head>
<body>
	<h3>Find device by name</h3>
	<hr>
	<form method="post">
		<div><input type="text" name="name" placeholder="Device Name"/></div>		
		<div><input type="submit" class="btn btn-primary" value="Find"/> <input type="reset" class="btn btn-primary" value="Clear"/></div>		
	</form>
	<a href="index.html">Home Page</a>
	
	<%
		if (request.getMethod().equals("POST")) {
			try {
				String name = request.getParameter("name");
				
				List<DeviceInfo> devices = SampleDeviceAppRepository.findDevicesByName(name);
			
				if (!devices.isEmpty()) {
					out.println("<h3>DEVICES</h3>");
					out.println("<table border=\"1\">");
					out.println("<tr>");
					out.println("<th>Name</td>");
					out.println("<th>Host</td>");
					out.println("<th>Port</td>");
					out.println("</tr>");
					for (DeviceInfo di : devices) {
						out.println("<tr>");
						out.println(String.format("<td>%s</td>", di.getName()));
						out.println(String.format("<td>%s</td>", di.getHost()));
						out.println(String.format("<td>%d</td>", di.getPort()));
						out.println("</tr>");
					}				
					out.println("</table>");
				}
				else
					out.println("<hr><h3>No devices found!</h3>");
			}
			catch (Throwable ignore) {
				out.println("<h1>There is problem in find by name operation. Please try again later!</h1>");
			}
		}

	%>		
</body>
</html>