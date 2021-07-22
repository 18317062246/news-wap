/**
 * @Author: Steven.yu
 * @Description:
 * @CreateTime: 2020/06/17 20:05:16
 */
package com.news.web.app.model.esf;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import java.io.Serializable;

@JsonInclude(JsonInclude.Include.NON_NULL)
@Data
public class ESFResult implements Serializable {

    @JsonProperty("EstateName")
    private String estateName;

    @JsonProperty("Address")
    private String address;


    @JsonProperty("PropertyType")
    private String propertyType;

    @JsonProperty("KeyWords")
    private String keyWords;


    @JsonProperty("NewsId")
    private Integer newsId;

    @JsonProperty("FullImagePath")
    private String fullImagePath;

    @JsonProperty("SalePrice")
    private Long salePrice;

    @JsonProperty("Title")
    private String title;

    @JsonProperty("oid")
    private String oid;

    @JsonProperty("SalePriceString")
    private String salePriceString;

    @JsonProperty("RoomCount")
    private Integer roomCount;

    @JsonProperty("HallCount")
    private Integer hallCount;

    @JsonProperty("Garea")
    private Double gArea;

    @JsonProperty("RegionName")
    private String regionName;

    @JsonProperty("GscopeName")
    private String gScopeName;

    @JsonProperty("TagTitle")
    private String tagTitle;

    @JsonProperty("UnitSalePrice")
    private Long unitSalePrice;

    @JsonProperty("GuidingPrice")
    private Long guidingPrice;

    @JsonProperty("GuidingSalePriceStr")
    private KeyValueResult guidingSalePriceStr;
}
