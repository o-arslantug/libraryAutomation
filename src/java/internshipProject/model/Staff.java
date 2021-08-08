/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package internshipProject.model;


public class Staff {

    String staffID;
    String staffLoginID;
    String staffPassword;
    String staffName;
    String staffGSM;
    String staffMail;
    String staffAddress;
    
    public Staff() {
        System.out.println("Personel nesnesi oluşturuldu.");
    }

    public String getStaffID() {
        return staffID;
    }

    public void setStaffID(String staffID) {
        this.staffID = staffID;
    }
    
    public String getStaffLoginID() {
        return staffLoginID;
    }

    public void setStaffLoginID(String staffLoginID) {
        this.staffLoginID = staffLoginID;
    }

    public String getStaffPassword() {
        return staffPassword;
    }

    public void setStaffPassword(String staffPassword) {
        this.staffPassword = staffPassword;
    }

    public String getStaffName() {
        return staffName;
    }

    public void setStaffName(String staffName) {
        this.staffName = staffName;
    }

    public String getStaffGSM() {
        return staffGSM;
    }

    public void setStaffGSM(String staffGSM) {
        this.staffGSM = staffGSM;
    }

    public String getStaffMail() {
        return staffMail;
    }

    public void setStaffMail(String staffMail) {
        this.staffMail = staffMail;
    }

    public String getStaffAddress() {
        return staffAddress;
    }

    public void setStaffAddress(String staffAddress) {
        this.staffAddress = staffAddress;
    }
    
}