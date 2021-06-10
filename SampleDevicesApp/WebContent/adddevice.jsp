<%@page import="devicesapp.entity.DeviceInfo"%>
<%@page import="devicesapp.repository.SampleDeviceAppRepository"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Device Form</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
</head>
<body>
	<h3>Add your device</h3>
	<form method="post">
		<div>
			<input class="form-label" type="text" name="name" placeholder="Device Name"/>
		</div>
		
		<div>
			<input class="form-label" type="text" name="host" placeholder="Device Host"/>
		</div>
		
		<!--  Bonus (10 points): Port numbers between 0(zero) and 65535 ([0, 65535]) -->
		<div>
			<input type="number" name="port" min="0" max="65535" placeholder="[0,65535]"/>
		</div>
		
		<!--  Bonus (10 points): Accept the conditions. If not do not allow to save device --> 
		<div>
			<input class="form-check-input" type="checkbox" name="accept" required oninvalid="this.setCustomValidity('You must be accept the conditions!')" />I accept <a href="conditions.html">terms and conditions</a>
		</div>
		<div>
			<input type="submit" value="Save Device" class="btn btn-primary"/> <input type="reset" value="Clear" class="btn btn-primary"/>
		</div>		
				
	</form>
	<a href="index.html">Home Page</a>
	<%
		try {
			if (request.getMethod().equals("POST")) {
				String name = request.getParameter("name");
				String host = request.getParameter("host");
				String port = request.getParameter("port");
				
				DeviceInfo di = new DeviceInfo(name, host, Integer.parseInt(port));
				
				if (SampleDeviceAppRepository.save(di))
					out.println("<hr><h3>Saved Successfully</h3>");
				else
					out.println("<h3>Save failed!</h3>");		
			}
			}
		catch(Throwable ignore) {
			out.println("<h1>There is problem in server. Please try again later...</h1>");
		}
	%>
</body>
</html>