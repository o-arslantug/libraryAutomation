<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="internshipProject.dao.LoginVerificationDAO" %>
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

    <SCRIPT src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></SCRIPT>
    <SCRIPT>
        function ifLoginSuccessful() {
            Swal.fire({
                position: 'center',
                icon: 'success',
                title: 'Onaylandı!',
                showConfirmButton: false,
                timer: 1000
            })
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

            <%
                out.println("<br><a href='worksOnLogout'>Çıkış Yap</a>");
                out.println("<br></br>");
            %>

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

            ${loginSuccessful}

            <table height="0" cellspacing="5" cellpadding="10"><%

                String mUsername = "";
                String mPassword = "";
                String _booleanDeger = "0";

                if (session.getAttribute("verifyControl") == "approvedUser") {
                    mUsername = session.getAttribute("mUsername").toString();
                    mPassword = session.getAttribute("mPassword").toString();
                    _booleanDeger = LoginVerificationDAO.checkUserLogin(mUsername, mPassword);
                } else {
                    response.sendRedirect("_error.jsp");
                }

                try {

                    if (_booleanDeger != "0") {

                        //session.setAttribute("loginusername", username);
                        //session.setAttribute("loginpassword", password);
                        out.print("<h2>Üye olarak giriş yaptınız.</h2>");
                        out.print("<font size=4><b>Hoşgeldiniz, </b>" + _booleanDeger + "</font> <br></br>");
                        Connection connection = AccessLayer.getConnection();
                        PreparedStatement preparedStatement = connection.prepareStatement("select uye.uye_ad, kitap.kitap_ad, kitapdurum.kitapdurum_verilistarih, kitapdurum.kitapdurum_teslimtarih from kitapdurum inner join kitap on kitapdurum.kitap_id = kitap.kitap_id inner join uye on uye.uye_id = kitapdurum.uye_id where uye.uye_lid = ? and datediff(kitapdurum.kitapDurum_teslimTarih, curdate())>=0");
                        preparedStatement.setString(1, mUsername);
                        ResultSet resultSet = preparedStatement.executeQuery();
                        PreparedStatement preparedStatementControl = connection.prepareStatement("select uye.uye_ad, kitap.kitap_ad, kitapdurum.kitapdurum_verilistarih, kitapdurum.kitapdurum_teslimtarih from kitapdurum inner join kitap on kitapdurum.kitap_id = kitap.kitap_id inner join uye on uye.uye_id = kitapdurum.uye_id where uye.uye_lid = ? and datediff(kitapdurum.kitapDurum_teslimTarih, curdate())>=0");
                        preparedStatementControl.setString(1, mUsername);
                        ResultSet resultSetControl = preparedStatementControl.executeQuery();

                        out.print("<h3>Yaklaşan Teslimat Listesi;</h3>");

                        if (!resultSetControl.next()) {
                            out.println("<br></br>Yaklaşan teslimat bulunamadı!<br></br><br>");
                        } else {
                            out.print("<tr><th>Kitap Adı</th><td><th>Alınma Tarihi</th></td><td><th>Teslim Tarihi</th></td></tr>");

                            while (resultSet.next()) {
                                out.print("<tr>");
                                out.print("<td>" + resultSet.getString(2) + "</td>");
                                out.print("<td><td>" + resultSet.getString(3) + "</td></td>");
                                out.print("<td><td>" + resultSet.getString(4) + "</td></td>");
                            }
                        }

            %>
            </table>
            <table height="0" cellspacing="5" cellpadding="10">
                <%
                            PreparedStatement preparedStatement1 = connection.prepareStatement("select uye.uye_ad, kitap.kitap_ad, kitapdurum.kitapdurum_verilistarih, kitapdurum.kitapdurum_teslimtarih from kitapdurum inner join kitap on kitapdurum.kitap_id = kitap.kitap_id inner join uye on uye.uye_id = kitapdurum.uye_id where uye.uye_lid = ? and datediff(kitapdurum.kitapDurum_teslimTarih, curdate())<0");
                            preparedStatement1.setString(1, mUsername);
                            ResultSet resultSet1 = preparedStatement1.executeQuery();
                            PreparedStatement preparedStatement1Control = connection.prepareStatement("select uye.uye_ad, kitap.kitap_ad, kitapdurum.kitapdurum_verilistarih, kitapdurum.kitapdurum_teslimtarih from kitapdurum inner join kitap on kitapdurum.kitap_id = kitap.kitap_id inner join uye on uye.uye_id = kitapdurum.uye_id where uye.uye_lid = ? and datediff(kitapdurum.kitapDurum_teslimTarih, curdate())<0");
                            preparedStatement1Control.setString(1, mUsername);
                            ResultSet resultSet1Control = preparedStatement1Control.executeQuery();

                            out.print("<h3>Gecikmiş Teslimat Listesi;</h3>");

                            if (!resultSet1Control.next()) {
                                out.println("<br></br>Gecikmiş teslimat bulunamadı, teşekkürler!<br></br><br>");
                            } else {
                                out.print("<tr><th>Kitap Adı</th><td><th>Alınma Tarihi</th></td><td><th>Teslim Tarihi</th></td></tr>");

                                while (resultSet1.next()) {
                                    out.print("<tr>");
                                    out.print("<td>" + resultSet1.getString(2) + "</td>");
                                    out.print("<td><td>" + resultSet1.getString(3) + "</td></td>");
                                    out.print("<td><td>" + resultSet1.getString(4) + "</td></td>");
                                }
                            }
                        }

                    } catch (SQLException e) {
                        e.printStackTrace();
                    }

                %></table>

            <div class="cleaner"></div>
        </div>
        <div class="content_box_bottom"></div>

        <div class="content_box">

            <h2>Açıklama</h2>

            <div class="section_w250 float_l">
                <h3>Ceza Almayın</h3>
                <p>Kitaplarınızı zamanında teslim ederek ceza almaktan kaçının. Cezalı üyelerin bir süre kütüphaneyi
                    kullanamayacağını unutmayın.</p>

            </div>

            <div class="section_w250 float_r">
                <h3>Kitaplara Zarar Vermeyin</h3>
                <p>Ödünç aldığınız kitaplar üzerinde karalama yapmayın, olabildiğince temiz ve iyi kondisyonda teslim
                    etmeye özen gösterin.</p>

            </div>


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