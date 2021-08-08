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
                    document.F1.bookName.focus()
                    return false
                }
            }

            if (isNaN(document.F1.bookISBN.value)) {
                alert("ISBN değeri yalnızca rakamlardan olaşbilir.")
                document.F1.bookISBN.value = ""
                document.F1.bookISBN.focus()
                return false
            }


            if (isNaN(document.F1.bookPublishingYear.value)) {
                alert("Basım yılı değeri yalnızca rakamlardan olaşbilir.")
                document.F1.bookPublishingYear.value = ""
                document.F1.bookPublishingYear.focus()
                return false
            }


            if (!isNaN(document.F1.bookCategory.value)) {
                alert("Kategori değeri yalnızca rakamlardan oluşamaz.")
                document.F1.bookCategory.value = ""
                document.F1.bookCategory.focus()
                return false
            }

            if (!isNaN(document.F1.bookLocation.value)) {
                alert("Konum değeri yalnızca rakamlardan oluşamaz.")
                document.F1.bookLocation.value = ""
                document.F1.bookLocation.focus()
                return false
            }
            if (isNaN(document.F1.bookCurrentNumber.value)) {
                alert("Mevcut sayı değeri yalnızca rakamlardan oluşabilir.")
                document.F1.bookCurrentNumber.value = ""
                document.F1.bookCurrentNumber.focus()
                return false
            }

            return true
        }
    </SCRIPT>

    <SCRIPT src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></SCRIPT>
    <SCRIPT>
        function ifItDidntSelect() {
            Swal.fire({
                position: 'center',
                icon: 'warning',
                title: 'Uyarı!',
                text: 'İşlem gerçekleştirilemedi.',
                text: 'Çevirmen, yayınevi ve yazar seçiniz.',
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


            <br><a href='_bookDetails.jsp'>Geri Dönmek İçin Tıkla</a>
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

                                out.print("<h2>Kitap Ekle</h2>");
                                out.print("<h4>Tüm alanları olması gerektiği gibi doldurunuz ve 'Ekle' butonuna basınız.</h4>");

                            } else {
                                response.sendRedirect("_error.jsp");
                            }
                        %>

                ${itDidntSelect}

                <form name=F1 onSubmit="return checkBoxes(this)" action="<%= request.getContextPath()%>/worksOnBook"
                      method="post">
                    <table height="0" cellspacing="5" cellpadding="10">
                        <tr>
                            <td>Kitap Adı:</td>
                            <td><input type="text" name="bookName" required placeholder="Bu alanı boş bırakılamaz."/>
                            </td>
                        </tr>
                        <tr>
                            <td>ISBN No:</td>
                            <td><input type="text" name="bookISBN" required placeholder="Bu alanı boş bırakılamaz."/>
                            </td>
                        </tr>
                        <tr>
                            <td>Basım Yılı:</td>
                            <td><input type="text" name="bookPublishingYear" required
                                       placeholder="Bu alanı boş bırakılamaz."/></td>
                        </tr>
                        <tr>
                            <td>Çevirmen Adı:</td>
                            <td><select name="bookTranslatorID" class="form-control" style=width:177px;>
                                <option value="-1">Çevirmen Seçiniz</option>
                                <%
                                    try {
                                        Connection connection = AccessLayer.getConnection();
                                        PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM Cevirmen");
                                        ResultSet resultSet = preparedStatement.executeQuery();

                                        while (resultSet.next()) {
                                %>
                                <option value="<%=resultSet.getString("cevirmen_id")%>"><%=resultSet.getString("cevirmen_ad")%>
                                </option>
                                <%
                                        }
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                        out.println("Hata: " + e.getMessage());
                                    }
                                %>
                            </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Yayınevi Adı:</td>
                            <td><select name="bookPublisherID" class="form-control" style=width:177px;>
                                <option value="-1">Yayınevi Seçiniz</option>
                                <%
                                    try {
                                        Connection connection = AccessLayer.getConnection();
                                        PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM Yayinevi");
                                        ResultSet resultSet = preparedStatement.executeQuery();

                                        while (resultSet.next()) {
                                %>
                                <option value="<%=resultSet.getString("yayinevi_id")%>"><%=resultSet.getString("yayinevi_ad")%>
                                </option>
                                <%
                                        }
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                        out.println("Hata: " + e.getMessage());
                                    }
                                %>
                            </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Yazar Adı:</td>
                            <td><select name="bookAuthorID" class="form-control" style=width:177px;>
                                <option value="-1">Yazar Seçiniz</option>
                                <%
                                    try {
                                        Connection connection = AccessLayer.getConnection();
                                        PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM Yazar");
                                        ResultSet resultSet = preparedStatement.executeQuery();

                                        while (resultSet.next()) {
                                %>
                                <option value="<%=resultSet.getString("yazar_id")%>"><%=resultSet.getString("yazar_ad")%>
                                </option>
                                <%
                                        }
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                        out.println("Hata: " + e.getMessage());
                                    }
                                %>
                            </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Kategori:</td>
                            <td><input type="text" name="bookCategory" required
                                       placeholder="Bu alanı boş bırakılamaz."/></td>
                        </tr>
                        <tr>
                            <td>Konum:</td>
                            <td><input type="text" name="bookLocation" required
                                       placeholder="Bu alanı boş bırakılamaz."/></td>
                        </tr>
                        <tr>
                            <td>Mevcut Sayı:</td>
                            <td><input type="text" name="bookCurrentNumber" required
                                       placeholder="Bu alanı boş bırakılamaz."/></td>
                        </tr>
                        <input type="hidden" name="comingFrom" value="addBook" readonly="readonly"/>
                        </tr>
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