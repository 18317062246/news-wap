package com.news.web.util;

import java.text.DecimalFormat;

@SuppressWarnings("all")
public class NumberUtils {

    private NumberUtils(){}

    private static final String JIN_NUMBER = "#";
    private static final String MILLION_UNIT = "万";
    private static final String BILLION_UNIT = "亿";
    private static final Integer MILLION_INTEGER = 10000;
    private static final Long MILLION_LONG = 10000L;
    private static final Integer BILLION_INTEGER = 100000000;
    private static final Long BILLION_LONG = 100000000L;
    private static final Double MILLION_DOUBLE = 10000D;
    private static final Double BILLION_DOUBLE = 10000000D;

    /**
     * 将一个数字处理为以万为单位的字符串
     */
    public static String getTenThousandOfANumber(Integer num) {
        if (num < MILLION_INTEGER) {
            return String.valueOf(num);
        }
        if(num < BILLION_INTEGER){
            String numStr = new DecimalFormat(JIN_NUMBER).format(num / MILLION_INTEGER);
            return numStr + MILLION_UNIT;
        }else {
            String numStr = new DecimalFormat(JIN_NUMBER).format(num / BILLION_INTEGER);
            return numStr + BILLION_UNIT;
        }
    }

    /**
     * 将一个数字处理为以万为单位的字符串
     */
    public static String getTenThousandOfANumber(Long num) {
        if (num < MILLION_LONG) {
            return String.valueOf(num);
        }
        if(num < BILLION_LONG){
            String numStr = new DecimalFormat(JIN_NUMBER).format(num / MILLION_LONG);
            return numStr + MILLION_UNIT;
        }else {
            String numStr = new DecimalFormat(JIN_NUMBER).format(num / BILLION_LONG);
            return numStr + BILLION_UNIT;
        }
    }




}