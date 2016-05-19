package com.ihelin.book.db.entity;

import java.math.BigDecimal;
import java.util.Date;

public class Book {
    private Integer id;

    private String bookName;

    private String author;

    private String img;

    private String isbn;

    private Date createTime;

    private Integer createrId;

    private Integer type;

    private String press;

    private Integer number;

    private BigDecimal price;

    private BigDecimal promotionPrice;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getCreaterId() {
        return createrId;
    }

    public void setCreaterId(Integer createrId) {
        this.createrId = createrId;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getPress() {
        return press;
    }

    public void setPress(String press) {
        this.press = press;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public BigDecimal getPromotionPrice() {
        return promotionPrice;
    }

    public void setPromotionPrice(BigDecimal promotionPrice) {
        this.promotionPrice = promotionPrice;
    }
}