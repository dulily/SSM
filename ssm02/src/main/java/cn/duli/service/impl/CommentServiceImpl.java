package cn.duli.service.impl;
import cn.duli.mapper.CommentMapper;
import cn.duli.pojo.Comment;
import cn.duli.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("commentService")
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentMapper commentMapper;

    @Override
    public void insertComment(Comment comment) {
        commentMapper.insertComment(comment);
    }

    @Override
    public List<Comment> selectCommentByNewsId(Integer newsid) {
        return commentMapper.selectCommentByNewsId(newsid);
    }

    @Override
    public List<Comment> selectCommentByUserId(Integer userid) {
        return commentMapper.selectCommentByUserId(userid);
    }

    @Override
    public void deleteByCommentId(Integer id) {
        commentMapper.deleteByCommentId(id);
    }

    @Override
    public List<Comment> selectComments() {
        return commentMapper.selectComments();
    }
}
