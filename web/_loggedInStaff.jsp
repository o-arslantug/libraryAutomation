c<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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

    <SCRIPT LANGUAGE="JavaScript">
        function checkBoxes(form) {
            for (var i = 0; i < form.elements.length; i++) {
                if (form.elements[i].value == "") {
                    alert("Lütfen ilgili kutucukları doldurun.")
                    document.F1.teslimID.focus()
                    return false
                }
            }

            if (isNaN(document.F1.teslimID.value)) {
                alert("ID değeri yalnızca rakamlardan olaşbilir.")
                document.F1.teslimID.value = ""
                document.F1.teslimID.focus()
                return false
            }

            return true
        }
    </SCRIPT>

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
                text: 'Teslim alınmak istenilen kayıt zaten teslim alınmış.',
                showConfirmButton: true,
            })
        }

        function ifItCantFind() {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Hata!',
                text: 'ID ile eşleşen kayıt bulunamadı.',
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

            <td valign="top">


                    <%
                    %>
                <table width="300" height="0" border="0" cellspacing="10" cellpadding="0" align="center"><%
                    String username = "";
                    String password = "";
                    String _booleanDeger = "0";

                    if (session.getAttribute("verifyControl") == "approvedStaff") {
                        username = session.getAttribute("username").toString();
                        password = session.getAttribute("password").toString();
                        _booleanDeger = LoginVerificationDAO.checkStaffLogin(username, password);
                    } else {
                        response.sendRedirect("_error.jsp");
                    }

                    try {
                        if (_booleanDeger != "0") {

                            out.print("<b>Hoşgeldiniz,</b>");
                            out.println("<br>" + _booleanDeger + "</br>");
                            out.println("<br><a href='_logsAndStatistics.jsp'>Döküm ve İstatistik</a></br>");
                            out.println("<br><a href='_addAnnouncement.jsp'>Duyuru Ekle</a>");
                            out.println("<br><a href='_lendingLibrary.jsp'>Ödünç Verme İşlemleri</a>");
                            out.println("<br><a href='_memberDetails.jsp'>Üye Detaylarını Görüntüle</a>");
                            out.println("<br><a href='_bookDetails.jsp'>Kitap Detaylarını Görüntüle</a>");
                            out.println("<br><a href='_staffDetails.jsp'>Personel Detaylarını Görüntüle</a>");

                            out.println("<br><br><br><a href='worksOnLogout'>Çıkış Yap</a>");

                            Connection con = AccessLayer.getConnection();
                            PreparedStatement ps = con.prepareStatement("");

                        } else {
                        }
                                /*else{
                                                request.setAttribute("aa","Kullanıcı adı veya şifreniz hatalı!");
                                                response.sendRedirect("_error.jsp");
			 
                                                }*/
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
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


                <table height="0" cellspacing="5" cellpadding="10">

                    ${loginSuccessful}
                    ${itWorks}
                    ${itDoesntWork}
                    ${itCantFind}

                    <% out.print("<h2>Yönetici olarak giriş yaptınız.</h2>");
                        out.print("<h4>Sol menüden yapmak istediğiniz işlemi seçebilir, aşağıdaki liste aracılığıyla teslimatı bugün yapılması gereken ve gecikmiş durumda olan kayıtları inceleyebilirsiniz. </h4>");

                        try {
                            Connection con = AccessLayer.getConnection();
                            PreparedStatement ps = con.prepareStatement("select kitapdurum.kitapDurum_id, uye.uye_ad, kitap.kitap_ad, kitapdurum.kitapdurum_verilistarih, kitapdurum.kitapdurum_teslimtarih from kitapdurum inner join kitap on kitapdurum.kitap_id = kitap.kitap_id inner join uye on uye.uye_id = kitapdurum.uye_id where kitapdurum.kitapdurum_teslimDurumu = 0 and datediff(kitapdurum.kitapDurum_teslimTarih, curdate())=0");
                            ResultSet rs = ps.executeQuery();
                            PreparedStatement psc = con.prepareStatement("select kitapdurum.kitapDurum_id, uye.uye_ad, kitap.kitap_ad, kitapdurum.kitapdurum_verilistarih, kitapdurum.kitapdurum_teslimtarih from kitapdurum inner join kitap on kitapdurum.kitap_id = kitap.kitap_id inner join uye on uye.uye_id = kitapdurum.uye_id where kitapdurum.kitapdurum_teslimDurumu = 0 and datediff(kitapdurum.kitapDurum_teslimTarih, curdate())=0");
                            ResultSet control = psc.executeQuery();
                    %>

                    <form name=F1 onSubmit="return checkBoxes(this)"
                          action="<%= request.getContextPath()%>/worksOnCommonLibraryFunctions" method="post">


                        <tr><b>İşlem No: </b></tr>
                        <input type="text" name="teslimID" required placeholder="İşlem numarası giriniz."/><b> </b>
                        <input type="Submit" value="Teslim Al" formaction="worksOnCommonLibraryFunctions"/>
                        <br></br>
                    </form>

                    <%
                        out.print("<h3>Günün Teslimat Listesi;</h3>");

                        if (control.next() == false) {
                            out.println("<br></br>Bugün teslim edilmesi gereken kitap bulunamadı!<br></br><br>");
                        } else {
                            out.print("<tr><th>Teslim Tarihi</th><td><th>Ödünç Alan</th><td><th>Kitap Adı</th></td><td><th>İşlem No</th></td></tr>");

                            while (rs.next()) {
                                out.print("<tr>");
                                out.print("<td>" + rs.getString(5) + "</td>");
                                out.print("<td><td>" + rs.getString(2) + "</td></td>");
                                out.print("<td><td>" + rs.getString(3) + "</td></td>");
                                out.print("<td><td>" + rs.getString(1) + "</td></td>");
                                out.print("</tr>");
                            }
                        }

                    %>
                </table>
                <table height="0" cellspacing="5" cellpadding="10">
                    <%
                            PreparedStatement ps1 = con.prepareStatement("select kitapdurum.kitapDurum_id, uye.uye_ad, kitap.kitap_ad, kitapdurum.kitapdurum_verilistarih, kitapdurum.kitapdurum_teslimtarih from kitapdurum inner join kitap on kitapdurum.kitap_id = kitap.kitap_id inner join uye on uye.uye_id = kitapdurum.uye_id where kitapdurum.kitapdurum_teslimDurumu = 0 and datediff(kitapdurum.kitapDurum_teslimTarih, curdate())<0 ORDER BY kitapdurum_teslimTarih DESC");
                            ResultSet rs1 = ps1.executeQuery();
                            PreparedStatement ps1c = con.prepareStatement("select kitapdurum.kitapDurum_id, uye.uye_ad, kitap.kitap_ad, kitapdurum.kitapdurum_verilistarih, kitapdurum.kitapdurum_teslimtarih from kitapdurum inner join kitap on kitapdurum.kitap_id = kitap.kitap_id inner join uye on uye.uye_id = kitapdurum.uye_id where kitapdurum.kitapdurum_teslimDurumu = 0 and datediff(kitapdurum.kitapDurum_teslimTarih, curdate())<0 ORDER BY kitapdurum_teslimTarih DESC");
                            ResultSet control1 = ps1c.executeQuery();
                            out.print("<h3>Gecikmiş Teslimat Listesi;</h3>");

                            if (!control1.next()) {
                                out.println("<br></br>Gecikmiş teslimat bulunamadı!<br></br><br>");
                            } else {
                                out.print("<tr><th>Teslim Tarihi</th><td><th>Ödünç Alan</th><td><th>Kitap Adı</th><td><th>İşlem No</th></tr>");

                                while (rs1.next()) {

                                    out.print("<tr>");
                                    out.print("<td>" + rs1.getString(5) + "</td>");
                                    out.print("<td><td>" + rs1.getString(2) + "</td></td>");
                                    out.print("<td><td>" + rs1.getString(3) + "</td></td>");
                                    out.print("<td><td>" + rs1.getString(1) + "</td></td>");
                                    out.print("</tr>");
                                }
                            }
                        } catch (SQLException e) {

                            e.printStackTrace();
                        }
                    %>
                </table>


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