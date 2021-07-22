package com.news.web.app.model.esf;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

/**
 * @author: Created by yuhai on 2021/07/22
 */
@Data
public class KeyValueResult {

    @JsonProperty("Key")
    private String key;

    @JsonProperty("Value")
    private String value;
}
