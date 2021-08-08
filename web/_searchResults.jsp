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
                    if (i < 3) {
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

        <div class="sidebar_box">

            <h2>Bilgilendirme</h2>

            <div class="section_w250 float_l">
                <h3>Kitapları Zamanında Getirin</h3>
                <p>Başka üyelerin de kitaplardan olabilecek en iyi şekilde faydalanabilmesi için lütfen kitaplarınızı
                    teslim tarihleri geçmeden teslim etmeye gayret gösterin.</p>
            </div>

            <div class="cleaner"></div>

        </div>
        <div class="sidebar_box_bottom"></div>

    </div> <!-- end of sidebar -->

    <div id="templatemo_content">

        <div class="content_box">

            <td valign="top">

                <form>
                    <table height="0" cellspacing="5" cellpadding="10">

                        <h2>Arama Sonuçları</h2>
                        <tr>
                            <th>ID</th>
                            <td>
                            <th>ISBN</th>
                            <td>
                            <th>Kitap Adı</th>
                            </td>
                            <td>
                            <th>Yazarı</th>
                            <td>
                            <th>Mevcut</th>
                            </td></tr>


                        <%
                            String sv = request.getParameter("sv");
                            String sp = request.getParameter("sp");
                            Connection connection = AccessLayer.getConnection();
                            PreparedStatement preparedStatement;
                            ResultSet resultSet;
                            String ret;

                            if (sp.equals("Kitap Adı")) {
                                try {
                                    preparedStatement = connection.prepareStatement("select kitap.kitap_ad, kitap.kitap_isbn, yazar.yazar_ad, kitap.kitap_mevcutSayi, kitap.kitap_id from kitap inner join yazar on kitap.kitap_yazarId = yazar_id inner join cevirmen on kitap.kitap_cevirmenid = cevirmen.cevirmen_id inner join yayinevi on kitap.kitap_yayineviid = yayinevi.yayinevi_id where kitap.kitap_ad like'%" + sv + "%'");
                                    System.out.println("ada göre arıyorum " + sv);
                                    resultSet = preparedStatement.executeQuery();

                                    while (resultSet.next() == true) {
                                        out.print("<tr>");
                                        out.print("<td>" + resultSet.getString(5) + "</td>");
                                        out.print("<td><td>" + resultSet.getString(2) + "</td></td>");
                                        out.print("<td><td>" + resultSet.getString(1) + "</td></td>");
                                        out.print("<td><td>" + resultSet.getString(3) + "</td></td>");
                                        out.print("<td><td>" + resultSet.getString(4) + "</td></td>");
                                        out.print("</tr>");
                                    }
                                } catch (SQLException e) {
                                    e.printStackTrace();
                                    System.out.println("Ad temelli kitap arama işlemi sırasında bir hata oluştu:" + e.getMessage());
                                }
                            } else if (sp.equals("ISBN Numarası")) {
                                try {
                                    preparedStatement = connection.prepareStatement("select kitap.kitap_ad, kitap.kitap_isbn, yazar.yazar_ad, kitap.kitap_mevcutSayi, kitap.kitap_id from kitap inner join yazar on kitap.kitap_yazarId = yazar_id inner join cevirmen on kitap.kitap_cevirmenid = cevirmen.cevirmen_id inner join yayinevi on kitap.kitap_yayineviid = yayinevi.yayinevi_id where kitap.kitap_isbn like'%" + sv + "%'");
                                    System.out.println("isbn e göre arıyorum " + sv);
                                    resultSet = preparedStatement.executeQuery();

                                    while (resultSet.next() == true) {
                                        out.print("<tr>");
                                        out.print("<td>" + resultSet.getString(5) + "</td>");
                                        out.print("<td><td>" + resultSet.getString(2) + "</td></td>");
                                        out.print("<td><td>" + resultSet.getString(1) + "</td></td>");
                                        out.print("<td><td>" + resultSet.getString(3) + "</td></td>");
                                        out.print("<td><td>" + resultSet.getString(4) + "</td></td>");
                                        out.print("</tr>");
                                    }
                                } catch (SQLException e) {
                                    e.printStackTrace();
                                    System.out.println("ISBN temelli kitap arama işlemi sırasında bir hata oluştu:" + e.getMessage());
                                }
                            } else if (sp.equals("Kitap Yazarı")) {
                                try {
                                    preparedStatement = connection.prepareStatement("select kitap.kitap_ad, kitap.kitap_isbn, yazar.yazar_ad, kitap.kitap_mevcutSayi, kitap.kitap_id from kitap inner join yazar on kitap.kitap_yazarId = yazar_id inner join cevirmen on kitap.kitap_cevirmenid = cevirmen.cevirmen_id inner join yayinevi on kitap.kitap_yayineviid = yayinevi.yayinevi_id where yazar.yazar_ad like'%" + sv + "%'");
                                    System.out.println("yazara göre arıyorum: " + sv);
                                    resultSet = preparedStatement.executeQuery();

                                    while (resultSet.next() == true) {
                                        out.print("<tr>");
                                        out.print("<td>" + resultSet.getString(5) + "</td>");
                                        out.print("<td><td>" + resultSet.getString(2) + "</td></td>");
                                        out.print("<td><td>" + resultSet.getString(1) + "</td></td>");
                                        out.print("<td><td>" + resultSet.getString(3) + "</td></td>");
                                        out.print("<td><td>" + resultSet.getString(4) + "</td></td>");
                                        out.print("</tr>");
                                    }
                                } catch (SQLException e) {
                                    e.printStackTrace();
                                    System.out.println("Yazar temelli kitap arama işlemi sırasında bir hata oluştu:" + e.getMessage());
                                }
                            } else {
                                System.out.println("Parametre seçmeden giriş yapıldı.");
                            }
                        %>

                    </table>
                </form>

            </td>


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