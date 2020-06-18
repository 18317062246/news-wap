/**
 * @Author: Steven.yu
 * @Description:
 * @CreateTime: 2020/06/17 18:21:17
 */
package com.news.web.app.model.xinfang;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import java.io.Serializable;

@Data
@JsonInclude(JsonInclude.Include.NON_NULL)
public class XinfangResult implements Serializable {



    @JsonProperty("AdName")
    private String adName;//推广名

    @JsonProperty("AveragePrice")
    private Double averagePrice;


    @JsonProperty("BuildingTypes")
    private String buildingTypes;//建筑类型

    @JsonProperty("EstExtId")
    private String estExtId;//子盘编号

    @JsonProperty("EstId")
    private String estId;//楼盘编号

    @JsonProperty("EstType")
    private String estType;//物业类型

    @JsonProperty("Features")
    private String features;//项目特色


    @JsonProperty("NewsId")
    private Integer newsId;

    @JsonProperty("DefaultImage")
    private String defaultImage;

    @JsonProperty("BaseNewProp")
    private BaseNewProp baseNewProp;

    @JsonProperty("RoomsName")
    private String roomsName;

    @JsonProperty("oid")
    private String oid;


}
