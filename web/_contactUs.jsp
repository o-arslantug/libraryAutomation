<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="internshipProject.dao.AnnouncementDAO" %>
<%@page import="internshipProject.model.Announcement" %>
<%@page import="java.util.List" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Education</title>
    <meta name="keywords" content="free css templates, education, school, college, university, templatemo.com"/>
    <meta name="description" content="Education template is for academic related websites"/>
    <link href="templatemo_style.css" rel="stylesheet" type="text/css"/>

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

            <h2>Duyurular</h2>

            <%
                int i = 0;
                List<Announcement> announcementList = AnnouncementDAO.getAnnouncementRecords();

                for (Announcement announcement : announcementList) {
                    if (i < 5) {
            %>

            <div class="news_box">
                <a href="#"><%out.print(announcement.getAnnouncementTitle());%></a>
                <p class="post_info">Posted by <span><%out.print(announcement.getAnnouncementAnnouncer());%></span><br>
                    on <span><%out.print(announcement.getAnnouncementDate());%></span></p>
            </div>

            <%
                        i++;
                    }
                }
            %>

        </div>

        <div class="sidebar_box_bottom"></div>

    </div> <!-- end of sidebar -->

    <div id="templatemo_content">

        <div class="content_box">

            <td valign="top">

                <form>
                    <table height="0" cellspacing="5" cellpadding="10">
                        <h2>İletişim Bilgimiz</h2>
                        <h4>Aşağıdaki verilen bilgilerden herhangi birini kullanarak bizimle iletişime geçebilir,
                            sorularınızı ya da görüşlerinizi iletebilirsiniz.</h4>

                        <tr>
                            <td><a>Sabit Telefon Numaramız:</a></td>
                            <td><a><b>(0374) 374 XX XX</b></a></td>
                        </tr>
                        <tr>
                            <td><a>Mobil Telefon Numaramız:</a></td>
                            <td><a><b>(0537) 537 XX XX</b></a></td>
                        </tr>
                        <tr>
                            <td><a>Mail Adresimiz:</a></td>
                            <td><a><b><a href="mailto:mailAdresi@kutuphane.com">mailAdresi@kutuphane.com</a></b></a>
                            </td>
                        </tr>
                        <tr>
                            <td><a>Kütüphane Adresimiz:</a></td>
                            <td><a><b><a> A Mahallesi, B Sokak, C İş Merkezi, D Kat, "Kütüphane Adı",
                                Merkez/F</a></b></a></td>
                        </tr>
                    </table>
                </form>

            </td>


            <div class="cleaner"></div>
        </div>
        <div class="content_box_bottom"></div>

        <div class="content_box">

            <h2>Açıklama</h2>

            <div class="section_w250 float_l">
                <h3>İletişime Geçin</h3>
                <p>Bizimle iletişime geçerek görüşlerinizi bildirebilir, kendimizi geliştirmemiz için yardımcı
                    olabilirsiniz.</p>

            </div>

            <div class="section_w250 float_r">
                <h3>Hakkımızda</h3>
                <p>Hakkımızda detaylı bilgi almak için lütfen kütüphanemizi ziyaret edin. </p>

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