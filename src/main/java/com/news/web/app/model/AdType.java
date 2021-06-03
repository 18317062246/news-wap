package com.news.web.app.model;


import lombok.Data;


/**
 *
 * @description: 广告类型
 *
 * @author: 蔡瑞林
 *
 * @create: 2021-05-28 11：36
 **/
@SuppressWarnings("all")
@Data
public class AdType {
    private String Name;
    private String Subtitle;
    private String Type;
    private String Target;
    private Integer MinVersion;
    private String Icon;
    private String ItemId;
    private Integer ParentId;
    private Boolean IsShowWxApp;
}
