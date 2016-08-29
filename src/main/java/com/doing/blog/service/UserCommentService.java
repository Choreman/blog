package com.doing.blog.service;

import com.doing.blog.model.UserComment;

import java.util.List;

public interface UserCommentService {

    /**
     * 根据博客文章查询相关的用户评论关联查询用户信息
     * @param articleId
     * @return
     */
    List<UserComment> selectUsercommentUserByArticleId(Long articleId) throws Exception;

}
