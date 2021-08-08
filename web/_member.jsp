<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="internshipProject.dao.AnnouncementDAO"%>
<%@page import="internshipProject.model.Announcement"%>
<%@page import="java.util.List"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Education</title>
    <meta name="keywords" content="free css templates, education, school, college, university, templatemo.com"/>
    <meta name="description" content="Education template is for academic related websites"/>
    <link href="templatemo_style.css" rel="stylesheet" type="text/css"/>

    <SCRIPT LANGUAGE="JavaScript">
        function checkBox(form) {

            for (var i = 0; i < form.elements.length; i++) {
                if (form.elements[i].value == "") {
                    alert("Lütfen ilgili kutucukları doldurun.")
                    document.F1.mUsername.focus()
                    return false
                }
            }

            return true
        }
    </SCRIPT>
    
    <SCRIPT src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></SCRIPT>
    <SCRIPT>
        function ifLoginFailed() {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Giriş başarısız!',
                text: 'Kullanıcı adı ve şifrenizi kontrol edin.',
                showConfirmButton: true,
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
                icon: 'error',
                title: 'Hata!',
                text: 'İşlem gerçekleştirilemedi.',
                text: 'Teslim edilmesi gereken bir kitaba dair kaydı bulunan üyeyi silemezsiniz.',
                showConfirmButton: true,
            })
        }
        
        function ifItCantFind() {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Hata!',
                text: 'ID ile eşleşen üye bulunamadı.',
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

            <h2>Giriş Yapın</h2>

            ${loginFailed}
            ${itWorks}
            ${itDoesntWork}
            ${itCantFind}
            
            <form name=F1 onSubmit="return checkBoxes(this)" action="<%= request.getContextPath()%>/worksOnAuthentication" method="post">
                <table height="4" cellspacing="0" cellpadding="0">

                    <tr><b>Kullanıcı Adı:</b></tr>
                    <input type="text" name="mUsername" required placeholder="kullaniciAdi"/>
                    <br></br>
                    
                    <tr><b>Şifre:</b></tr>
                    <input type="password" name="mPassword" required placeholder="sifre"/>
                    <br></br>

                    <input type="Submit" value="Üye Girişi Yap"/>
                    <br></br>
                    
                </table>
            </form>
            <form name=F2 action="/submit">
                <input type="Submit" value="Üye Ol" formaction="_registerMember.jsp"/>
            </form>
            

        </div>
        <div class="sidebar_box_bottom"></div>

        <div class="sidebar_box">

            <h2>Duyurular</h2>

            <div class="section_w250 float_l">

                <%
                int i = 0;
                List<Announcement> announcementList = AnnouncementDAO.getAnnouncementRecords();

                for (Announcement announcement : announcementList) {
                    if (i < 2) {
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

            <div class="cleaner"></div>

        </div>
        <div class="sidebar_box_bottom"></div>

    </div> <!-- end of sidebar -->

    <div id="templatemo_content">

        <div class="content_box">

            <h2>Üye Paneline Hoşgeldiniz!</h2>

            <p>Üye paneli aracılığı ile geçmişe dönük ödünç alma geçmişinizi takip edebilir, yaklaşan teslimatlarınızı
                görüntüleyebilirsiniz.</p>
            <br></br><b><a href='_registerMember.jsp'><b>Buraya</b></a> tıklayarak hemen üye olabilirsiniz!</b></p>

            <div class="cleaner_h20"></div>

            <div class="image_fl">
                <img src="images/templatemo_images03.jpg" alt="image"/>
            </div>

            <div class="cleaner"></div>
        </div>
        <div class="content_box_bottom"></div>

        <div class="content_box">

            <h2>Açıklama</h2>

            <div class="section_w250 float_l">
                <h3>Takip Edin</h3>
                <p>Ödünç aldığınız kitapın teslim tarihlerini kolayca takip edin, diğer üyelerin de aynı kitaplara
                    ihtiyacı olabileceğini unutmayın.</p>

            </div>

            <div class="section_w250 float_r">
                <h3>Zamanında Getirin</h3>
                <p>Zamanında teslim edilmeyen kitaplar için belirli bir süre boyunca cezalandırılırsınız. Ceza almamak
                    için teslimatlarınızı vaktinde yapın.</p>

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