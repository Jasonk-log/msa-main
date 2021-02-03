<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*, java.net.HttpURLConnection, java.net.URL" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>chart</title>
</head>
<body>
<%
 String result = null;
 out.println("This is the main page.");

 try {

   String address = "http://result:8080/";

   URL url = new URL(address);
   HttpURLConnection conn = (HttpURLConnection) url.openConnection();
   conn.setRequestMethod("GET");
   conn.connect();

   BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
   String line;
   StringBuffer sb = new StringBuffer();
   while ((line = rd.readLine()) != null) {
    sb.append(line);
    sb.append(System.getProperty("line.separator"));
   }
   rd.close();

   result = sb.toString();

} catch (Exception e) {
 e.printStackTrace();
}

 out.println("Result: " + result);
%>
</body>
</html>
