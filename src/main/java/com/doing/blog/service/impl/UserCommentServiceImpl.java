package com.doing.blog.service.impl;

import com.doing.blog.mapper.UserCommentMapper;
import com.doing.blog.model.UserComment;
import com.doing.blog.service.UserCommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class UserCommentServiceImpl implements UserCommentService{

    @Autowired
    private UserCommentMapper userCommentMapper;

    public List<UserComment> selectUsercommentUserByArticleId(Long articleId) throws Exception {
        List<UserComment> userCommentList = userCommentMapper.selectUsercommentUserByArticleId(articleId);
        return userCommentList;
    }

    public int insertUsercomment(UserComment userComment) {
        userComment.setCreateTime(new Date());  //设置创建时间
        return userCommentMapper.insert(userComment);
    }

    public int deleteUsercommentByArticleId(Long articleId) {
        return userCommentMapper.deleteUsercommentByArticleId(articleId);
    }

    public int deleteUsercommentByUserId(Long uId) {
        return userCommentMapper.deleteUsercommentByUserId(uId);
    }
}
