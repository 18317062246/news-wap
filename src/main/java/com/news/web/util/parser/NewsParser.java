package com.news.web.util.parser;

import com.news.web.app.model.param.InsertLogParam;
import com.news.web.util.StringResource;
import org.apache.commons.lang3.StringUtils;

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
                                       String sourceChild , String trackId , String userId, String title , String downloadChannel){
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
        param.setValueName(title);
        //渠道字段不为空,就给对象属性赋值
        if(!StringUtils.isEmpty(downloadChannel)){
            param.setCalledSem(downloadChannel);
            param.setCalledHpml(downloadChannel);
            param.setFirstQudao(downloadChannel);
            param.setSecondQudao(downloadChannel);
        }
        return param;
    }
}
