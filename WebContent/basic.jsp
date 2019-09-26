
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	Class.forName("com.mysql.jdbc.Driver");
%>

<HTML>
<HEAD>
<TITLE>Resources List Unser Managers</TITLE>
</HEAD>
<BODY>
	<h1>Resources List :</h1>

	<%
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/kamesh", "root", "root");

		Statement statement = connection.createStatement();

		String id = request.getParameter("id");

		ResultSet resultset = statement.executeQuery("select * from EmployeeList where eManager = '" + id + "'");

		if (!resultset.next()) {
			out.println("Sorry, could not find that Manager. ");
		} else {
	%>


	<TABLE>
		<TR>
			<TH>EID</TH>
			<TH>EName</TH>
			<TH>EEmail</TH>
			<TH>EManager</TH>
			<TH>EManagerId</TH>
		</TR>

		<%
			response.setContentType("application/vnd.ms-excel");
				response.setHeader("Content-Disposition", "inline; filename=" + "dxc.xlsx");
		%>

		<%
			while (resultset.next()) {
		%>

		<TR>
			<TD><%=resultset.getString(1)%></TD>
			<TD><%=resultset.getString(2)%></TD>
			<TD><%=resultset.getString(3)%></TD>
			<TD><%=resultset.getString(4)%></TD>
			<TD><%=resultset.getString(5)%></TD>
		</TR>

	</TABLE>
	<BR>
	<%
		}
		}
	%>
</BODY>
</HTML>





