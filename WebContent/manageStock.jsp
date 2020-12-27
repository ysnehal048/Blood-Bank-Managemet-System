<%@page import="Project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="header.html"%>
<html>
<head>
<link rel="stylesheet" href="style.css" type="text/css" media="screen">
<style>
input[type="text"], input[type="password"], input[type="submit"],select
{
    border: none;
    background:silver;
    height: 50px;
    font-size: 16px;
	margin-left:35%;
	padding:15px;
	width:33%;	
	border-radius: 25px;
}

#customers {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 55%;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #4CAF50;
  color: white;
}
</style>
</head>
<body>
<div class="container">
<br>
<% 
String msg=request.getParameter("msg");
if("invalid".equals(msg))
{
%>
 <center><font color="red" size="5">Some Thing Went Wrong!!</font></center>
 <%} %>
 <% 

if("valid".equals(msg))
{
%>
 <center><font color="red" size="5">Successfully Updated </font></center>
 <%} %>

 <br>
 <center>
 <table id="customers">
 <tr>
 <th>Blood Group</th>
 <th>Units</th>
 </tr>
 <%
 try
 {
		Connection con=ConnectionProvider.getCon(); 
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from stock");
	 	while(rs.next())
	 	{
 %>
<td><%=rs.getString(1) %>
<td><%=rs.getString(2) %>
<tr>
<%
}
}
catch(Exception e)
{
	System.out.println(e);
}%>
 </table>
</table>
</center>
<br>
<br>
<br>

</body>
</html>