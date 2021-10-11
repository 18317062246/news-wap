package com.news.web.util;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author: Created by yuhai on 2020/12/04
 * 日期工具类
 */
@SuppressWarnings("all")
public class DateHelper {

    /**
     * 定义格式化日期时间
     */
    public static final String FORMAT_DATE = "yyyy年MM月dd日";


    private DateHelper(){}

    /**
     * 日期时间为字符串时间
     *
     * @param date
     * @return
     */
    @SuppressWarnings("all")
    public static String dateToString(Date date) {
        String result = new SimpleDateFormat(FORMAT_DATE).format(date);
        return result;
    }

}
