package cn.duli.mapper;

import cn.duli.pojo.Comment;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CommentMapper {

    /**
     * 前台
     * 用户评论管理
     */

    //新增评论
    void insertComment(Comment comment);

    //根据新闻id查看当前新闻下的评论
    List<Comment> selectCommentByNewsId(@Param("newsid")Integer newsid);

    //根据用户id查询当前用户下的评论
    List<Comment> selectCommentByUserId(@Param("userid")Integer userid);

    //用户根据评论id删除评论
    void deleteByCommentId(@Param("id")Integer id);



    /**
     * 后台
     * 管理员评论管理
     */

    //管理员查看所有评论
    List<Comment> selectComments();
}