package com.news.web.util;

import cn.hutool.core.net.URLDecoder;
import com.alibaba.fastjson.JSONObject;

import javax.servlet.http.HttpServletRequest;
import java.nio.charset.Charset;
import java.time.Instant;
import java.util.LinkedHashMap;
import java.util.Map;

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

    /**
     * get请求无法正常进入，将request里面的参数进行转换
     */
    public static String getQuerysParam(HttpServletRequest request) {
        Map<String , Object> map = new LinkedHashMap();

        String query = request.getQueryString();

        String[] pairs = query.split("&");

        for (String pair : pairs) {
            int idx = pair.indexOf("=");
            map.put(URLDecoder.decode(pair.substring(0, idx), Charset.forName("UTF-8")), URLDecoder.decode(pair.substring(idx + 1), Charset.forName("UTF-8")));
        }
        //将Map转换为对象
        String json  = JSONObject.toJSONString(map);
        return json;
    }
}
