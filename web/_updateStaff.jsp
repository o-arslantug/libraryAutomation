<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="internshipProject.dao.AnnouncementDAO" %>
<%@page import="internshipProject.model.Announcement" %>
<%@page import="internshipProject.dao.AccessLayer" %>
<%@page import="java.util.List" %>
<%@page import="java.sql.*" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Education</title>
    <meta name="keywords" content="free css templates, education, school, college, university, templatemo.com"/>
    <meta name="description" content="Education template is for academic related websites"/>
    <link href="templatemo_style.css" rel="stylesheet" type="text/css"/>

    <SCRIPT LANGUAGE="JavaScript">
        function checkBoxes(form) {
            for (var i = 0; i < form.elements.length; i++) {
                if (form.elements[i].value == "") {
                    alert("Lütfen ilgili kutucukları doldurun.")
                    document.F1.staffLoginID.focus()
                    return false
                }
            }

            if (document.F1.staffPassword.value != document.F1.RSP.value) {
                alert("Girilen şifreler birbiri ile eşleşmelidir.");
                document.F1.staffPassword.value = ""
                document.F1.RSP.value = ""
                document.F1.staffPassword.focus()
                return false
            }

            if (!isNaN(document.F1.staffName.value)) {
                alert("Ad değeri yalnızca rakamlardan oluşamaz.")
                document.F1.staffName.value = ""
                document.F1.staffName.focus()
                return false
            }

            if (isNaN(document.F1.staffGSM.value)) {
                if (document.F1.staffGSM.value > 9999999999) {
                    alert("Telefon no değeri yalnızca rakamlardan olaşbilir.")
                    document.F1.staffGSM.value = ""
                    document.F1.staffGSM.focus()
                    return false
                }
            } else {
                alert("Telefon no değerini kontrol ediniz.")
                document.F1.staffGSM.value = ""
                return false
            }

            if (!isNaN(document.F1.staffMail.value)) {
                alert("Mail değeri yalnızca rakamlardan oluşamaz.")
                document.F1.staffMail.value = ""
                document.F1.staffMail.focus()
                return false
            }

            if (!isNaN(document.F1.staffAddress.value)) {
                alert("Adres değeri yalnızca rakamlardan oluşamaz.")
                document.F1.staffAddress.value = ""
                document.F1.staffAddress.focus()
                return false
            }

            return true
        }

    </SCRIPT>

</head>
<body>
<div id="templatemo_header_wrapper">
    <div id="templatemo_header">
        <div id="site_title">
            <h1><a href="http://www.cstpoint.com" target="_parent">
                <img src="images/templatemo_logo.png" alt="Site Title"/>
                <span>free css templates</span>
            </a></h1>
        </div>
        <p><br>Kütüphaneler, insanlığın tek</p>
        <p>güvenilir ve kalıcı olan belleğidir.</p>

    </div> <!-- end of templatemo_header -->

</div> <!-- end of templatemo_menu_wrapper -->

<div id="templatemo_menu_wrapper">
    <div id="templatemo_menu">

        <ul>
            <li><a href="_index.jsp">Anasayfa</a></li>
            <%if (session.getAttribute("verifyControl") == "approvedStaff" || session.getAttribute("verifyControl") == "approvedUser") {%>
            <li><a href="_checkStaffLogin.jsp">Yönetim Paneli</a></li>
            <li><a href="_checkMemberLogin.jsp">Üye Paneli</a></li>
            <%
            } else {
            %>
            <li><a href="_staff.jsp">Yönetim Paneli</a></li>
            <li><a href="_member.jsp">Üye Paneli</a></li>
            <%}%>
            <li><a href="_inventory.jsp">Kitap Listesi</a></li>
            <li><a href="_announcements.jsp">Duyurular</a></li>
            <li><a href="_contactUs.jsp">İletişim</a></li>
        </ul>

    </div> <!-- end of templatemo_menu -->
</div>

