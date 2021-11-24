/**
 * author: yuhai
 * CreateTime: 2021/11/24
 * Description:资讯详情页返回类
 */
package com.news.web.app.model.response;

import com.fasterxml.jackson.databind.PropertyNamingStrategy;
import com.fasterxml.jackson.databind.annotation.JsonNaming;
import lombok.Data;

@Data
@JsonNaming(value = PropertyNamingStrategy.UpperCamelCaseStrategy.class)
public class NewsDetailResponse {

    private String url;

    private String title;

    private String publishDate;
}
