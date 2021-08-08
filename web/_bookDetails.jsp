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
                    document.F1.bookID.focus()
                    return false
                }
            }

            if (isNaN(document.F1.bookID.value)) {
                alert("ID değeri yalnızca rakamlardan oluşabilir.")
                document.F1.bookID.value = ""
                document.F1.bookID.focus()
                return false
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

        function ifItDoesntWork() {
            Swal.fire({
                position: 'center',
                icon: 'warning',
                title: 'Uyarı!',
                text: 'İşlem gerçekleştirilemedi.',
                text: 'Teslim edilmesi gereken bir kitabı silemezsiniz.',
                showConfirmButton: true,
            })
        }

        function ifItCantFind() {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Hata!',
                text: 'ID ile eşleşen kitap bulunamadı.',
                showConfirmButton: true,
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
                    out.println("<br><br><a href='_addAuthor.jsp'>Yazar Ekle</a>");
                    out.println("<br><a href='_addPublisher.jsp'>Yayınevi Ekle</a>");
                    out.println("<br><a href='_addTranslator.jsp'>Çevirmen Ekle</a>");
                    out.println("<br><br><br><a href='worksOnLogout'>Çıkış Yap</a><br></br>");
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

                <form name=F1 onSubmit="return checkBoxes(this)" action="<%= request.getContextPath()%>/worksOnBook"
                      method="post">
                    <table height="0" cellspacing="5" cellpadding="10">

                        ${itWorks}
                        ${itDoesntWork}
                        ${itCantFind}

                        <%

                            if (session.getAttribute("verifyControl") == "approvedStaff") {
                            } else {
                                response.sendRedirect("_error.jsp");
                            }

                            try {
                                Connection connection = AccessLayer.getConnection();
                                PreparedStatement preparedStatement = connection.prepareStatement("select kitap.kitap_id, kitap.kitap_ad, kitap.kitap_isbn, yazar.yazar_ad, kitap.kitap_kategori, kitap.kitap_basimYili, cevirmen.cevirmen_ad, yayinevi.yayinevi_ad, kitap.kitap_konum, kitap.kitap_mevcutSayi from kitap inner join yazar on kitap.kitap_yazarId = yazar_id inner join cevirmen on kitap.kitap_cevirmenid = cevirmen.cevirmen_id inner join yayinevi on kitap.kitap_yayineviid = yayinevi.yayinevi_id ORDER BY kitap.kitap_id ASC");
                                ResultSet resultSet = preparedStatement.executeQuery();

                                out.print("<h2>Kitap Detayları</h2>");
                                out.print("<h4><a href='_addBook.jsp'><b>Buraya</b></a> tıklayarak kitap ekleyebilir,<br>'Kitap ID' değerini belirterek var olan kitaplar üzerinde işlem yapabilirsiniz.</h4>");
                        %>

                        <tr><b>Kitap ID: </b></tr>
                        <input type="text" name="bookID" required placeholder="ID giriniz."/><b> </b>
                        <input type="Submit" value="Sil" action="/worksOnBook" name="comingFrom"/><b> </b>
                        <input type="Submit" value="Düzenle" formaction="_updateBook.jsp"/>

                        <%
                                out.print("<tr><th>Kayıt ID</th><th>Kitap Adı</th><th>Yazarı</th></tr>");

                                while (resultSet.next()) {
                                    out.print("<tr>");
                                    out.print("<td>" + resultSet.getString(1) + "</td>");
                                    out.print("<td>" + resultSet.getString(2) + "</td>");
                                    out.print("<td>" + resultSet.getString(4) + "</td>");
                                    out.print("</tr>");
                                }
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }

                        %></table>
                </form>
            </td>


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