<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="internshipProject.dao.LoginVerificationDAO" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
<h1>Hello World!</h1>

<%

    if (session.getAttribute("verifyControl") == "approvedStaff") {
        response.sendRedirect("_member.jsp");
    } else if (session.getAttribute("verifyControl") == "approvedUser") {
        response.sendRedirect("_loggedInMember.jsp");
    } else if (session.getAttribute("verifyControl") != "approvedUser") {
        out.println("Üye olarak oturum açma işlemi başarısız");
        response.sendRedirect("_member.jsp");
    }

%>

</body>
</html>

