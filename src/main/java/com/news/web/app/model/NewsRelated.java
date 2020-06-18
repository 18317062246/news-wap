/**
 * @Author: Steven.yu
 * @Description: 房源
 * @CreateTime: 2020/06/17 17:39:46
 */
package com.news.web.app.model;

import lombok.Data;

@Data
public class NewsRelated {

    private Integer id;
    private Integer newsid;
    private String oid;
    private String otype;
    private String pubdate;
}
