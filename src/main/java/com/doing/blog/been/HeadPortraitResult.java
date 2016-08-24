package com.doing.blog.been;

import java.util.ArrayList;

/**
 * 头像上传的结果。
 */
public class HeadPortraitResult {
    /**
     * 表示图片是否已上传成功。
     */
    public Boolean success;
    public String userid;
    public String username;

    /**
     * 文件名称
     * 即，jsp_source_" + fileName + ".jpg（原图）
     * 或 jsp_avatar" + avatarNumber + "_" + fileName + ".jpg（编辑过的图） 的fileName
     * 其中 avatarNumber 可为 1、2、3
     */
    public String fileName;

    /**
     * 自定义的附加消息。
     */
    public String msg;
    /**
     * 表示原始图片的保存地址。
     */
    public String sourceUrl;
    /**
     * 表示所有头像图片的保存地址，该变量为一个数组。
     */
    public ArrayList avatarUrls;
}
