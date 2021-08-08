/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package internshipProject.model;


public class Announcement {
    
    String announcementID;
    String announcementAnnouncer;
    String announcementTitle;
    String announcementDescription;
    String announcementDate;
    
    public Announcement(){
        System.out.println("Duyuru nesnesi oluşturuldu.");
    }

    public String getAnnouncementID() {
        return announcementID;
    }

    public void setAnnouncementID(String announcementID) {
        this.announcementID = announcementID;
    }

    public String getAnnouncementAnnouncer() {
        return announcementAnnouncer;
    }

    public void setAnnouncementAnnouncer(String announcementAnnouncer) {
        this.announcementAnnouncer = announcementAnnouncer;
    }

    public String getAnnouncementTitle() {
        return announcementTitle;
    }

    public void setAnnouncementTitle(String announcementTitle) {
        this.announcementTitle = announcementTitle;
    }

    public String getAnnouncementDescription() {
        return announcementDescription;
    }

    public void setAnnouncementDescription(String announcementDescription) {
        this.announcementDescription = announcementDescription;
    }

    public String getAnnouncementDate() {
        return announcementDate;
    }

    public void setAnnouncementDate(String announcementDate) {
        this.announcementDate = announcementDate;
    }    
}
