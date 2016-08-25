package com.doing.blog.controller;

import com.doing.blog.model.Article;
import com.doing.blog.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 博客文章控制器，继承基础的控制器
 */
@Controller
@RequestMapping("/admin/article")
public class ArticleController extends BaseController<Article, Long> {

    @Autowired
    private ArticleService articleService;



}
