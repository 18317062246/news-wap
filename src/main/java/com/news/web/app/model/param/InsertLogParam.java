package com.news.web.app.model.param;

import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Objects;

/**
 * @author: Created by yuhai on 2021/05/12
 * 插入访问记录param
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class InsertLogParam {

    private String appName;

    @ApiModelProperty("城市编号")
    private String cityCode;

    @ApiModelProperty("客户端访问ip")
    private String clientIP;

    @ApiModelProperty("推送id")
    private String jpushId;

    @ApiModelProperty("对象id")
    private String objectID;

    private String postId;

    private String source;

    private String sourceChild;

    private String trackID;

    private String userId;

    public void setAppName(String appName) {
        if(Objects.isNull(appName))
            this.appName = "";
        this.appName = appName;
    }

    public void setCityCode(String cityCode) {
        if(Objects.isNull(cityCode))
            this.cityCode = "";
        this.cityCode = cityCode;
    }

    public void setClientIP(String clientIP) {
        if(Objects.isNull(clientIP))
            this.clientIP = "";
        this.clientIP = clientIP;
    }

    public void setJpushId(String jpushId) {
        if(Objects.isNull(jpushId))
            this.jpushId = "";
        this.jpushId = jpushId;
    }

    public void setObjectID(String objectID) {
        this.objectID = objectID;
    }

    public void setPostId(String postId) {
        if(Objects.isNull(postId))
            this.postId = "";
        this.postId = postId;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public void setSourceChild(String sourceChild) {
        if(Objects.isNull(sourceChild))
            this.sourceChild = "";
        this.sourceChild = sourceChild;
    }

    public void setTrackID(String trackID) {
        if(Objects.isNull(trackID))
            this.trackID = "";
        this.trackID = trackID;
    }

    public void setUserId(String userId) {
        if(Objects.isNull(userId))
            this.userId = "";
        this.userId = userId;
    }
}
