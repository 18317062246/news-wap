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

    @JsonProperty("SsalePrice")
    private Double salePrice;

    @JsonProperty("Title")
    private String title;

    @JsonProperty("oid")
    private String oid;

    @JsonProperty("SalePriceString")
    private String salePriceString;
}
