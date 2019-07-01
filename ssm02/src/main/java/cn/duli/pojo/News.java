package cn.duli.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class News {
    private Integer id;

    private Integer categoryid;

    private String title;

    private String author;

    private String content;

    private String username;

    private String pictureUrl;

    //解决后台时间传到前台格式转换问题
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date createtime;


    private Category category;

    public News(Integer id, Integer categoryid, String title, String author,
                String content, String username, String pictureUrl,
                Date createtime, Category category) {
        this.id = id;
        this.categoryid = categoryid;
        this.title = title;
        this.author = author;
        this.content = content;
        this.username = username;
        this.pictureUrl = pictureUrl;
        this.createtime = createtime;
        this.category = category;
    }

    public News() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCategoryid() {
        return categoryid;
    }

    public void setCategoryid(Integer categoryid) {
        this.categoryid = categoryid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author == null ? null : author.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPictureUrl() {
        return pictureUrl;
    }

    public void setPictureUrl(String pictureUrl) {
        this.pictureUrl = pictureUrl == null ? null : pictureUrl.trim();
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    @Override
    public String toString() {
        return "News{" +
                "id=" + id +
                ", categoryid=" + categoryid +
                ", title='" + title + '\'' +
                ", author='" + author + '\'' +
                ", content='" + content + '\'' +
                ", username='" + username + '\'' +
                ", pictureUrl='" + pictureUrl + '\'' +
                ", createtime=" + createtime +
                ", category=" + category +
                '}';
    }
}