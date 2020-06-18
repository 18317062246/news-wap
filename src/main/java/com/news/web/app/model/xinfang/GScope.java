/**
 * @Author: Steven.yu
 * @Description:
 * @CreateTime: 2020/06/17 23:06:53
 */
package com.news.web.app.model.xinfang;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import java.io.Serializable;

@JsonInclude(JsonInclude.Include.NON_NULL)
@Data
public class GScope implements Serializable {

    @JsonProperty("GScopeCnName")
    private String gScopeCnName;
}
