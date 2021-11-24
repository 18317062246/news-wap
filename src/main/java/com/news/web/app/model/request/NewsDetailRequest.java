/**
 * author: yuhai
 * CreateTime: 2021/11/24
 * Description: 资讯详情页request
 */
package com.news.web.app.model.request;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
public class NewsDetailRequest {

    @ApiModelProperty("下载渠道")
    private String downloadChannel;

    private String entry;
}
