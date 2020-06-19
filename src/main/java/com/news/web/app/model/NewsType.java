package com.news.web.app.model;


import lombok.Data;

import java.util.List;

/**
 *
 * @description: 资讯类型
 *
 * @author: zouyuan1
 *
 * @create: 2020-05-27 10:24
 **/
@SuppressWarnings("all")
@Data
public class NewsType {
    private Integer Id;
    private String ColumnsName;
    private String Location;
    private Integer TopId;
    private List<NewsType> ChildList;
}
