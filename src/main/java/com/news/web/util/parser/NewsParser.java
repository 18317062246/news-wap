package com.news.web.util.parser;

import com.news.web.app.model.param.InsertLogParam;
import com.news.web.util.StringResource;

/**
 * @author: Created by yuhai on 2021/05/12
 * 资讯解析器
 */
public class NewsParser {

    private NewsParser(){}

    /**
     * 组装成一个InsertLogParam对象
     */
    public static InsertLogParam build(String appName , String cityCode , String clientIp , String jPushId , String objectId , String postId,
                                       String sourceChild , String trackId , String userId){
        InsertLogParam param = new InsertLogParam();
        param .setAppName(appName);
        param.setCityCode(cityCode);
        param.setClientIP(clientIp);
        param.setJpushId(jPushId);
        param.setObjectID(objectId);
        param.setPostId(postId);
        param.setSource(StringResource.NEWS);
        param.setSourceChild(sourceChild);
        param.setTrackID(trackId);
        param.setUserId(userId);
        return param;
    }
}
