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

    <SCRIPT LANGUAGE="JavaScript">
        function checkBoxes(form) {
            for (var i = 0; i < form.elements.length; i++) {
                if (form.elements[i].value == "") {
                    alert("Lütfen ilgili kutucukları doldurun.")
                    document.F1.memberLoginID.focus()
                    return false
                }
            }

            if (document.F1.memberPassword.value != document.F1.RMP.value) {
                alert("Girilen şifreler birbiri ile eşleşmelidir.");
                document.F1.memberPassword.value = ""
                document.F1.RSP.value = ""
                document.F1.RMP.focus()
                return false
            }

            if (!isNaN(document.F1.memberName.value)) {
                alert("Ad değeri yalnızca rakamlardan oluşamaz.")
                document.F1.memberName.value = ""
                document.F1.memberName.focus()
                return false
            }

            if (isNaN(document.F1.memberGSM.value)) {
                if (document.F1.memberGSM.value > 9999999999) {
                    alert("Telefon no değeri yalnızca rakamlardan olaşbilir.")
                    document.F1.memberGSM.value = ""
                    document.F1.memberGSM.focus()
                    return false
                }
            } else {
                alert("Telefon no değerini kontrol ediniz.")
                document.F1.memberGSM.value = ""
                return false
            }

            if (!isNaN(document.F1.memberMail.value)) {
                alert("Mail değeri yalnızca rakamlardan oluşamaz.")
                document.F1.memberMail.value = ""
                document.F1.memberMail.focus()
                return false
            }

            if (!isNaN(document.F1.memberAddress.value)) {
                alert("Adres değeri yalnızca rakamlardan oluşamaz.")
                document.F1.memberAddress.value = ""
                document.F1.memberAddress.focus()
                return false
            }

            if (!isNaN(document.F1.syd.value)) {
                alert("Seçim yapmadan ilerleyemezsiniz.")
                document.F1.syd.value = ""
                document.F1.syd.focus()
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
                text: 'Üyelik tipi seçiniz.',
                showConfirmButton: true
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

            <%if (session.getAttribute("verifyControl") == "approvedStaff") {%>

            <%

                out.println("<br><a href='_memberDetails.jsp'>Geri Dönmek İçin Tıkla</a>");
                out.println("<br><br><br><a href='worksOnLogout'>Çıkış Yap</a>");
                out.println("<br></br>");
            %>


            <%
            } else {
            %>


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


            <%}%>


        </div>
        <div class="sidebar_box_bottom"></div>

        <%if (session.getAttribute("verifyControl") == "approvedStaff") {%>


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

        <% } else {
        }%>

    </div> <!-- end of sidebar -->

    <div id="templatemo_content">

        <div class="content_box">

            <td valign="top">

                ${itDidntSelect}

                <h2>Üye Ekle</h2>
                <h4>Tüm alanları olması gerektiği gibi doldurunuz ve 'Ekle' butonuna basınız.</h4>

                <form name=F1 onSubmit="return checkBoxes(this)" action="<%= request.getContextPath()%>/worksOnMember"
                      method="post">
                    <table height="0" cellspacing="5" cellpadding="10">
                        <tr>
                            <td>Kullanıcı Adı:</td>
                            <td><input type="text" name="memberLoginID" required placeholder="Bu alanı boş bırakılamaz."/></td>
                        </tr>
                        <tr>
                            <td>Şifre:</td>
                            <td><input type="password" name="memberPassword" required placeholder="Bu alanı boş bırakılamaz."/></td>
                        </tr>
                        <tr>
                            <td>Şifre(tekrar):</td>
                            <td><input type="password" name="RMP" required placeholder="Bu alanı boş bırakılamaz."/></td>
                        </tr>
                        <tr>
                            <td>Adı-Soyad:</td>
                            <td><input type="text" name="memberName" required placeholder="Bu alanı boş bırakılamaz."/></td>
                        </tr>
                        <tr>
                            <td>Telefon No:</td>
                            <td><input type="text" name="memberGSM" value="05xx xxx xx xx" required placeholder="Bu alanı boş bırakılamaz."/></td>
                        </tr>
                        <tr>
                            <td>e-Mail:</td>
                            <td><input type="text" name="memberMail" required placeholder="Bu alanı boş bırakılamaz."/></td>
                        </tr>
                        <tr>
                            <td>Üyelik Tipi:</td>
                            <td><select name="memberType" class="form-control" style=width:177px;>
                                <option value="-1">Seçim Yapınız</option>
                                <option>Öğrenci
                                <option>Öğretmen
                                <option>Vatandaş
                            </select></td>
                        </tr>
                        <tr>
                            <td>Adres:</td>
                            <td><textarea rows=4 cols=40 wrap=virtual name="memberAddress" required placeholder="Bu alanı boş bırakılamaz."></textarea></td>
                        </tr>
                        <input type="hidden" name="comingFrom" value="registerMember" readonly="readonly"/>
                        <tr>
                            <td></td>
                            <td><input type="submit" value="Gönder"/><INPUT type="reset" value="Temizle"></td>
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