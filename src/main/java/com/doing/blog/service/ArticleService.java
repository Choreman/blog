package com.doing.blog.service;

import com.doing.blog.model.Article;

public interface ArticleService {

    /**
     * 添加博客文章
     * @return
     * @throws Exception
     */
    int insertArticle(Article article) throws Exception;

}
