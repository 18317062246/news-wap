/**
 * @Author: Steven.yu
 * @Description:
 * @CreateTime: 2020/06/17 23:06:16
 */
package com.news.web.app.model.xinfang;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import java.io.Serializable;

@Data
@JsonInclude(JsonInclude.Include.NON_NULL)
public class BaseNewProp implements Serializable {

    @JsonProperty("District")
    private District district;

    @JsonProperty("Address")
    private String address;

    @JsonProperty("GScope")
    private GScope gScope;

    @JsonProperty("Status")
    private String status;
}
