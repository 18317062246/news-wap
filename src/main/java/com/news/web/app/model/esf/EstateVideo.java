package com.news.web.app.model.esf;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

/**
 * @author: Created by yuhai on 2021/07/23
 */
@Data
public class EstateVideo {

    @JsonProperty("EstateId")
    private Long estateId;

    @JsonProperty("VideoPath")
    private String videoPath;

    @JsonProperty("VideoImage")
    private String videoImage;

    @JsonProperty("Remark")
    private String remark;
}
