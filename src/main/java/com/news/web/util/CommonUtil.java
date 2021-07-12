package com.news.web.util;

import java.time.Instant;

/**
 * @author: Created by yuhai on 2021/07/12
 */
public class CommonUtil {

    private CommonUtil(){}

    /**
     * 获取当前时间戳
     */
    public static Long getCurrentMills(){
        return Instant.now().getEpochSecond();
    }
}
