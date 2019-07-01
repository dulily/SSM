package cn.duli.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class User {
    private Integer id;

    private String username;

    private String password;

    private String email;

    private Date registTime;

    private String gender;

    private String picture;

    private String phone;

    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date lastLoginTime;

    private String nickname;

    public User(Integer id, String username,
                String password, String email,
                Date registTime, String gender,
                String picture, String phone,
                Date lastLoginTime, String nickname) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.email = email;
        this.registTime = registTime;
        this.gender = gender;
        this.picture = picture;
        this.phone = phone;
        this.lastLoginTime = lastLoginTime;
        this.nickname = nickname;
    }

    public User() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public Date getRegistTime() {
        return registTime;
    }

    public void setRegistTime(Date registTime) {
        this.registTime = registTime;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Date getLastLoginTime() {
        return lastLoginTime;
    }

    public void setLastLoginTime(Date lastLoginTime) {
        this.lastLoginTime = lastLoginTime;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", registTime=" + registTime +
                ", gender='" + gender + '\'' +
                ", picture='" + picture + '\'' +
                ", phone='" + phone + '\'' +
                ", lastLoginTime=" + lastLoginTime +
                ", nickname='" + nickname + '\'' +
                '}';
    }
}