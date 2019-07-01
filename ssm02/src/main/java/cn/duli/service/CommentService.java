package cn.duli.service;


import cn.duli.pojo.Comment;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CommentService {

    /**
     * 前台
     * 用户评论管理
     */

    /**
     * 新增评论
     */
    void insertComment(Comment comment);

    /**
     * 根据新闻id查看当前新闻下的评论
     */
    List<Comment> selectCommentByNewsId(Integer newsid);

    /**
     * 根据用户id查询当前用户下的评论
     */
    List<Comment> selectCommentByUserId(Integer userid);

    /**
     * 用户根据评论id删除评论
     */
    void deleteByCommentId(Integer id);




    /**
     * 后台
     * 管理员评论管理
     */

    /**
     * 管理员查看所有评论
     */
    List<Comment> selectComments();
}
