<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="internshipProject.dao.LoginVerificationDAO" %>
<%@page import="internshipProject.dao.AnnouncementDAO" %>
<%@page import="internshipProject.model.Announcement" %>
<%@page import="internshipProject.dao.AccessLayer" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.List" %>

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
                    document.F1.announcementText.focus()
                    return false
                }
            }

            return true
        }
    </SCRIPT>

    <SCRIPT src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></SCRIPT>
    <SCRIPT>
        function ifItWorks() {
            Swal.fire({
                position: 'center',
                icon: 'success',
                title: 'Bilgi',
                text: 'İşlem başarıyla gerçekleştirildi.',
                showConfirmButton: false,
                timer: 1500
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

            <table width="300" height="0" border="0" cellspacing="10" cellpadding="0" align="center">

                <%

                    out.println("<br><a href='_loggedInStaff.jsp'>Geri Dönmek İçin Tıkla</a>");
                    out.println("<br><br><br><a href='worksOnLogout'>Çıkış Yap</a>");
                    out.println("<br></br>");
                %>
            </table>

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
                            if (session.getAttribute("verifyControl") == "approvedStaff") {} 
                            else {
                                response.sendRedirect("_error.jsp");
                            }
                        %>

                ${itWorks}


                <h2>Duyuru Ekle</h2>
                <h4>Duyuru metnini yazınız ve 'Yayınla' butonuna basınız.</h4>

                <form name=F1 onSubmit="return checkBoxes(this)"
                      action="<%= request.getContextPath()%>/worksOnAnnouncement"
                      method="post">

                    <tr>
                        <td><b>Duyuru Özeti; (Maksimum 75 karakter)</b></td>
                        <br></br></tr>
                    <textarea maxlength="75" rows=2 cols=72 wrap=virtual name="announcementText" required
                              placeholder="Sol menüde duyuru başlığı olarak gözükecek metni giriniz."></textarea>
                    <br></br>
                    <tr>
                        <td><b>Duyuru Açıklaması; (Maksimum 1000 karakter)</b></td>
                        <br></br></tr>
                    <textarea maxlength="1000" rows=6 cols=72 wrap=virtual name="announcementDescription" required
                              placeholder="Duyurular sekmesine gidildiğide, başlığa dair açıklama olarak gözükecek metni giriniz."></textarea>
                    <br></br><input type="submit" value="Yayınla"/>
                    <INPUT type="reset" value="Temizle">

                    <table height="0" cellspacing="5" cellpadding="10">

                        <br></br>
                    </table>
                </form>


                <div class="cleaner"></div>
        </div>
        <div class="content_box_bottom"></div>

        <div class="content_box">

            <h2>Açıklama</h2>

            <div class="section_w250 float_l">
                <h3>Duyuruları Kullanın</h3>
                <p>Bu sayfa üzerinden önemli gördüğünüz olay ve etkinliklere dair bilgiler paylaşın.</p>

            </div>

            <div class="section_w250 float_r">
                <h3>Ziyaretçilerinize Erişin</h3>
                <p>Sistemi ziyaret eden kullanıcıların bunlardan haber olmasını sağlayın.</p>

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