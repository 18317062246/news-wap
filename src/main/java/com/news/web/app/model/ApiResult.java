/**
 * author: yuhai
 * CreateTime: 2021/11/24
 * Description: news-api公共返回类
 */
package com.news.web.app.model;

import com.fasterxml.jackson.databind.PropertyNamingStrategy;
import com.fasterxml.jackson.databind.annotation.JsonNaming;
import lombok.Data;

@Data
@JsonNaming(value = PropertyNamingStrategy.UpperCamelCaseStrategy.class)
public class ApiResult<T> {

    private Boolean success;

    private Integer code;

    private String msg;

    private T result;
}
