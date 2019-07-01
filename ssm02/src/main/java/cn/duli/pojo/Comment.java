package cn.duli.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class Comment {
    private Integer id;

    private Integer newsid;

    private Integer userid;

    private String content;

    //解决后台时间传到前台格式转换问题
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date createtime;

    private User user;

    private News news;

    public Comment(Integer id, Integer newsid,
                   Integer userid, String content,
                   Date createtime, User user, News news) {
        this.id = id;
        this.newsid = newsid;
        this.userid = userid;
        this.content = content;
        this.createtime = createtime;
        this.user = user;
        this.news = news;
    }

    public Comment() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getNewsid() {
        return newsid;
    }

    public void setNewsid(Integer newsid) {
        this.newsid = newsid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public News getNews() {
        return news;
    }

    public void setNews(News news) {
        this.news = news;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "id=" + id +
                ", newsid=" + newsid +
                ", userid=" + userid +
                ", content='" + content + '\'' +
                ", createtime=" + createtime +
                ", user=" + user +
                ", news=" + news +
                '}';
    }
}