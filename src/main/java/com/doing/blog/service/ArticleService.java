package com.doing.blog.service;

import com.doing.blog.model.Article;

import java.util.List;

public interface ArticleService {

    /**
     * 添加博客文章
     * @return
     * @throws Exception
     */
    int insertArticle(Article article) throws Exception;

    /**
     * 查询所有的博客文章
     * @return
     * @throws Exception
     */
    List<Article> selectAll() throws Exception;

    /**
     * 查询指定id的博客文章关联查询管理员关联查询用户评论
     * @return
     */
    Article selectArticleAdminUsercommentUserById(Long articleId) throws Exception;

    /**
     * 删除博客文章
     * @param articleId
     * @return
     * @throws Exception
     */
    int deleteByPrimaryKey(Long articleId) throws Exception;

}
