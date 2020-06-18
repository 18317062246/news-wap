/**
 * @Author: Steven.yu
 * @Description: 新房结果对象
 * @CreateTime: 2020/06/18 12:21:18
 */
package com.news.web.app.model.xinfang;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import java.io.Serializable;

@JsonInclude(JsonInclude.Include.NON_NULL)
@Data
public class District implements Serializable {

    @JsonProperty("GScopeCnName")
    private String gScopeCnName;
}