<div id="templatemo_content_wrapper">

    <div id="templatemo_sidebar">

        <div class="sidebar_box">

            <br><a href='_memberDetails.jsp'>Geri Dönmek İçin Tıkla</a>
            <br><br><br><a href='worksOnLogout'>Çıkış Yap</a>
            <br></br>

        </div>
        <div class="sidebar_box_bottom"></div>

        <div class="sidebar_box">

            <h2>Duyurular</h2>

            <div class="section_w250 float_l">


                <%
                    int i = 0;
                    List<Announcement> announcementList = AnnouncementDAO.getAnnouncementRecords();

                    for (Announcement announcement : announcementList) {
                        if (i < 3) {
                %>

                <div class="news_box">
                    <a href="#"><%out.print(announcement.getAnnouncementTitle());%></a>
                    <p class="post_info">Posted by <span><%
                        out.print(announcement.getAnnouncementAnnouncer());%></span><br>
                        on <span><%out.print(announcement.getAnnouncementDate());%></span></p>
                </div>

                <%
                            i++;
                        }
                    }
                %>

            </div>


            <div class="cleaner"></div>

        </div>
        <div class="sidebar_box_bottom"></div>

    </div> <!-- end of sidebar -->

    <div id="templatemo_content">

        <div class="content_box">

            <td valign="top">
                    <%
                            if (session.getAttribute("verifyControl") == "approvedStaff") {
                                out.print("<h2>Personel Güncelle</h2>");
                                out.print("<h4>Tüm alanları olması gerektiği gibi doldurunuz ve 'Güncelle' butonuna basınız.</h4>");
                            } else {
                                response.sendRedirect("_error.jsp");
                            }
                        %>

                <form name=F1 onSubmit="return checkBoxes(this)" action="<%= request.getContextPath()%>/worksOnStaff"
                      method="post">
                    <table height="0" cellspacing="5" cellpadding="10">

                        <%
                            try {
                                Connection connection = AccessLayer.getConnection();
                                PreparedStatement preparedStatement = connection.prepareStatement("SELECT personel_lid, personel_sifre, personel_ad, personel_gsm, personel_mail, personel_adres, personel_id FROM Personel WHERE personel_id = ?");
                                String staffID = request.getParameter("staffID");
                                preparedStatement.setString(1, staffID);
                                PreparedStatement preparedStatementControl = connection.prepareStatement("SELECT personel_lid, personel_sifre, personel_ad, personel_gsm, personel_mail, personel_adres, personel_id FROM Personel WHERE personel_id = ?");
                                preparedStatementControl.setString(1, staffID);
                                ResultSet resultSet = preparedStatement.executeQuery();
                                ResultSet resultSetControl = preparedStatementControl.executeQuery();

                                if (resultSetControl.next()) {
                                } else {
                                    request.setAttribute("itCantFind", "<script>ifItCantFind()</script>");
                                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/_staffDetails.jsp");
                                    dispatcher.forward(request, response);
                                }

                                while (resultSet.next()) {%>

                        <tr>
                            <td>Kullanıcı Adı:</td>
                            <td><input type="text" name="staffLoginID" value="<%=resultSet.getString(1)%>" required placeholder="Bu alanı boş bırakılamaz."/></td>
                        </tr>
                        <tr>
                            <td>Şifre:</td>
                            <td><input type="password" name="staffPassword" value="<%=resultSet.getString(2)%>" required placeholder="Bu alanı boş bırakılamaz."/></td>
                        </tr>
                        <tr>
                            <td>Adı-Soyad:</td>
                            <td><input type="text" name="staffName" value="<%=resultSet.getString(3)%>" required placeholder="Bu alanı boş bırakılamaz."/></td>
                        </tr>
                        <tr>
                            <td>Telefon No:</td>
                            <td><input type="text" name="staffGSM" value="<%=resultSet.getString(4)%>" required placeholder="Bu alanı boş bırakılamaz."/></td>
                        </tr>
                        <tr>
                            <td>e-Mail:</td>
                            <td><input type="text" name="staffMail" value="<%=resultSet.getString(5)%>" required placeholder="Bu alanı boş bırakılamaz."/></td>
                        </tr>
                        <tr>
                            <td>Adres:</td>
                            <td><input id="staffAddress" type="text" size="50" name="staffAddress"
                                       value="<%=resultSet.getString(6)%>" required placeholder="Bu alanı boş bırakılamaz."/></textarea></td>
                        </tr>

                        <input type="hidden" name="staffID" value="<%=resultSet.getString(7)%>" readonly="readonly"/>
                        <input type="hidden" name="comingFrom" value="updateStaff" readonly="readonly"/>

                        <%
                                }
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }

                        %>
                        <tr>
                            <td></td>
                            <td><input type="submit" value="Gönder"/>
                                <INPUT type="reset" value="Temizle"></td>
                        </tr>


                    </table>
                </form>

                <div class="cleaner"></div>
        </div>
        <div class="content_box_bottom"></div>


    </div> <!-- end of content -->

    <div class="cleaner"></div>

</div>

<div id="templatemo_footer_wrapper">

    <div id="templatemo_footer">

        <ul class="footer_menu">
            <li><a href="_index.jsp">Anasayfa</a></li>
            <%if (session.getAttribute("verifyControl") == "approvedStaff" || session.getAttribute("verifyControl") == "approvedUser") {%>
            <li><a href="_checkStaffLogin.jsp">Yönetim Paneli</a></li>
            <li><a href="_checkMemberLogin.jsp">Üye Paneli</a></li>
            <%
            } else {
            %>
            <li><a href="_staff.jsp">Yönetim Paneli</a></li>
            <li><a href="_member.jsp">Üye Paneli</a></li>
            <%}%>
            <li><a href="_inventory.jsp">Kitap Listesi</a></li>
            <li><a href="_announcements.jsp">Duyurular</a></li>
            <li><a href="_contactUs.jsp">İletişim</a></li>
        </ul>

        Copyright © 2048 <a href="#">Your Company Name</a> |
        <a href="http://www.javatpoint.com" target="_parent">Website Projects</a> by <a href="http://www.javatpoint.com"
                                                                                        target="_parent">javatpoint.com</a>
    </div>

</div>
<div align=center>This project downloaded form <a href='http://www.javatpoint.com/'>free website projects</a></div>
</body>
</html>