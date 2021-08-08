/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package internshipProject.model;


public class Member {

    String memberID;
    String memberLoginID;
    String memberPassword;
    String memberName;
    String memberGSM;
    String memberMail;
    String memberAddress;
    String memberType;
    String memberBanStatus;

    public Member() {
        System.out.println("Üye nesnesi oluşturuldu.");
    }

    public String getMemberID() {
        return memberID;
    }

    public void setMemberID(String memberID) {
        this.memberID = memberID;
    }

    public String getMemberLoginID() {
        return memberLoginID;
    }

    public void setMemberLoginID(String memberLoginID) {
        this.memberLoginID = memberLoginID;
    }

    public String getMemberPassword() {
        return memberPassword;
    }

    public void setMemberPassword(String memberPassword) {
        this.memberPassword = memberPassword;
    }

    public String getMemberName() {
        return memberName;
    }

    public void setMemberName(String memberName) {
        this.memberName = memberName;
    }

    public String getMemberGSM() {
        return memberGSM;
    }

    public void setMemberGSM(String memberGSM) {
        this.memberGSM = memberGSM;
    }

    public String getMemberMail() {
        return memberMail;
    }

    public void setMemberMail(String memberMail) {
        this.memberMail = memberMail;
    }

    public String getMemberAddress() {
        return memberAddress;
    }

    public void setMemberAddress(String memberAddress) {
        this.memberAddress = memberAddress;
    }

    public String getMemberType() {
        return memberType;
    }

    public void setMemberType(String memberType) {
        this.memberType = memberType;
    }

    public String getMemberBanStatus() {
        return memberBanStatus;
    }

    public void setMemberBanStatus(String memberBanStatus) {
        this.memberBanStatus = memberBanStatus;
    }

}
