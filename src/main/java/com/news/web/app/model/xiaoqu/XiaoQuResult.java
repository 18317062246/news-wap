/**
 * @Author: Steven.yu
 * @Description:
 * @CreateTime: 2020/06/18 21:11:22
 */
package com.news.web.app.model.xiaoqu;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import java.io.Serializable;

@JsonInclude(JsonInclude.Include.NON_NULL)
@Data
public class XiaoQuResult implements Serializable {

    @JsonProperty("EstateName")
    private String estateName;//小区名称

    @JsonProperty("EstateAlias")
    private String estateAlias;

    @JsonProperty("Address")
    private String address;

    @JsonProperty("PropertyType")
    private String propertyType;

    @JsonProperty("ImagePath")
    private String imagePath;

    @JsonProperty("SaleAvgPrice")
    private Long saleAvgPrice;

    @JsonProperty("RentAvgPrice")
    private Double rentAvgPrice;

    @JsonProperty("RealAvgPrice")
    private Double realAvgPrice;

    @JsonProperty("MaxSalePrice")
    private Double maxSalePrice;

    @JsonProperty("MinSalePrice")
    private Double minSalePrice;

    @JsonProperty("MaxRentPrice")
    private Double maxRentPrice;

    @JsonProperty("MinRentPrice")
    private Double minRentPrice;

    @JsonProperty("Oid")
    private String oid;

    @JsonProperty("SaleAvgPriceString")
    private Long saleAvgPriceString;

    @JsonProperty("RegionName")
    private String regionName;

    @JsonProperty("GscopeName")
    private String gScopeName;

    @JsonProperty("SaleNumber")
    private Integer saleNumber;

    @JsonProperty("RentNumber")
    private Integer rentNumber;

    @JsonProperty("OpDate")
    private Long opDate;

    @JsonProperty("IsDealHot")
    private Boolean isDealHot;

    @JsonProperty("GuidingPrice")
    private Long guidingPrice;

    @JsonProperty("IsVideo")
    private Boolean isVideo;

}
