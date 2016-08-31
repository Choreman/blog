package com.doing.blog.service.impl;

import com.doing.blog.been.PageBean;
import com.doing.blog.mapper.AdminMapper;
import com.doing.blog.mapper.ArticleMapper;
import com.doing.blog.mapper.UserMapper;
import com.doing.blog.model.Admin;
import com.doing.blog.model.Article;
import com.doing.blog.model.User;
import com.doing.blog.service.AdminService;
import com.doing.blog.util.Encrypt;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminMapper adminMapper;
    @Autowired
    private ArticleMapper articleMapper;
    @Autowired
    private UserMapper userMapper;


    public Admin login(Admin admin) {
        admin.setPassword(Encrypt.e(admin.getPassword()));
        return adminMapper.login(admin);
    }

    public Admin selectByPrimaryKey(String aid) throws Exception {
        Admin admin = adminMapper.selectByPrimaryKey(aid);
        return admin;
    }

    public int updateByPrimaryKeySelective(Admin admin) throws Exception {
        return adminMapper.updateByPrimaryKeySelective(admin);
    }

    public Map dataTable(String searchText, int sEcho, PageBean pageBean) {
        Map<String, Object> parameterMap = new HashMap<String, Object>();
        if (searchText != null && !searchText.trim().isEmpty()) {
            searchText = "%"+searchText+"%";
            parameterMap.put("searchText",searchText);
        } if(pageBean.getSort()!=null&& !pageBean.getSort().trim().isEmpty()){
            parameterMap.put("sort",pageBean.getSort());
            parameterMap.put("order",pageBean.getOrder());
        }
        parameterMap.put("pageOffset", pageBean.getPageOffset());
        parameterMap.put("size", pageBean.getSize());
        List<Article> list  = articleMapper.selectAllArticle(parameterMap);
        int cout = articleMapper.countAll(parameterMap);
        pageBean.init(cout,list);
        Map<String,Object> map=new HashedMap();
        map.put("sEcho", sEcho+1);//不知道是什么,每次加一就好
        map.put("iTotalRecords", list.size());//当前总数据条数
        map.put("iTotalDisplayRecords",cout);//查询结果的总条数
        map.put("aaData", list);
        return map;
    }

    public Map dataTableUser(String searchText, int sEcho, PageBean pageBean) {
        Map<String, Object> parameterMap = new HashMap<String, Object>();
        if (searchText != null && !searchText.trim().isEmpty()) {
            searchText = "%"+searchText+"%";
            parameterMap.put("searchText",searchText);
        } if(pageBean.getSort()!=null&& !pageBean.getSort().trim().isEmpty()){
            parameterMap.put("sort",pageBean.getSort());
            parameterMap.put("order",pageBean.getOrder());
        }
        parameterMap.put("pageOffset", pageBean.getPageOffset());
        parameterMap.put("size", pageBean.getSize());

        List<User> list  = userMapper.selectAllUser(parameterMap);
        int cout = userMapper.countAll(parameterMap);

        pageBean.init(cout,list);
        Map<String,Object> map=new HashedMap();
        map.put("sEcho", sEcho+1);//不知道是什么,每次加一就好
        map.put("iTotalRecords", list.size());//当前总数据条数
        map.put("iTotalDisplayRecords",cout);//查询结果的总条数
        map.put("aaData", list);
        return map;
    }
}
