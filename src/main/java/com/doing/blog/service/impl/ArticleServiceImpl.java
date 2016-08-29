package com.doing.blog.service.impl;

import com.doing.blog.mapper.ArticleMapper;
import com.doing.blog.model.Article;
import com.doing.blog.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class ArticleServiceImpl implements ArticleService{

    @Autowired
    private ArticleMapper articleMapper;

    public int insertArticle(Article article) throws Exception {
        article.setCreateDate(new Date());      //设置博客文章发表的时间
        article.setVisitsNumber(Long.valueOf(0));   //初始化博客文章的访问量为0
        return articleMapper.insert(article);
    }

    public List<Article> selectAll() throws Exception {
        return articleMapper.selectAll();
    }

    public Article selectArticleAdminUsercommentUserById(Long articleId) throws Exception {
        Article article = articleMapper.selectArticleAdminUsercommentUserById(articleId);
        return article;
    }
}
