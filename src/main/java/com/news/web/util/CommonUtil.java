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

    public static void main(String[] args) {
        System.out.println(getCurrentMills());
    }

    /**
     * 将数字智能转换
     */
    public static String numberFormat(Double data){
        long round = Math.round(data);
        //获取数据
        String result = NumberUtils.getTenThousandOfANumber((int)round);
        return result.substring(0 , result.length() - 1);
    }
}
