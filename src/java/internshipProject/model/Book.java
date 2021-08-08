/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package internshipProject.model;


public class Book {

    String bookID;
    String bookName;
    String bookISBN;
    String bookPublishingYear;
    String bookTranslatorID;
    String bookPublisherID;
    String bookAuthorID;
    String bookCategory;
    String bookLocation;
    String bookCurrentNumber;

    public Book() {
        System.out.println("Kitap nesnesi oluşturuldu.");
    }

    public String getBookID() {
        return bookID;
    }

    public void setBookID(String bookID) {
        this.bookID = bookID;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getBookISBN() {
        return bookISBN;
    }

    public void setBookISBN(String bookISBN) {
        this.bookISBN = bookISBN;
    }

    public String getBookPublishingYear() {
        return bookPublishingYear;
    }

    public void setBookPublishingYear(String bookPublishingYear) {
        this.bookPublishingYear = bookPublishingYear;
    }

    public String getBookTranslatorID() {
        return bookTranslatorID;
    }

    public void setBookTranslatorID(String bookTranslatorID) {
        this.bookTranslatorID = bookTranslatorID;
    }

    public String getBookPublisherID() {
        return bookPublisherID;
    }

    public void setBookPublisherID(String bookPublisherID) {
        this.bookPublisherID = bookPublisherID;
    }

    public String getBookAuthorID() {
        return bookAuthorID;
    }

    public void setBookAuthorID(String bookAuthorID) {
        this.bookAuthorID = bookAuthorID;
    }

    public String getBookCategory() {
        return bookCategory;
    }

    public void setBookCategory(String bookCategory) {
        this.bookCategory = bookCategory;
    }

    public String getBookLocation() {
        return bookLocation;
    }

    public void setBookLocation(String bookLocation) {
        this.bookLocation = bookLocation;
    }

    public String getBookCurrentNumber() {
        return bookCurrentNumber;
    }

    public void setBookCurrentNumber(String bookCurrentNumber) {
        this.bookCurrentNumber = bookCurrentNumber;
    }

}
