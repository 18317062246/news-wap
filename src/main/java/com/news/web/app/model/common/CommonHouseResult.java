/**
 * @Author: Steven.yu
 * @Description:
 * @CreateTime: 2020/06/19 08:59:08
 */
package com.news.web.app.model.common;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.news.web.app.model.esf.ESFResult;
import com.news.web.app.model.xiaoqu.XiaoQuResult;
import com.news.web.app.model.xinfang.XinfangResult;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@JsonInclude(JsonInclude.Include.NON_NULL)
@NoArgsConstructor
@AllArgsConstructor
public class CommonHouseResult implements Serializable {

    @JsonProperty("XinfangResult")
    private XinfangResult xinfangResult;

    @JsonProperty("EsfResult")
    private ESFResult esfResult;

    @JsonProperty("XiaoQuResult")
    private XiaoQuResult xiaoQuResult;
}
